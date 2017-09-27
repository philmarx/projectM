package com.yywl.projectT.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yywl.projectT.dmo.OctRoomUserDmo;

public interface OctRoomUserDao extends JpaRepository<OctRoomUserDmo, Long> {

	OctRoomUserDmo findByRoomIdAndUserId(long roomId, long userId);

}
