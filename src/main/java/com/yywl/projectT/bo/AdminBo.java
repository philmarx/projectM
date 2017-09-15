package com.yywl.projectT.bo;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yywl.projectT.bean.Keys;
import com.yywl.projectT.bean.MD5Util;
import com.yywl.projectT.bean.enums.*;
import com.yywl.projectT.dao.AdminDao;
import com.yywl.projectT.dao.NotLateReasonDao;
import com.yywl.projectT.dao.RoomDao;
import com.yywl.projectT.dao.RoomMemberDao;
import com.yywl.projectT.dao.SpreadUserDao;
import com.yywl.projectT.dao.TransactionDetailsDao;
import com.yywl.projectT.dao.UserDao;
import com.yywl.projectT.dmo.AdminDmo;
import com.yywl.projectT.dmo.NotLateReasonDmo;
import com.yywl.projectT.dmo.RoomDmo;
import com.yywl.projectT.dmo.RoomMemberDmo;
import com.yywl.projectT.dmo.SpreadUserDmo;
import com.yywl.projectT.dmo.TransactionDetailsDmo;
import com.yywl.projectT.dmo.UserDmo;

@Service
public class AdminBo {

	private final static Log log = LogFactory.getLog(AdminBo.class);
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
		if (!admin.isEnable()) {
			log.error("账户被禁用");
			throw new Exception("账户被禁用");
		}
		return admin;
	}

	public AdminDmo superLoginByToken(long userId, String token) throws Exception {
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
		if (!admin.isEnable()) {
			log.error("账户被禁用");
			throw new Exception("账户被禁用");
		}
		if (!admin.getIsSuper()) {
			log.error("您没有权限");
			throw new Exception("您没有权限");
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

	@Autowired
	NotLateReasonDao notLateReasonDao;

	@Transactional(rollbackOn = Throwable.class)
	public void fenFa(long id, AdminDmo admin) throws Exception {
		NotLateReasonDmo reasonDmo = this.notLateReasonDao.findOne(id);
		long currentTime = System.currentTimeMillis();
		RoomMemberDmo rm = this.roomMemberDao.findByMember_IdAndRoom_Id(reasonDmo.getUser().getId(),
				reasonDmo.getRoom().getId());
		RoomDmo room = rm.getRoom();
		if (room.getState()<ActivityStates.待评价.ordinal()) {
			throw new Exception("房间还没有结束，不能结算。");
		}
		if (rm.getDealState() != RoomRequestNotLateState.待处理.ordinal()
				|| reasonDmo.getDealState() != RoomRequestNotLateState.待处理.ordinal()) {
			log.error("已处理");
			throw new Exception("已处理");
		}
		reasonDmo.setDealState(RoomRequestNotLateState.分发.ordinal());
		reasonDmo.setAdmin(admin);
		this.notLateReasonDao.save(reasonDmo);
		rm.setLockMoney(false);
		List<RoomMemberDmo> roomMembers = this.roomMemberDao
				.findByRoom_IdAndMember_IdNotAndIsSigned(rm.getRoom().getId(), rm.getMember().getId(), true);
		if (roomMembers.isEmpty()) {
			UserDmo systemUser = this.userDao.findOne(Keys.SYSTEM_ID);
			String roomName = rm.getRoom().getName();
			rm.setDealState(RoomRequestNotLateState.分发.ordinal());
			int money = room.getMoney();
			UserDmo user = rm.getMember();
			user.setLockAmount(user.getLockAmount() - money);
			userDao.save(user);
			TransactionDetailsDmo tran = new TransactionDetailsDmo();
			tran.setCreateTime(new Date(currentTime));
			tran.setDescription("【" + roomName + "】迟到，扣除保证金");
			tran.setUser(user);
			tran.setMoney(0 - money);
			transactionDetailsDao.save(tran);
			systemUser.setAmount(systemUser.getAmount() + money);
			return;
		}
		String roomName = rm.getRoom().getName();
		rm.setDealState(RoomRequestNotLateState.分发.ordinal());
		int money = room.getMoney();
		UserDmo user = rm.getMember();
		user.setLockAmount(user.getLockAmount() - money);
		userDao.save(user);
		TransactionDetailsDmo tran = new TransactionDetailsDmo();
		tran.setCreateTime(new Date(currentTime));
		tran.setDescription("【" + roomName + "】迟到，扣除保证金");
		tran.setUser(user);
		tran.setMoney(0 - money);
		transactionDetailsDao.save(tran);
		int addMoney = money / roomMembers.size();
		for (RoomMemberDmo roomMemberDmo : roomMembers) {
			UserDmo member = roomMemberDmo.getMember();
			TransactionDetailsDmo tranDmo = new TransactionDetailsDmo();
			tranDmo.setCreateTime(new Date(currentTime));
			tranDmo.setDescription("【" + roomName + "】结束，分得保证金");
			tranDmo.setUser(member);
			tranDmo.setMoney(addMoney);
			transactionDetailsDao.save(tranDmo);
			member.setAmount(member.getAmount() + addMoney);
			userDao.save(member);
		}
		room.setRemainingMoney(money - addMoney * roomMembers.size());
		UserDmo systemUser = this.userDao.findOne(Keys.SYSTEM_ID);
		systemUser.setAmount(systemUser.getAmount() + room.getRemainingMoney());
		this.roomDao.save(room);
		this.roomMemberDao.save(rm);
	}

	@Transactional(rollbackOn = Throwable.class)
	public void jieDong(long id, AdminDmo admin) throws Exception {
		NotLateReasonDmo reasonDmo = this.notLateReasonDao.findOne(id);
		RoomMemberDmo rm = this.roomMemberDao.findByMember_IdAndRoom_Id(reasonDmo.getUser().getId(),
				reasonDmo.getRoom().getId());
		RoomDmo room=rm.getRoom();
		if (room.getState()<ActivityStates.待评价.ordinal()) {
			throw new Exception("房间还没有结束，不能结算。");
		}
		if (rm.getDealState() != RoomRequestNotLateState.待处理.ordinal()
				|| reasonDmo.getDealState() != RoomRequestNotLateState.待处理.ordinal()) {
			log.error("已处理");
			throw new Exception("已处理");
		}
		reasonDmo.setDealState(RoomRequestNotLateState.解冻.ordinal());
		reasonDmo.setAdmin(admin);
		int money = rm.getRoom().getMoney();
		UserDmo user = rm.getMember();
		user.setAmount(user.getAmount() + money);
		user.setLockAmount(user.getLockAmount() - money);
		this.userDao.save(user);
		TransactionDetailsDmo tran = new TransactionDetailsDmo();
		tran.setCreateTime(new Date());
		tran.setDescription("【" + rm.getRoom().getName() + "】结束，解冻保证金");
		tran.setMoney(money);
		tran.setUser(user);
		this.transactionDetailsDao.save(tran);
		rm.setDealState(RoomRequestNotLateState.解冻.ordinal());
		rm.setLockMoney(false);
		roomMemberDao.save(rm);
	}

	@Transactional(rollbackOn = Throwable.class)
	public void disableAdmin(long adminId) {
		AdminDmo dmo = this.adminDao.findOne(adminId);
		dmo.setEnable(false);
		this.adminDao.save(dmo);
	}

	@Transactional(rollbackOn = Throwable.class)
	public void enableAdmin(long adminId) {
		AdminDmo dmo = this.adminDao.findOne(adminId);
		dmo.setEnable(true);
		this.adminDao.save(dmo);
	}

	@Transactional(rollbackOn = Throwable.class)
	public void updateAdmin(long adminId, String username, String name, String password) throws Exception {
		AdminDmo dmo = this.adminDao.findOne(adminId);
		if (dmo == null) {
			throw new Exception("用户不存在");
		}
		dmo.setUsername(username);
		dmo.setName(name);
		dmo.setPassword(MD5Util.getSecurityCode(password));
		this.adminDao.save(dmo);
	}

	@Transactional(rollbackOn = Throwable.class)
	public void addAdmin(String username, String name, String password) throws Exception {
		AdminDmo dmo = new AdminDmo();
		dmo.setUsername(username);
		dmo.setEnable(true);
		dmo.setName(name);
		dmo.setPassword(MD5Util.getSecurityCode(password));
		dmo.setSuper(false);
		this.adminDao.save(dmo);
	}

	@Transactional(rollbackOn=Throwable.class)
	public void addSpreadUser(long userId, double longitude1, double longitude2, double latitude1, double latitude2) throws Exception {
		if (!userDao.exists(userId)) {
			throw new Exception("用户ID不存在");
		}
		if (spreadUserDao.existsByUserId(userId)) {
			throw new Exception("该用户已是推广员");
		}
		SpreadUserDmo dmo=new SpreadUserDmo();
		dmo.setLatitude1(latitude1);
		dmo.setLatitude2(latitude2);
		dmo.setLongitude1(longitude1);
		dmo.setLongitude2(longitude2);
		dmo.setUserId(userId);
		this.spreadUserDao.save(dmo);
	}

	@Autowired
	SpreadUserDao spreadUserDao;
	@Transactional(rollbackOn=Throwable.class)
	public void updateSpreadUser(long id, long userId, double longitude1, double longitude2, double latitude1,
			double latitude2) throws Exception {
		if (!userDao.exists(userId)||!spreadUserDao.existsByUserId(userId)) {
			throw new Exception("用户ID不存在");
		}
		SpreadUserDmo dmo=this.spreadUserDao.findOne(id);
		dmo.setLatitude1(latitude1);
		dmo.setLatitude2(latitude2);
		dmo.setLongitude1(longitude1);
		dmo.setLongitude2(longitude2);
		this.spreadUserDao.save(dmo);
	}
}
