package com.yywl.projectT.web.controller;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yywl.projectT.bean.ResultModel;
import com.yywl.projectT.bo.AdminBo;
import com.yywl.projectT.bo.WithdrawalsBo;

@RestController
@RequestMapping("withdrawals")
public class WithdrawalsController {
	@Autowired
	AdminBo adminBo;
	@Autowired
	WithdrawalsBo withdrawalsBo;
	
	@PostMapping("agree")
	public Callable<ResultModel> agree(long id,long userId,String token){
		return ()->{
			this.adminBo.loginByToken(userId, token);
			this.withdrawalsBo.agree(id,userId);
			return new ResultModel();
		};
	}
	
	@PostMapping("disagree")
	public Callable<ResultModel> disagree(long id,long userId,String token){
		return ()->{
			this.adminBo.loginByToken(userId, token);
			this.withdrawalsBo.disagree(id,userId);
			return new ResultModel();
		};
	}
}
