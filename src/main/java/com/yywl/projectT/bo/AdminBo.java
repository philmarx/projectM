package com.yywl.projectT.bo;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yywl.projectT.bean.enums.*;
import com.yywl.projectT.dao.AdminDao;
import com.yywl.projectT.dao.RoomDao;
import com.yywl.projectT.dao.RoomMemberDao;
import com.yywl.projectT.dao.TransactionDetailsDao;
import com.yywl.projectT.dao.UserDao;
import com.yywl.projectT.dmo.AdminDmo;
import com.yywl.projectT.dmo.RoomDmo;
import com.yywl.projectT.dmo.RoomMemberDmo;
import com.yywl.projectT.dmo.TransactionDetailsDmo;
import com.yywl.projectT.dmo.UserDmo;

@Service
public class AdminBo {
	
	private final static Log log=LogFactory.getLog(AdminBo.class);
	@Autowired
	AdminDao adminDao;

	public AdminDmo loginByToken(long userId, String token) throws Exception {
		AdminDmo admin = this.adminDao.findOne(userId);
		if (admin == null) {
			log.error("用户不存在");
			throw new Exception("用户不存在");
		}
		if (!admin.getToken().equals(token)) {
			log.error("请重新登录");
			throw new Exception("请重新登录");
		}
		if (admin.getExpire() == null) {
			log.error("登录超时");
			throw new Exception("登录超时");
		}
		if (new Date().after(admin.getExpire())) {
			log.error("登录超时");
			throw new Exception("登录超时");
		}
		return admin;
	}

	@Autowired
	RoomMemberDao roomMemberDao;
	@Autowired
	TransactionDetailsDao transactionDetailsDao;
	@Autowired
	UserDao userDao;
	@Autowired
	RoomDao roomDao;

	@Transactional(rollbackOn = Throwable.class)
	public void fenFa(long id) throws Exception {
		long currentTime = System.currentTimeMillis();
		RoomMemberDmo rm = this.roomMemberDao.findOne(id);
		if (rm.getDealState()!=RoomRequestNotLateState.待处理.ordinal()) {
			log.error("已处理");
			throw new Exception("已处理");
		}
		rm.setLockMoney(false);
		List<RoomMemberDmo> roomMembers = this.roomMemberDao
				.findByRoom_IdAndMember_IdNotAndIsSigned(rm.getRoom().getId(), rm.getMember().getId(), true);
		if (roomMembers.isEmpty()) {
			return;
		}
		rm.setDealState(RoomRequestNotLateState.分发.ordinal());
		RoomDmo room = rm.getRoom();
		int money = room.getMoney();
		UserDmo user = rm.getMember();
		user.setLockAmount(user.getLockAmount() - money);
		userDao.save(user);
		TransactionDetailsDmo tran = new TransactionDetailsDmo();
		tran.setCreateTime(new Date(currentTime));
		tran.setDescription("后台处理，活动结束，因缺席扣除保证金。");
		tran.setUser(user);
		tran.setMoney(0 - money);
		transactionDetailsDao.save(tran);
		int addMoney = money / roomMembers.size();
		for (RoomMemberDmo roomMemberDmo : roomMembers) {
			UserDmo member = roomMemberDmo.getMember();
			TransactionDetailsDmo tranDmo = new TransactionDetailsDmo();
			tranDmo.setCreateTime(new Date(currentTime));
			tranDmo.setDescription("后台处理，活动结束，分得保证金。");
			tranDmo.setUser(member);
			tranDmo.setMoney(money);
			transactionDetailsDao.save(tran);
			member.setAmount(member.getAmount() + addMoney);
			userDao.save(member);
		}
		room.setRemainingMoney(money - addMoney * roomMembers.size());
		this.roomDao.save(room);
		this.roomMemberDao.save(rm);
	}

	@Transactional(rollbackOn = Throwable.class)
	public void jieDong(long id) throws Exception {
		RoomMemberDmo rm = this.roomMemberDao.findOne(id);
		if (rm.getDealState()!=RoomRequestNotLateState.待处理.ordinal()) {
			log.error("已处理");
			throw new Exception("已处理");
		}
		int money = rm.getRoom().getMoney();
		UserDmo user = rm.getMember();
		user.setAmount(user.getAmount() + money);
		user.setLockAmount(user.getLockAmount() - money);
		this.userDao.save(user);
		TransactionDetailsDmo tran = new TransactionDetailsDmo();
		tran.setCreateTime(new Date());
		tran.setDescription("后台处理，解冻保证金。");
		tran.setMoney(money);
		tran.setUser(user);
		this.transactionDetailsDao.save(tran);
		rm.setDealState(RoomRequestNotLateState.返回.ordinal());
		rm.setLockMoney(false);
		roomMemberDao.save(rm);

	}

}
