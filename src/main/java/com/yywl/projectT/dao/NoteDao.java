package com.yywl.projectT.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.yywl.projectT.dmo.NoteDmo;

public interface NoteDao extends JpaRepository<NoteDmo, Long> {

	Page<NoteDmo> findByReceiver_Id(long receiver, Pageable pageRequest);


}
