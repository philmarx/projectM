package com.yywl.projectT.bo;

import java.util.UUID;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.yywl.projectT.bean.MD5Util;
import com.yywl.projectT.dao.JdbcDao;
import com.yywl.projectT.dao.SpreadUserDao;
import com.yywl.projectT.dao.UserDao;
import com.yywl.projectT.dmo.UserDmo;

@Service
@Transactional(rollbackOn = Throwable.class)
public class UserBo {

	@Autowired
	UserDao userDao;


	private static final Log log = LogFactory.getLog(UserBo.class);

	
	
	@Transactional(rollbackOn = Throwable.class)
	public UserDmo loginByToken(Long userId, String token) throws Exception {
		if (null == userId) {
			log.error("用户ID不能为空");
			throw new Exception("用户ID不能为空");
		}
		if (StringUtils.isEmpty(token)) {
			log.error("请先登陆");
			throw new Exception("请先登陆");
		}
		UserDmo user = userDao.findOne(userId);
		if (null == user) {
			throw new Exception("用户ID不存在");
		}
		if (StringUtils.isEmpty(user.getToken())) {
			user.setToken(UUID.randomUUID().toString());
			this.userDao.save(user);
		}
		if (!user.getToken().equals(token)) {
			log.error("登录失效");
			throw new Exception("登录失效");
		}
		return user;
	}

	@Autowired
	JdbcDao jdbcDao;

	
	@Transactional(rollbackOn = Throwable.class)
	public UserDmo loginByPassword(String phone, String password) throws Exception {
		if (StringUtils.isEmpty(phone)) {
			throw new Exception("手机不能为空");
		}
		if (StringUtils.isEmpty(password)) {
			log.error("密码不能为空");
			throw new Exception("密码不能为空");
		}
		UserDmo user = this.userDao.findByPhone(phone);
		if (user == null || !user.getPassword().equals(MD5Util.getSecurityCode(password))) {
			log.error("用户名不存在或密码不正确");
			throw new Exception("用户名不存在或密码不正确");
		}
		if (StringUtils.isEmpty(user.getToken())) {
			user.setToken(UUID.randomUUID().toString());
			this.userDao.save(user);
		}
		if (!spreadUserDao.existsByUserId(user.getId())) {
			log.error(user.getId()+":"+user.getNickname());
			throw new Exception("您不是推广员");
		}
		return user;
	}
	@Autowired
	SpreadUserDao spreadUserDao;



}
