package com.yywl.projectT.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.yywl.projectT.dmo.RoomDmo;

public interface RoomDao extends JpaRepository<RoomDmo, Long> {

	Page<RoomDmo> findByManager_Id(Long userId, Pageable pageable);

	Page<RoomDmo> findByGame_Id(Integer gameId, Pageable pageable);

	List<RoomDmo> findByBeginTime(Date date);

	List<RoomDmo> findByBeginTimeAndState(Date date, int state);

	List<RoomDmo> findByEndTimeAndState(Date date, int ordinal);

	List<RoomDmo> findByBelongCircle_IdOrderByBeginTimeDesc(long circleId);

	Page<RoomDmo> findByBelongCircle_Id(long circleId, Pageable pageable);

	List<RoomDmo> findByBeginTimeBetweenAndState(Date currentTime, Date delayTime, int state);

	List<RoomDmo> findByEndTimeBetweenAndState(Date currentTime, Date delayTime, int state);

	int countByManager_IdAndBeginTimeBetween(long userId, Date date1, Date date2);

	Page<RoomDmo> findByBelongCircle_IdAndState(long circleId, int i,Pageable pageable);

	int countByBelongCircle_Id(Long id);

}
