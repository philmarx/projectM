package com.yywl.projectT.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.yywl.projectT.dmo.TransactionDetailsDmo;

public interface TransactionDetailsDao extends JpaRepository<TransactionDetailsDmo, Long> {

	Page<TransactionDetailsDmo> findByUser_Id(long userId, Pageable pageRequest);

}
