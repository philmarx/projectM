package com.yywl.projectT.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.yywl.projectT.core.Formatter;
import com.yywl.projectT.core.Keys;
import com.yywl.projectT.dao.GameDao;
import com.yywl.projectT.dao.GameScoreDao;
import com.yywl.projectT.dao.JdbcDao;
import com.yywl.projectT.dao.RoomDao;
import com.yywl.projectT.dao.RoomMemberDao;
import com.yywl.projectT.dmo.RoomDmo;
import com.yywl.projectT.vo.RoomMemberVo;

@Service
public class RoomBoImpl implements RoomBo {


	@Autowired
	RoomDao roomDao;

	@Autowired
	RoomMemberDao roomMemberDao;


	@Autowired
	Formatter formatter;

	@Autowired
	GameDao gameDao;

	@Autowired
	JdbcTemplate jdbc;

	@Autowired
	RoleBo roleBo;

	@Autowired
	Keys keys;




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






}
