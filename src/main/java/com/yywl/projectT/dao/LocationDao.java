package com.yywl.projectT.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import com.yywl.projectT.dmo.LocationDmo;

public interface LocationDao extends JpaRepository<LocationDmo, Long> {

	Page<LocationDmo> findByUser_Id(long id, Pageable pageable);

	List<LocationDmo> findByUser_IdAndRoom_Id(long userId, long roomId);

	List<LocationDmo> findByUser_IdAndRoom_Id(long userId, long roomId, Sort sort);

}
