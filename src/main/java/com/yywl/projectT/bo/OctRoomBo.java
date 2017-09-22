package com.yywl.projectT.bo;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yywl.projectT.dao.JdbcDao;
import com.yywl.projectT.dao.OctRoomDao;
import com.yywl.projectT.dao.TransactionDetailsDao;
import com.yywl.projectT.dao.UserDao;
import com.yywl.projectT.dmo.OctRoomDmo;
import com.yywl.projectT.dmo.TransactionDetailsDmo;
import com.yywl.projectT.dmo.UserDmo;

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

	@SuppressWarnings("unused")
	private static final Log log = LogFactory.getLog(OctRoomBo.class);

	public void reward(OctRoomDmo octRoomDmo, long adminId) {
		octRoomDmo.setReward(true);
		octRoomDmo.setRewardAdminId(adminId);
		this.octRoomDao.save(octRoomDmo);
		List<Long> memberIds = jdbcDao.findMember_IdsByRoom_Id(octRoomDmo.getRoomId());
		int rewardMoney;
		if (memberIds.size() > 4) {
			rewardMoney = 1000;
		} else {
			rewardMoney = 500;
		}
		Date now = new Date();
		for (Long id : memberIds) {
			UserDmo user = userDao.findOne(id);
			user.setAmount(user.getAmount() + rewardMoney);
			this.userDao.save(user);
			TransactionDetailsDmo tran = new TransactionDetailsDmo();
			tran.setCalc(true);
			tran.setCreateTime(now);
			tran.setDescription("十月活动奖励");
			tran.setMoney(rewardMoney);
			tran.setUser(user);
			this.transactionDetailsDao.save(tran);
		}
	}

}
