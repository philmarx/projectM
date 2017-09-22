package com.yywl.projectT.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yywl.projectT.dmo.OctRoomDmo;

public interface OctRoomDao extends JpaRepository<OctRoomDmo, Long> {

	OctRoomDmo findByRoomId(long id);

}
