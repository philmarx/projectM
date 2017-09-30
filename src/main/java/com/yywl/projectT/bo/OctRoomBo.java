package com.yywl.projectT.bo;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.yywl.projectT.bean.Formatter;
import com.yywl.projectT.bean.component.RongCloudBean;
import com.yywl.projectT.bean.enums.OctRoomEnum;
import com.yywl.projectT.bean.enums.OctRoomUserEnum;
import com.yywl.projectT.dao.ActivityDao;
import com.yywl.projectT.dao.JdbcDao;
import com.yywl.projectT.dao.OctActivityAllPrizeMoneyDao;
import com.yywl.projectT.dao.OctRoomDao;
import com.yywl.projectT.dao.OctRoomUserDao;
import com.yywl.projectT.dao.RoomDao;
import com.yywl.projectT.dao.TransactionDetailsDao;
import com.yywl.projectT.dao.UserDao;
import com.yywl.projectT.dmo.OctActivityAllPrizeMoneyDmo;
import com.yywl.projectT.dmo.OctRoomDmo;
import com.yywl.projectT.dmo.OctRoomUserDmo;

import io.rong.messages.TxtMessage;

@Service
@Transactional(rollbackOn = Throwable.class)
public class OctRoomBo {

	@Autowired
	OctRoomDao octRoomDao;

	@Autowired
	UserDao userDao;

	@Autowired
	JdbcDao jdbcDao;

	@Autowired
	TransactionDetailsDao transactionDetailsDao;

	private static final Log log = LogFactory.getLog(OctRoomBo.class);

	@Autowired
	JdbcTemplate jdbc;

	@Autowired
	RongCloudBean rongCloud;

	@Autowired
	OctActivityAllPrizeMoneyDao octActivityAllPrizeMoneyDao;

	@Autowired
	RoomDao roomDao;

	@Autowired
	ActivityDao activityDao;

	public void rewardList(OctRoomDmo octRoomDmo, long adminId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "getBounty");
		map.put("url", activityDao.findOne(7L).getUrl());
		Date now = new Date();
		octRoomDmo.setState(OctRoomEnum.已通过.ordinal());
		octRoomDmo.setRewardTime(now);
		octRoomDmo.setRewardAdminId(adminId);
		int bounty, managerBounty;
		final List<Long> memberIds = jdbcDao.findMember_IdsByRoom_Id(octRoomDmo.getRoomId());
		if (memberIds.size() < 4) {
			bounty = 500;
			octRoomDmo.setBounty(bounty);
			octRoomDmo.setReason("审核通过，请领取奖励");
			this.octRoomDao.save(octRoomDmo);
			String moneyStr = String.format("%.2f", bounty / 100.0);
			int count = jdbc.update("update oct_room_user set state=?,reason='审核已通过' where room_id=? and state=?",
					OctRoomUserEnum.通过未领取.ordinal(), octRoomDmo.getRoomId(), OctRoomUserEnum.审核中.ordinal());
			OctActivityAllPrizeMoneyDmo allPrizeMoneyDmo = this.octActivityAllPrizeMoneyDao.findOne(1);
			allPrizeMoneyDmo.setAllMoney(allPrizeMoneyDmo.getAllMoney() - count * bounty);
			this.octActivityAllPrizeMoneyDao.save(allPrizeMoneyDmo);
			new Thread(() -> {
				List<Long> enableUserIds = jdbcDao.findOctRoomUserIdsByRoomIdAndState(octRoomDmo.getRoomId(),
						OctRoomUserEnum.通过未领取.ordinal());
				try {
					rongCloud.sendSystemMessage(enableUserIds,
							new TxtMessage("本次神秘宝藏活动您已获得" + moneyStr + "元奖金，请至活动页面领取(圈子页面顶端)", Formatter.gson.toJson(map)));
				} catch (Exception e) {
					log.error(e.getMessage());
				}
			}).start();
		} else if (memberIds.size() == 4) {
			bounty = 1000;
			String moneyStr = String.format("%.2f", bounty / 100.0);
			octRoomDmo.setBounty(bounty);
			octRoomDmo.setReason("审核通过，请领取奖励");
			this.octRoomDao.save(octRoomDmo);
			int count = jdbc.update("update oct_room_user set state=?,reason='审核已通过' where room_id=? and state=?",
					OctRoomUserEnum.通过未领取.ordinal(), octRoomDmo.getRoomId(), OctRoomUserEnum.审核中.ordinal());
			OctActivityAllPrizeMoneyDmo allPrizeMoneyDmo = this.octActivityAllPrizeMoneyDao.findOne(1);
			allPrizeMoneyDmo.setAllMoney(allPrizeMoneyDmo.getAllMoney() - count * bounty);
			this.octActivityAllPrizeMoneyDao.save(allPrizeMoneyDmo);
			new Thread(() -> {
				List<Long> enableUserIds = jdbcDao.findOctRoomUserIdsByRoomIdAndState(octRoomDmo.getRoomId(),
						OctRoomUserEnum.通过未领取.ordinal());
				try {
					rongCloud.sendSystemMessage(enableUserIds,
							new TxtMessage("本次神秘宝藏活动您已获得" + moneyStr + "元奖金，请至活动页面领取(圈子页面顶端)", Formatter.gson.toJson(map)));
				} catch (Exception e) {
					log.error(e.getMessage());
				}
			}).start();
		} else {
			bounty = 1000;
			managerBounty = 200 * memberIds.size();
			octRoomDmo.setBounty(bounty);
			octRoomDmo.setReason("审核通过，请领取奖励");
			String moneyStr = String.format("%.2f", bounty / 100.0);
			String managerMoneyStr = String.format("%.2f", managerBounty / 100.0);
			this.octRoomDao.save(octRoomDmo);
			long managerId = roomDao.findOne(octRoomDmo.getRoomId()).getManager().getId();
			int count = jdbc.update("update oct_room_user set state=?,reason='审核已通过' where room_id=? and user_id<>? and state=?",
					OctRoomUserEnum.通过未领取.ordinal(), octRoomDmo.getRoomId(), managerId,
					OctRoomUserEnum.审核中.ordinal());
			int managerCount = jdbc.update(
					"update oct_room_user set state=? ,reason='审核已通过' where room_id=? and user_id=? and state=?",
					OctRoomUserEnum.通过未领取.ordinal(), octRoomDmo.getRoomId(), managerId,
					OctRoomUserEnum.审核中.ordinal());
			OctActivityAllPrizeMoneyDmo allPrizeMoneyDmo = this.octActivityAllPrizeMoneyDao.findOne(1);
			allPrizeMoneyDmo
					.setAllMoney(allPrizeMoneyDmo.getAllMoney() - (count * bounty + managerCount * managerBounty));
			this.octActivityAllPrizeMoneyDao.save(allPrizeMoneyDmo);
			List<Long> enableUserIds = jdbcDao.findOctRoomUserIdsByRoomIdAndState(octRoomDmo.getRoomId(),
					OctRoomUserEnum.通过未领取.ordinal());
			enableUserIds.remove(managerId);
			new Thread(() -> {
				try {
					rongCloud.sendSystemMessage(enableUserIds,
							new TxtMessage("本次神秘宝藏活动您已获得" + moneyStr + "元奖金，请至活动页面领取(圈子页面顶端)", Formatter.gson.toJson(map)));
					OctRoomUserDmo managerUserDmo=this.octRoomUserDao.findByRoomIdAndUserId(octRoomDmo.getRoomId(),managerId);
					if (managerUserDmo==null||managerUserDmo.getState()!=OctRoomUserEnum.通过未领取.ordinal()) {
						return;
					}
					rongCloud.sendSystemMessage(new String[] { managerId + "" }, new TxtMessage(
							"本次神秘宝藏活动您已获得" + managerMoneyStr + "元奖金，请至活动页面领取(圈子页面顶端)", Formatter.gson.toJson(map)));
				} catch (Exception e) {
					log.error(e.getMessage());
				}
			}).start();
		}

	}

	@Autowired
	OctRoomUserDao octRoomUserDao;
	
	public void refuceList(OctRoomDmo dmo, long loginId, String reason) {
		dmo.setReason(reason);
		dmo.setState(OctRoomEnum.已拒绝.ordinal());
		dmo.setRewardAdminId(loginId);
		dmo.setRewardTime(new Date());
		this.octRoomDao.save(dmo);
		jdbc.update("update oct_room_user set state=?,reason=? where room_id=? and state=?", OctRoomUserEnum.审核未通过.ordinal(),reason,
				dmo.getRoomId(),OctRoomUserEnum.审核中.ordinal());
		new Thread(() -> {
			List<Long> memberIds = this.jdbcDao.findMember_IdsByRoom_Id(dmo.getRoomId());
			try {
				rongCloud.sendSystemMessage(memberIds, new TxtMessage(reason, ""));
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}).start();
	}

	public void setFoul(long userId, boolean foul) {
		jdbc.update("update oct_room_user set is_foul=? where user_id=?", foul, userId);
	}

	public void refuseOne(long id,String reason) {
		OctRoomUserDmo dmo=this.octRoomUserDao.findOne(id);
		dmo.setState(OctRoomUserEnum.审核未通过.ordinal());
		dmo.setReason(reason);
		this.octRoomUserDao.save(dmo);
		int count=this.octRoomUserDao.countByRoomId(dmo.getRoomId());
		if (count>4) {
			long managerId=jdbc.queryForObject("select manager from room where id=?",Long.class,dmo.getRoomId());
			OctRoomUserDmo managerDmo=this.octRoomUserDao.findByRoomIdAndUserId(dmo.getRoomId(), managerId);
			managerDmo.setBounty(managerDmo.getBounty()-200);
			this.octRoomUserDao.save(managerDmo);
		}
	}

	public void rewardOne(long id) throws Exception {
		OctRoomUserDmo dmo=this.octRoomUserDao.findOne(id);
		if (dmo.getState()!=OctRoomUserEnum.审核中.ordinal()) {
			throw new Exception("请勿重复操作");
		}
		dmo.setState(OctRoomUserEnum.通过未领取.ordinal());
		this.octRoomUserDao.save(dmo);
		new Thread(() -> {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("type", "getBounty");
			map.put("url", activityDao.findOne(7L).getUrl());
			String moneyStr = String.format("%.2f", dmo.getBounty() / 100.0);
			try {
				rongCloud.sendSystemMessage(new String[] { dmo.getUserId() + "" }, new TxtMessage(
						"本次神秘宝藏活动您已获得" + moneyStr + "元奖金，请至活动页面领取(圈子页面顶端)", Formatter.gson.toJson(map)));
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}).start();
	}

	public void revokeOne(long id, String reason) throws Exception {
		OctRoomUserDmo dmo=this.octRoomUserDao.findOne(id);
		if (dmo.getState()==OctRoomUserEnum.通过已领取.ordinal()) {
			throw new Exception("用户已领取");
		}
		if (dmo.getState()==OctRoomUserEnum.审核中.ordinal()) {
			throw new Exception("审核中");
		}
		dmo.setReason(reason);
		dmo.setState(OctRoomUserEnum.审核中.ordinal());
		this.octRoomUserDao.save(dmo);
		new Thread(() -> {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("type", "getBounty");
			map.put("url", activityDao.findOne(7L).getUrl());
			try {
				rongCloud.sendSystemMessage(new String[] { dmo.getUserId() + "" }, new TxtMessage(
						reason, Formatter.gson.toJson(map)));
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}).start();
	}

	public void revolkeListByRoomId(long roomId, String reason,long loginId) {
		OctRoomDmo roomDmo=this.octRoomDao.findByRoomId(roomId);
		roomDmo.setReason(reason);
		roomDmo.setState(OctRoomEnum.审核中.ordinal());
		roomDmo.setRewardAdminId(loginId);
		this.octRoomDao.save(roomDmo);
		List<OctRoomUserDmo> users=this.octRoomUserDao.findByRoomIdAndState(roomId,OctRoomUserEnum.通过未领取.ordinal());
		List<Long> userIds=new LinkedList<>();
		for (OctRoomUserDmo user : users) {
			userIds.add(user.getUserId());
			user.setReason(reason);
			user.setState(OctRoomUserEnum.审核中.ordinal());
			this.octRoomUserDao.save(user);
		}
		new Thread(()->{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("type", "getBounty");
			map.put("url", activityDao.findOne(7L).getUrl());
			try {
				rongCloud.sendSystemMessage(userIds, new TxtMessage(
						reason, Formatter.gson.toJson(map)));
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}).start();
	}

}
