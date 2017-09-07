package com.yywl.projectT.web.controller;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yywl.projectT.bean.ResultModel;
import com.yywl.projectT.bo.AdminBo;
import com.yywl.projectT.dao.AdminDao;
import com.yywl.projectT.dmo.AdminDmo;

@RestController
@RequestMapping("super")
public class SuperAdminController {
	
	@Autowired
	AdminBo adminBo;
	@Autowired
	AdminDao adminDao;
	
	@PostMapping("findAdmins")
	public Callable<ResultModel> findAdmins(long loginId, String token, int page, int size) {
		return () -> {
			this.adminBo.superLoginByToken(loginId, token);
			Pageable pageable = new PageRequest(page, size);
			Page<AdminDmo> admins=this.adminDao.findAll(pageable);
			return new ResultModel(true, "", admins);
		};
	}
	@PostMapping("disableAdmin")
	public Callable<ResultModel> disableAdmin(long loginId, String token,long adminId) {
		return ()->{
			this.adminBo.superLoginByToken(loginId, token);
			this.adminBo.disableAdmin(adminId);
			return new ResultModel(true);
		};
	}
	@PostMapping("enableAdmin")
	public Callable<ResultModel> enableAdmin(long loginId, String token,long adminId) {
		return ()->{
			this.adminBo.superLoginByToken(loginId, token);
			this.adminBo.enableAdmin(adminId);
			return new ResultModel(true);
		};
	}
	@PostMapping("removeAdmin")
	public Callable<ResultModel> removeAdmin(long loginId, String token,long adminId) {
		return ()->{
			this.adminBo.superLoginByToken(loginId, token);
			if (loginId==adminId) {
				throw new Exception("超管不能删除");
			}
			this.adminDao.delete(adminId);
			return new ResultModel(true);
		};
	}
	@PostMapping("findAdmin")
	public Callable<ResultModel> findAdmin(long loginId,String token,long adminId){
		return ()->{
			this.adminBo.superLoginByToken(loginId, token);
			return new ResultModel(true, "", this.adminDao.findOne(adminId));
		};
	}
	@PostMapping("updateAdmin")
	public Callable<ResultModel> updateAdmin(long loginId,String token,long adminId,String username,String password,String name){
		return ()->{
			this.adminBo.superLoginByToken(loginId, token);
			this.adminBo.updateAdmin(adminId,username,name,password);
			return new ResultModel(true, "", this.adminDao.findOne(adminId));
		};
	}
	@PostMapping("addAdmin")
	public Callable<ResultModel> addAdmin(long loginId,String token,String username,String password,String name){
		return ()->{
			this.adminBo.superLoginByToken(loginId, token);
			this.adminBo.addAdmin(username,name,password);
			return new ResultModel(true);
		};
	}
}
