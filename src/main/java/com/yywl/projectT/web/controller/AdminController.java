package com.yywl.projectT.web.controller;

import java.util.Date;
import java.util.UUID;
import java.util.concurrent.Callable;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yywl.projectT.bean.ValidatorBean;
import com.yywl.projectT.bo.AdminBo;
import com.yywl.projectT.core.MD5Util;
import com.yywl.projectT.core.ResultModel;
import com.yywl.projectT.dao.AdminDao;
import com.yywl.projectT.dao.ComplaintDao;
import com.yywl.projectT.dao.LocationDao;
import com.yywl.projectT.dao.RoomDao;
import com.yywl.projectT.dao.RoomMemberDao;
import com.yywl.projectT.dao.SuggestionDao;
import com.yywl.projectT.dao.TransactionDetailsDao;
import com.yywl.projectT.dao.UserDao;
import com.yywl.projectT.dao.WithdrawalsDao;
import com.yywl.projectT.dmo.AdminDmo;
import com.yywl.projectT.dmo.ComplaintDmo;
import com.yywl.projectT.dmo.LocationDmo;
import com.yywl.projectT.dmo.RoomMemberDmo;
import com.yywl.projectT.dmo.SuggestionDmo;
import com.yywl.projectT.dmo.WithdrawalsDmo;

@RequestMapping("admin")
@RestController
public class AdminController {

	@Autowired
	AdminBo adminBo;
	@Autowired
	AdminDao adminDao;

	@Autowired
	LocationDao locationDao;

	@Autowired
	RoomDao roomDao;

	@Autowired
	TransactionDetailsDao transactionDetailsDao;

	@Autowired
	UserDao userDao;

	@Autowired
	RoomMemberDao roomMemberDao;

	@Autowired
	ComplaintDao complaintDao;

	@Autowired
	SuggestionDao suggestionDao;

	@PostMapping("fenFa")
	public Callable<ResultModel> fenFa(long id, long userId, String token) {
		return () -> {
			this.adminBo.loginByToken(userId, token);
			this.adminBo.fenFa(id);
			return new ResultModel();
		};
	}

	/**
	 * 查看申请未迟到的用户
	 */
	@PostMapping("findAttend")
	public Callable<ResultModel> findAttend(long userId, String token, int page, int size) {
		return () -> {
			this.adminBo.loginByToken(userId, token);
			Page<RoomMemberDmo> roomMembers = this.roomMemberDao.findByRequestNotLate(true,
					new PageRequest(page, size));
			return new ResultModel(true, null, roomMembers);
		};
	}

	@PostMapping("findComplaints")
	public Callable<ResultModel> findComplaints(long userId, String token, int page, int size) {
		return () -> {
			this.adminBo.loginByToken(userId, token);
			Page<ComplaintDmo> complaint = this.complaintDao
					.findAll(new PageRequest(page, size, Direction.DESC, "createTime"));
			return new ResultModel(true, null, complaint);
		};
	}

	@PostMapping("findLocation")
	public Callable<ResultModel> findLocation(long userId, String token, Long id, int page, int size) {
		return () -> {
			this.adminBo.loginByToken(userId, token);
			if (id == null) {
				throw new Exception("用户不存在");
			}
			Pageable pageable = new PageRequest(page, size, Direction.DESC, "sendTime");
			Page<LocationDmo> locations = this.locationDao.findByUser_Id(id, pageable);
			return new ResultModel(true, null, locations);
		};
	}

	@PostMapping("findSuggestions")
	public Callable<ResultModel> findSuggestions(long userId, String token, int page, int size) {
		return () -> {
			this.adminBo.loginByToken(userId, token);
			Page<SuggestionDmo> suggestions = this.suggestionDao
					.findAll(new PageRequest(page, size, Direction.DESC, "createTime"));
			return new ResultModel(true, null, suggestions);
		};
	}

	@PostMapping("findUserInfo")
	public Callable<ResultModel> findUserInfo(long userId, String token, Long id) {
		return () -> {
			this.adminBo.loginByToken(userId, token);
			if (id == null) {
				throw new Exception("用户不存在");
			}
			return new ResultModel(true, null, this.userDao.findOne(id));
		};
	}

	/**
	 * 解冻保证金
	 */
	@PostMapping("jieDong")
	@Transactional(rollbackOn = Throwable.class)
	public Callable<ResultModel> jieDong(long userId, String token, long id) {
		return () -> {
			this.adminBo.loginByToken(userId, token);
			this.adminBo.jieDong(id);
			return new ResultModel();
		};
	}

	@PostMapping("login")
	public Callable<ResultModel> login(String username, String password) {
		return () -> {
			if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
				throw new Exception("用户名或密码不能为空");
			}
			AdminDmo admin = this.adminDao.findByUsername(username);
			if (admin == null) {
				log.info("用户名不存在");
				throw new Exception("用户名不存在或密码不正确");
			}
			if (!admin.getPassword().equals(MD5Util.getSecurityCode(password))) {
				log.error("密码不正确");
				throw new Exception("密码不正确或密码不正确");
			}
			admin.setToken(UUID.randomUUID().toString());
			admin.setExpire(new Date(System.currentTimeMillis() + 15 * 60 * 1000));
			this.adminDao.save(admin);
			return new ResultModel(true, "", admin);
		};
	}

	private final static Log log = LogFactory.getLog(AdminController.class);

	@PostMapping("findWithdrawals")
	public Callable<ResultModel> findWithdrawals(long userId, String token, Integer state, int page, int size) {
		return () -> {
			this.adminBo.loginByToken(userId, token);
			Pageable pageable = new PageRequest(ValidatorBean.page(page), ValidatorBean.size(size), Direction.DESC,
					"createTime");
			Page<WithdrawalsDmo> withdrawalsDmoPage;
			if (null == state) {
				withdrawalsDmoPage = this.withdrawalsDao.findAll(pageable);
			} else {
				withdrawalsDmoPage = this.withdrawalsDao.findByState(state, pageable);
			}
			return new ResultModel(true, "", withdrawalsDmoPage);
		};
	}

	@Autowired
	WithdrawalsDao withdrawalsDao;
}
