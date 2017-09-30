package com.yywl.projectT.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yywl.projectT.dmo.OctRoomUserDmo;

public interface OctRoomUserDao extends JpaRepository<OctRoomUserDmo, Long> {

	OctRoomUserDmo findByRoomIdAndUserId(long roomId, long userId);

	int countByRoomId(long roomId);

	List<OctRoomUserDmo> findByRoomIdAndState(long roomId, int ordinal);

}
