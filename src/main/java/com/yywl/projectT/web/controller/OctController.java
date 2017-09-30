package com.yywl.projectT.web.controller;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yywl.projectT.bean.ResultModel;
import com.yywl.projectT.bo.AdminBo;
import com.yywl.projectT.bo.OctRoomBo;

@RestController
@RequestMapping("oct")
public class OctController {
	@Autowired
	AdminBo adminBo;

	/**
	 * 给一个人发放奖励
	 */
	@PostMapping("rewardOne")
	public Callable<ResultModel> rewardOne(long loginId, String token, long id) {
		return () -> {
			this.adminBo.loginByToken(loginId, token);
			octRoomBo.rewardOne(id);
			return new ResultModel();
		};
	}

	@PostMapping("revokeOne")
	public Callable<ResultModel> revokeOne(long loginId, String token, long id, String reason) {
		return () -> {
			this.adminBo.loginByToken(loginId, token);
			octRoomBo.revokeOne(id, reason);
			return new ResultModel();
		};
	}

	@PostMapping("revokeList")
	public Callable<ResultModel> revokeList(long loginId, String token, long roomId, String reason) {
		return () -> {
			this.adminBo.loginByToken(loginId, token);
			octRoomBo.revolkeListByRoomId(roomId,reason,loginId);
			return new ResultModel();
		};
	}

	@Autowired
	OctRoomBo octRoomBo;
}
