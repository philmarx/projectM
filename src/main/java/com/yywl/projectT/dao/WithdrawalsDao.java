package com.yywl.projectT.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.yywl.projectT.dmo.WithdrawalsDmo;

public interface WithdrawalsDao extends JpaRepository<WithdrawalsDmo, Long> {

	Page<WithdrawalsDmo> findByState(Integer state, Pageable pageable);

}
