package com.yywl.projectT.bo;

import java.util.Date;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yywl.projectT.bean.enums.WithdrawalsEnum;
import com.yywl.projectT.dao.TransactionDetailsDao;
import com.yywl.projectT.dao.UserDao;
import com.yywl.projectT.dao.WithdrawalsDao;
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

	private static final Log log=LogFactory.getLog(WithdrawalsBo.class);
	
	@Autowired
	WithdrawalsDao withdrawalsDao;

	public void agree(long id) throws Exception {
		WithdrawalsDmo withdrawals = this.withdrawalsDao.findOne(id);
		if (withdrawals == null) {
			log.error("订单不存在");
			throw new Exception("订单不存在");
		}
		if (withdrawals.getState()!=WithdrawalsEnum.处理中.ordinal()) {
			log.error("该订单已处理");
			throw new Exception("该订单已处理");
		}
		withdrawals.setDealTime(new Date());
		withdrawals.setState(WithdrawalsEnum.提现成功.ordinal());
		UserDmo user = withdrawals.getUser();
		int fee = (int) Math.round(withdrawals.getMoney() * 0.02);
		withdrawals.setDealMoney(withdrawals.getMoney() - fee);
		user.setLockAmount(user.getLockAmount() - withdrawals.getMoney());
		withdrawalsDao.save(withdrawals);
		userDao.save(user);
		TransactionDetailsDmo tran1 = new TransactionDetailsDmo();
		tran1.setCreateTime(withdrawals.getDealTime());
		tran1.setDescription("支付宝提现成功");
		tran1.setMoney(0-withdrawals.getDealMoney());
		tran1.setUser(user);
		tran1.setCalc(false);
		transactionDetailsDao.save(tran1);
		if (fee!=0) {
			TransactionDetailsDmo tran2 = new TransactionDetailsDmo();
			tran2.setCreateTime(withdrawals.getDealTime());
			tran2.setDescription("支付宝提现收取服务费");
			tran2.setMoney(0-fee);
			tran2.setUser(user);
			tran2.setCalc(false);
			transactionDetailsDao.save(tran2);
		}
	}

	public void disagree(long id) throws Exception {
		WithdrawalsDmo withdrawals = this.withdrawalsDao.findOne(id);
		if (withdrawals == null) {
			log.error("订单不存在");
			throw new Exception("订单不存在");
		}
		if (withdrawals.getState()!=WithdrawalsEnum.处理中.ordinal()) {
			log.error("该订单已处理");
			throw new Exception("该订单已处理");
		}
		withdrawals.setDealTime(new Date());
		withdrawals.setState(WithdrawalsEnum.提现失败.ordinal());
		UserDmo user = withdrawals.getUser();
		withdrawalsDao.save(withdrawals);
		user.setLockAmount(user.getLockAmount()-withdrawals.getMoney());
		user.setAmount(user.getAmount()+withdrawals.getMoney());
		this.userDao.save(user);
		TransactionDetailsDmo tran1 = new TransactionDetailsDmo();
		tran1.setCreateTime(withdrawals.getDealTime());
		tran1.setDescription("支付宝提现失败");
		tran1.setMoney(withdrawals.getMoney());
		tran1.setUser(user);
		transactionDetailsDao.save(tran1);
	}

}
