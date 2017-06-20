package com.yywl.projectT.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.yywl.projectT.dmo.LocationDmo;

public interface LocationDao extends JpaRepository<LocationDmo, Long> {

	Page<LocationDmo> findByUser_Id(long id, Pageable pageable);

}
