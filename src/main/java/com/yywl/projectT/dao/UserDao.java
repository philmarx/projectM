package com.yywl.projectT.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yywl.projectT.dmo.UserDmo;

public interface UserDao extends JpaRepository<UserDmo, Long> {

	UserDmo findByPhone(String phone);

	UserDmo findByQqUid(String qqUid);

	UserDmo findByWxUid(String wxUid);

	UserDmo findByXlwbUid(String xlwbUid);

	long countByNickname(String nickname);

	boolean existsByPhone(String phone);

	List<UserDmo> findByNicknameLike(String string);

	boolean existsByNickname(String username);
}
