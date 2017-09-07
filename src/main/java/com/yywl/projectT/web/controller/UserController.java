package com.yywl.projectT.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yywl.projectT.bean.Formatter;
import com.yywl.projectT.bean.ResultModel;
import com.yywl.projectT.bo.UserBo;
import com.yywl.projectT.dao.JdbcDao;
import com.yywl.projectT.dmo.UserDmo;
@RestController
@RequestMapping("user")
public class UserController {
	
	@Autowired
	UserBo userBo;
	
	@Autowired
	JdbcDao jdbcDao;
	
	@PostMapping("findRecommenders")
	public Callable<ResultModel> findRecommenders(long userId,String token){
		return()->{
			userBo.loginByToken(userId, token);
			List<Map<String,Object>> list=this.jdbcDao.findRecommenders(userId);
			return new ResultModel(true,"",list);
		};
	}
	
	@PostMapping("findRecommendersV2")
	public Callable<ResultModel> findRecommendersV2(long userId,String token,String beginTimeStr,String endTimeStr){
		return ()->{
			userBo.loginByToken(userId, token);
			Date beginTime=Formatter.dateFormatter.parse(beginTimeStr);
			Date endTime=Formatter.dateFormatter.parse(endTimeStr);
			List<Map<String,Object>> list=this.jdbcDao.findRecommendersV2(userId,beginTime,endTime);
			return new ResultModel(true,"",list);
		};
	}
	
	@PostMapping("login")
	public Callable<ResultModel> login(String phone,String password){
		return ()->{
			UserDmo user=this.userBo.loginByPassword(phone, password);
			Map<String,Object> map=new HashMap<>();
			map.put("id", user.getId());
			map.put("nickname", user.getNickname());
			map.put("account", user.getAccount());
			map.put("token", user.getToken());
			return new ResultModel(true,"",map);
		};
	}
}
