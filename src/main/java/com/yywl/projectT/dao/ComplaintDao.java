package com.yywl.projectT.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yywl.projectT.dmo.ComplaintDmo;

public interface ComplaintDao extends JpaRepository<ComplaintDmo, Long> {

}
