package com.yywl.projectT.bo;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.yywl.projectT.bean.Keys;
import com.yywl.projectT.bean.component.RongCloudBean;
import com.yywl.projectT.bean.enums.ActivityStates;
import com.yywl.projectT.dao.GameDao;
import com.yywl.projectT.dao.GameScoreDao;
import com.yywl.projectT.dao.JdbcDao;
import com.yywl.projectT.dao.RoomDao;
import com.yywl.projectT.dao.RoomMemberDao;
import com.yywl.projectT.dmo.PropDmo;
import com.yywl.projectT.dmo.RoomDmo;
import com.yywl.projectT.dmo.RoomMemberDmo;
import com.yywl.projectT.vo.RoomMemberVo;

import io.rong.messages.CmdMsgMessage;

@Service
public class RoomBoImpl implements RoomBo {

	@Autowired
	RoomDao roomDao;

	@Autowired
	RoomMemberDao roomMemberDao;

	@Autowired
	GameDao gameDao;

	@Autowired
	JdbcTemplate jdbc;

	@Autowired
	RoleBo roleBo;

	@Autowired
	Keys keys;

	@Autowired
	MoneyTransactionBo moneyTransactionBo;

	@Override
	@Transactional(rollbackOn = Throwable.class)
	public void delete(RoomDmo room) {
		this.jdbc.update("update location set room_id=null where room_id=" + room.getId().longValue());
		this.jdbc.update("update complaint set room_id=null where room_id=" + room.getId().longValue());
		this.jdbc.update("delete from not_late_reason where room_id=" + room.getId().longValue());
		this.moneyTransactionBo.deleteRoom(room);
	}

	@Override
	public RoomDmo findOne(Long id) {
		RoomDmo room = this.roomDao.findOne(id);
		String sql = "select rm.member,rm.nickname,rm.ready,u.avatar_signature,rm.is_attend,rm.is_signed from room_member rm "
				+ "left join user u on u.id=rm.member where room=? ";
		List<RoomMemberVo> members = jdbc.query(sql, new Object[] { room.getId() }, (rs, num) -> {
			RoomMemberVo vo = new RoomMemberVo(rs.getLong("member"), rs.getString("nickname"), rs.getBoolean("ready"),
					rs.getString("avatar_signature"));
			vo.setAttend(rs.getBoolean("is_attend"));
			vo.setSigned(rs.getBoolean("is_signed"));
			return vo;
		});
		room.setJoinMembers(members);
		return room;
	}

	@Autowired
	GameScoreDao gameScoreDao;

	@Autowired
	JdbcDao jdbcDao;

	@Override
	@Transactional(rollbackOn = Throwable.class)
	public void delete(RoomDmo room, String reason) {
		this.jdbc.update("update location set room_id=null where room_id=" + room.getId().longValue());
		this.jdbc.update("update complaint set room_id=null where room_id=" + room.getId().longValue());
		this.jdbc.update("delete from not_late_reason where room_id=" + room.getId().longValue());
		this.jdbc.update("delete from join_room_log where room_id="+room.getId().longValue());
		this.moneyTransactionBo.deleteRoom(room, reason);
	}

	@Override
	@Transactional(rollbackOn = Throwable.class)
	public int readyMember(long roomId) throws Exception {
		RoomDmo room = this.roomDao.findOne(roomId);
		if (room == null) {
			throw new Exception("房间id不存在");
		}
		if (room.getState() != ActivityStates.新建.ordinal()) {
			throw new Exception("房间已准备");
		}
		if (room.getMoney() > 0) {
			throw new Exception("房间有保证金，无法准备");
		}
		boolean isMovieRoom = room.getManager().isSuperUser() && room.getGame().getId().intValue() == 22;
		List<RoomMemberDmo> list = this.roomMemberDao.findByRoom_IdAndReady(roomId, false);
		int fail = 0;
		for (RoomMemberDmo roomMemberDmo : list) {
			if (isMovieRoom) {
				PropDmo prop = propBo.findByUser_Id(roomMemberDmo.getMember().getId());
				if (prop.getRemainMovieTicket() < 1) {
					fail++;
					continue;
				}
				prop.setRemainMovieTicket(prop.getRemainMovieTicket() - 1);
				this.propBo.save(prop);
			}
			roomMemberDmo.setReady(true);
			this.roomMemberDao.save(roomMemberDmo);
			new Thread(()->{
				try {
					rongCloud.sendSystemMessage(new String[] {roomMemberDmo.getMember().getId()+""},
							new CmdMsgMessage(Keys.RongCloud.CMD_MSG_SENDLOCATION, "" + room.getId()));
				} catch (Exception e) {
					log.error(e.getMessage());
				}
			}).start();
		}
		return fail;
	}
	@Autowired
	RongCloudBean rongCloud;
	
	private final static Log log=LogFactory.getLog(RoomBoImpl.class);
	
	@Autowired
	PropBo propBo;
}
