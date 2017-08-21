package com.yywl.projectT.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yywl.projectT.dmo.PayOrderDmo;

public interface PayOrderDao extends JpaRepository<PayOrderDmo, Long> {

}
