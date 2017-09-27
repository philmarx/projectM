package com.yywl.projectT.bo;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.yywl.projectT.bean.component.RongCloudBean;
import com.yywl.projectT.bean.enums.OctRoomEnum;
import com.yywl.projectT.bean.enums.OctRoomUserEnum;
import com.yywl.projectT.dao.JdbcDao;
import com.yywl.projectT.dao.OctActivityAllPrizeMoneyDao;
import com.yywl.projectT.dao.OctRoomDao;
import com.yywl.projectT.dao.RoomDao;
import com.yywl.projectT.dao.TransactionDetailsDao;
import com.yywl.projectT.dao.UserDao;
import com.yywl.projectT.dmo.OctActivityAllPrizeMoneyDmo;
import com.yywl.projectT.dmo.OctRoomDmo;

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
	
	public void reward(OctRoomDmo octRoomDmo, long adminId) {
		Date now = new Date();
		octRoomDmo.setState(OctRoomEnum.已通过.ordinal());
		octRoomDmo.setRewardTime(now);
		octRoomDmo.setRewardAdminId(adminId);
		int bounty,managerBounty;
		final List<Long> memberIds = jdbcDao.findMember_IdsByRoom_Id(octRoomDmo.getRoomId());
		if (memberIds.size() < 4) {
			bounty = 500;
			octRoomDmo.setBounty(bounty);
			octRoomDmo.setReason("审核通过，请领取奖励");
			this.octRoomDao.save(octRoomDmo);
			int count = jdbc.update("update oct_room_user set state=? where room_id=?", 
					OctRoomUserEnum.通过未领取.ordinal(), octRoomDmo.getRoomId());
			OctActivityAllPrizeMoneyDmo allPrizeMoneyDmo = this.octActivityAllPrizeMoneyDao.findOne(1);
			allPrizeMoneyDmo.setAllMoney(allPrizeMoneyDmo.getAllMoney() - count * bounty);
			this.octActivityAllPrizeMoneyDao.save(allPrizeMoneyDmo);
			new Thread(() -> {
				double d = bounty / 100.0;
				try {
					rongCloud.sendSystemMessage(memberIds,
							new TxtMessage("您已获得" + String.format("%.2f", d) + "元奖金，请至活动页面领取(圈子页面顶端)", ""));
				} catch (Exception e) {
					log.error(e.getMessage());
				}
			}).start();
		} else if(memberIds.size()==4){
			bounty = 1000;
			octRoomDmo.setBounty(bounty);
			octRoomDmo.setReason("审核通过，请领取奖励");
			this.octRoomDao.save(octRoomDmo);
			int count = jdbc.update("update oct_room_user set state=? where room_id=?",
					OctRoomUserEnum.通过未领取.ordinal(), octRoomDmo.getRoomId());
			OctActivityAllPrizeMoneyDmo allPrizeMoneyDmo = this.octActivityAllPrizeMoneyDao.findOne(1);
			allPrizeMoneyDmo.setAllMoney(allPrizeMoneyDmo.getAllMoney() - count * bounty);
			this.octActivityAllPrizeMoneyDao.save(allPrizeMoneyDmo);
			new Thread(() -> {
				double d = bounty / 100.0;
				try {
					rongCloud.sendSystemMessage(memberIds,
							new TxtMessage("您已获得" + String.format("%.2f", d) + "元奖金，请至活动页面领取(圈子页面顶端)", ""));
				} catch (Exception e) {
					log.error(e.getMessage());
				}
			}).start();
		}else {
			bounty=1000;
			managerBounty=200*memberIds.size();
			octRoomDmo.setBounty(bounty);
			octRoomDmo.setReason("审核通过，请领取奖励");
			this.octRoomDao.save(octRoomDmo);
			long managerId=roomDao.findOne(octRoomDmo.getRoomId()).getManager().getId();
			int count = jdbc.update("update oct_room_user set state=? where room_id=? and user_id<>?", 
					OctRoomUserEnum.通过未领取.ordinal(), octRoomDmo.getRoomId(),managerId);
			int managerCount=jdbc.update("update oct_room_user set state=? where room_id=? and user_id=?", 
					OctRoomUserEnum.通过未领取.ordinal(), octRoomDmo.getRoomId(),managerId);
			OctActivityAllPrizeMoneyDmo allPrizeMoneyDmo = this.octActivityAllPrizeMoneyDao.findOne(1);
			allPrizeMoneyDmo.setAllMoney(allPrizeMoneyDmo.getAllMoney() - (count * bounty+managerCount*managerBounty));
			this.octActivityAllPrizeMoneyDao.save(allPrizeMoneyDmo);
			memberIds.remove(managerId);
			new Thread(() -> {
				try {
					rongCloud.sendSystemMessage(memberIds,
							new TxtMessage("您已获得" + String.format("%.2f", bounty / 100.0) + "元奖金，请至活动页面领取(圈子页面顶端)", ""));
					rongCloud.sendSystemMessage(new String[] { managerId+""},
							new TxtMessage("您已获得" + String.format("%.2f", managerBounty/100.0) + "元奖金，请至活动页面领取(圈子页面顶端)", ""));
				} catch (Exception e) {
					log.error(e.getMessage());
				}
			}).start();
		}
	
	}

	public void refuce(OctRoomDmo dmo,long loginId,String reason) {
		dmo.setReason(reason);
		dmo.setState(OctRoomEnum.已拒绝.ordinal());
		dmo.setRewardAdminId(loginId);
		dmo.setRewardTime(new Date());
		this.octRoomDao.save(dmo);
		jdbc.update("update oct_room_user set state=? where room_id=?",
				OctRoomUserEnum.审核未通过.ordinal(), dmo.getRoomId());
		new Thread(()->{
			List<Long> memberIds=this.jdbcDao.findMember_IdsByRoom_Id(dmo.getRoomId());
			try {
				rongCloud.sendSystemMessage(memberIds, new TxtMessage(reason, ""));
			}catch (Exception e) {
				log.error(e.getMessage());
			}
		}).start();		
	}

	public void setFoul(long userId, boolean foul) {
		jdbc.update("update oct_room_user set is_foul=? where user_id=?",foul,userId);
	}

}
