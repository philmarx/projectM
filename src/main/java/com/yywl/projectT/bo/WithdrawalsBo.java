package com.yywl.projectT.bo;

import java.util.Date;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yywl.projectT.bean.Keys;
import com.yywl.projectT.bean.enums.ActivityStates;
import com.yywl.projectT.bean.enums.WithdrawalsEnum;
import com.yywl.projectT.dao.PayOrderDao;
import com.yywl.projectT.dao.RoomMemberDao;
import com.yywl.projectT.dao.TransactionDetailsDao;
import com.yywl.projectT.dao.UserDao;
import com.yywl.projectT.dao.WithdrawalsDao;
import com.yywl.projectT.dmo.PayOrderDmo;
import com.yywl.projectT.dmo.TransactionDetailsDmo;
import com.yywl.projectT.dmo.UserDmo;
import com.yywl.projectT.dmo.WithdrawalsDmo;

@Service
@Transactional(rollbackOn = Throwable.class)
public class WithdrawalsBo {
	@Autowired
	UserDao userDao;

	@Autowired
	TransactionDetailsDao transactionDetailsDao;

	private static final Log log = LogFactory.getLog(WithdrawalsBo.class);

	@Autowired
	WithdrawalsDao withdrawalsDao;

	@Transactional(rollbackOn = Throwable.class)
	public void agree(long id,long userId) throws Exception {
		WithdrawalsDmo withdrawals = this.withdrawalsDao.findOne(id);
		if (withdrawals == null) {
			log.error("订单不存在");
			throw new Exception("订单不存在");
		}
		if (withdrawals.getState() ==WithdrawalsEnum.提现失败.ordinal()||withdrawals.getState()==WithdrawalsEnum.提现成功.ordinal()) {
			log.error("该订单已处理");
			throw new Exception("该订单已处理");
		}
		UserDmo user = withdrawals.getUser();
		int money = withdrawals.getMoney();
		if (!user.isAuthorized()) {
			log.error(user.getId() + ":请先实名认证");
			throw new Exception("请先实名认证");
		}
		if (user.getLockAmount().intValue() < money) {
			log.error(user.getId() + ":余额不足");
			throw new Exception("余额不足");
		}
		if (money < 10) {
			log.error(user.getId() + ":最少提现0.1元");
			throw new Exception("最少提现0.1元");
		}
		long count = this.roomMemberDao.countByMember_IdAndRoom_StateInAndIsSigned(user.getId(), new Integer[] {
				ActivityStates.进行中.ordinal(), ActivityStates.待评价.ordinal(), ActivityStates.已结束.ordinal() }, true);
		if (count < 1) {
			log.error(user.getId() + ":至少参加过一次成功签到的活动");
			throw new Exception("至少参加过一次成功签到的活动");
		}
		boolean isMoneyError = this.moneyTransactionBo.isMoneyError(user);
		if (isMoneyError) {
			log.error(user.getId() + ":余额存在异常。");
			throw new Exception(user.getId() + ":余额存在异常。");
		}
		user.setLockAmount(user.getLockAmount() - money);
		this.userDao.save(user);
		TransactionDetailsDmo tran = new TransactionDetailsDmo();
		tran.setCalc(false);
		tran.setCreateTime(new Date());
		tran.setDescription("支付宝提现成功");
		tran.setMoney(0 - money);
		tran.setUser(user);
		this.transactionDetailsDao.save(tran);
		PayOrderDmo order = new PayOrderDmo();
		order.setNotifyTime(new Date());
		order.setOutTradeNo(withdrawals.getUser().getId()+"d" + System.currentTimeMillis());
		order.setRefundAmount(money);
		order.setTotalAmount(0);
		order.setTradeNo(withdrawals.getUser().getId()+"d"+System.currentTimeMillis());
		order.setType(Keys.ALIPAY_TYPE);
		this.payOrderDao.save(order);
		withdrawals.setState(WithdrawalsEnum.提现成功.ordinal());
		withdrawals.setDealAdminId(userId);
		withdrawals.setDealMoney(money);
		withdrawals.setDealTime(new Date());
		this.withdrawalsDao.save(withdrawals);
		Map<String, String> result = this.moneyTransactionBo.withdrawalsV2(withdrawals);
		order.setOutTradeNo(result.get("outBizNo"));
		order.setTradeNo(result.get("orderId"));
		this.payOrderDao.save(order);
	}

	@Autowired
	PayOrderDao payOrderDao;

	@Autowired
	RoomMemberDao roomMemberDao;

	@Autowired
	MoneyTransactionBo moneyTransactionBo;

	public void disagree(long id,long userId) throws Exception {
		WithdrawalsDmo withdrawals = this.withdrawalsDao.findOne(id);
		if (withdrawals == null) {
			log.error("订单不存在");
			throw new Exception("订单不存在");
		}
		if (withdrawals.getState() ==WithdrawalsEnum.提现失败.ordinal()||withdrawals.getState()==WithdrawalsEnum.提现成功.ordinal()) {
			log.error("该订单已处理");
			throw new Exception("该订单已处理");
		}
		withdrawals.setDealTime(new Date());
		withdrawals.setDealMoney(0);
		withdrawals.setState(WithdrawalsEnum.提现失败.ordinal());
		UserDmo user = withdrawals.getUser();
		withdrawals.setDealAdminId(userId);
		withdrawalsDao.save(withdrawals);
		user.setLockAmount(user.getLockAmount() - withdrawals.getMoney());
		user.setAmount(user.getAmount() + withdrawals.getMoney());
		this.userDao.save(user);
		TransactionDetailsDmo tran1 = new TransactionDetailsDmo();
		tran1.setCreateTime(withdrawals.getDealTime());
		tran1.setDescription("支付宝提现失败返回金额");
		tran1.setMoney(withdrawals.getMoney());
		tran1.setUser(user);
		transactionDetailsDao.save(tran1);
	}

}
