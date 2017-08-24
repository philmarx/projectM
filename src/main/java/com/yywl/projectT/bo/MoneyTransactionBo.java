package com.yywl.projectT.bo;

import java.sql.ResultSet;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayFundTransToaccountTransferRequest;
import com.alipay.api.response.AlipayFundTransToaccountTransferResponse;
import com.yywl.projectT.bean.JpushBean;
import com.yywl.projectT.bean.Keys;
import com.yywl.projectT.bean.component.RongCloudBean;
import com.yywl.projectT.dao.ComplaintDao;
import com.yywl.projectT.dao.PayOrderDao;
import com.yywl.projectT.dao.RoomDao;
import com.yywl.projectT.dao.RoomEvaluationDao;
import com.yywl.projectT.dao.RoomMemberDao;
import com.yywl.projectT.dao.TransactionDetailsDao;
import com.yywl.projectT.dao.UserDao;
import com.yywl.projectT.dao.WithdrawalsDao;
import com.yywl.projectT.dmo.ComplaintDmo;
import com.yywl.projectT.dmo.RoomDmo;
import com.yywl.projectT.dmo.RoomEvaluationDmo;
import com.yywl.projectT.dmo.RoomMemberDmo;
import com.yywl.projectT.dmo.TransactionDetailsDmo;
import com.yywl.projectT.dmo.UserDmo;
import com.yywl.projectT.dmo.WithdrawalsDmo;

import io.rong.messages.TxtMessage;

@Service
@Transactional(rollbackOn = Throwable.class)
public class MoneyTransactionBo {
	private static final Log log = LogFactory.getLog(MoneyTransactionBo.class);
	@Autowired
	private UserDao userDao;
	@Autowired
	private TransactionDetailsDao transactionDetailsDao;
	@Autowired
	private RoomMemberDao roomMemberDao;
	@Autowired
	private RongCloudBean rongCloud;

	@Autowired
	private ComplaintDao complaintDao;

	@Autowired
	private RoomDao roomDao;

	@Autowired
	private RoomEvaluationDao roomEvaluationDao;

	@Autowired
	JdbcTemplate jdbc;

	public boolean isMoneyError(UserDmo user) {
		int userAmount = user.getAmount();
		int sumTran = 0;
		String sql = "select count(t.money) c from transaction_details t where t.is_calc=1 and t.user=?";
		List<Integer> list = this.jdbc.query(sql, (ResultSet rs, int num) -> {
			return rs.getInt("c");
		}, user.getId());
		int count = list.isEmpty() ? 0 : list.get(0);
		if (count != 0) {
			sql = "select sum(t.money) s from transaction_details t where t.is_calc=1 and t.user=?";
			list = jdbc.query(sql, (ResultSet rs, int num) -> {
				return rs.getInt("s");
			}, user.getId());
			sumTran = list.isEmpty() ? 0 : list.get(0);
		}
		return userAmount != sumTran;
	}

	/**
	 * 删除房间
	 * 
	 * @param room
	 * @throws Exception
	 */
	@Transactional(rollbackOn = Throwable.class)
	public void deleteRoom(RoomDmo room) {
		String roomName = room.getName();
		List<ComplaintDmo> complaintDmos = this.complaintDao.findByRoom_Id(room.getId());
		this.complaintDao.delete(complaintDmos);
		List<RoomEvaluationDmo> roomEvaluationDmos = this.roomEvaluationDao.findAll();
		this.roomEvaluationDao.delete(roomEvaluationDmos);
		List<RoomMemberDmo> roomMembers = roomMemberDao.findByRoom_Id(room.getId());
		for (RoomMemberDmo roomMemberDmo : roomMembers) {
			if (room.getMoney() != 0) {
				if (roomMemberDmo.isReady()) {
					UserDmo user = roomMemberDmo.getMember();
					user.setAmount(user.getAmount() + room.getMoney());
					user.setLockAmount(user.getLockAmount() - room.getMoney());
					userDao.save(user);
					TransactionDetailsDmo td = new TransactionDetailsDmo();
					td.setCreateTime(new Date());
					td.setDescription("【" + roomName + "】取消，解冻保证金");
					td.setUser(user);
					td.setMoney(room.getMoney());
					transactionDetailsDao.save(td);
				}
			}
			String msg="";
			if (roomMemberDmo.getMember().getId().longValue() != room.getManager().getId().longValue()) {
				msg = "您加入的房间【" + room.getName() + "】已被管理员解散。";
			} else {
				msg = "您创建的房间【" + room.getName() + "】已被管理员解散。";
			}
			try {
				rongCloud.sendSystemTextMsgToOne(roomMemberDmo.getMember().getId(), new TxtMessage(msg, ""));
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			JpushBean.push(msg, roomMemberDmo.getMember().getId() + "");
			roomMemberDao.delete(roomMemberDmo.getId());
		}
		try {
			rongCloud.destoryChatRoom(Keys.Room.PREFIX + room.getId());
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		roomDao.delete(room.getId());
	}

	@Transactional(rollbackOn = Throwable.class)
	public Map<String, String> withdrawalsV2(WithdrawalsDmo withdrawals) throws Exception {
		UserDmo user = withdrawals.getUser();
		int money = withdrawals.getMoney();
		String alipayAccount = withdrawals.getAlipayAccount();
		String withdrawalsMoney = String.format("%.2f", money / 100.0);
		AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do", Keys.Alipay.APP_ID,
				Keys.Alipay.APP_PRIVATE_KEY, "json", "UTF-8", Keys.Alipay.ALIPAY_PUBLIC_KEY, "RSA2");
		AlipayFundTransToaccountTransferRequest request = new AlipayFundTransToaccountTransferRequest();
		String outBizNo = user.getId() + "d" + System.currentTimeMillis();
		request.setBizContent("{" + "\"out_biz_no\":\"" + outBizNo + "\"," + "\"payee_type\":\"ALIPAY_LOGONID\","
				+ "\"payee_account\":\"" + alipayAccount + "\"," + "\"amount\":\"" + withdrawalsMoney + "\","
				+ "\"payer_show_name\":\"后会有期\"," + "\"payee_real_name\":\"" + user.getRealName() + "\","
				+ "\"remark\":\"后会有期app提现\"" + "  }");
		AlipayFundTransToaccountTransferResponse response = alipayClient.execute(request);
		if (response.isSuccess()) {
			Map<String, String> result = new HashMap<>();
			result.put("orderId", response.getOrderId());
			result.put("outBizNo", response.getOutBizNo());
			return result;
		} else {
			throw new Exception(response.getSubMsg());
		}
	}

	@Autowired
	PayOrderDao payOrderDao;

	@Autowired
	WithdrawalsDao withdrawalsDao;

	public void deleteRoom(RoomDmo room, String reason) {
		String roomName = room.getName();
		List<ComplaintDmo> complaintDmos = this.complaintDao.findByRoom_Id(room.getId());
		this.complaintDao.delete(complaintDmos);
		List<RoomEvaluationDmo> roomEvaluationDmos = this.roomEvaluationDao.findAll();
		this.roomEvaluationDao.delete(roomEvaluationDmos);
		List<RoomMemberDmo> roomMembers = roomMemberDao.findByRoom_Id(room.getId());
		for (RoomMemberDmo roomMemberDmo : roomMembers) {
			if (room.getMoney() != 0) {
				if (roomMemberDmo.isReady()) {
					UserDmo user = roomMemberDmo.getMember();
					user.setAmount(user.getAmount() + room.getMoney());
					user.setLockAmount(user.getLockAmount() - room.getMoney());
					userDao.save(user);
					TransactionDetailsDmo td = new TransactionDetailsDmo();
					td.setCreateTime(new Date());
					td.setDescription("【" + roomName + "】取消，解冻保证金");
					td.setUser(user);
					td.setMoney(room.getMoney());
					transactionDetailsDao.save(td);
				}
			}
			String msg="";
			if (roomMemberDmo.getMember().getId().longValue() != room.getManager().getId().longValue()) {
				msg = StringUtils.isEmpty(reason) ? "您加入的房间【" + room.getName() + "】已被管理员解散。"
						: "您加入的房间【" + room.getName() + "】已被管理员解散，原因是" + reason;
			} else {
				msg = StringUtils.isEmpty(reason) ? "您创建的房间【" + room.getName() + "】已被管理员解散。"
						: "您创建的房间【" + room.getName() + "】已被管理员解散，原因是" + reason;
			}
			try {
				rongCloud.sendSystemTextMsgToOne(roomMemberDmo.getMember().getId(), new TxtMessage(msg, ""));
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			JpushBean.push(msg, roomMemberDmo.getMember().getId() + "");
			roomMemberDao.delete(roomMemberDmo.getId());
		}
		try {
			rongCloud.destoryChatRoom(Keys.Room.PREFIX + room.getId());
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		roomDao.delete(room.getId());
	}

}
