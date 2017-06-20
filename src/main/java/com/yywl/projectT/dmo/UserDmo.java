package com.yywl.projectT.dmo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.yywl.projectT.bean.JsonUtils;

@Entity
@Table(name = "user")
public class UserDmo implements Serializable {

	private static final long serialVersionUID = -7242158297419264901L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@JsonIgnore
	private String token;

	@JsonIgnore
	private String password;

	private String nickname = "";

	private Integer amount = 0;

	private String realName;
	
	/**
	 * 徽章
	 */
	private int badge;

	@Column(name = "lock_amount")
	private Integer lockAmount = 0;

	@Column(name = "id_card")
	@JsonIgnore
	private String idCard;

	private String phone;
	
	private boolean authorized;
	
	@Column(name = "qq_uid")
	@JsonIgnore
	private String qqUid;

	@Column(name = "wx_uid")
	@JsonIgnore
	private String wxUid;

	@Column(name = "xlwb_uid")
	@JsonIgnore
	private String xlwbUid;

	private Boolean gender;

	@Column(name = "is_init")
	private Boolean isInit = false;

	private String labels;

	private String avatarSignature="";

	public UserDmo() {
		super();
	}

	public UserDmo(Long id) {
		super();
		this.id = id;
	}
	
	public Integer getAmount() {
		return amount;
	}

	public String getAvatarSignature() {
		return avatarSignature;
	}

	public int getBadge() {
		return badge;
	}

	public Boolean getGender() {
		return gender;
	}

	public Long getId() {
		return id;
	}

	public String getIdCard() {
		return idCard;
	}


	public Boolean getIsInit() {
		return isInit;
	}

	public Set<String> getLabels() {
		@SuppressWarnings("unchecked")
		Set<String> list = JsonUtils.gson.fromJson(labels, Set.class);
		return list == null ? new HashSet<String>() : list;
	}

	public Integer getLockAmount() {
		return lockAmount;
	}

	public String getNickname() {
		return this.nickname;
	}

	public String getPassword() {
		return password;
	}

	public String getPhone() {
		return phone;
	}

	public String getQqUid() {
		return qqUid;
	}

	public String getRealName() {
		return realName;
	}

	public String getToken() {
		return token;
	}

	public String getWxUid() {
		return wxUid;
	}

	public String getXlwbUid() {
		return xlwbUid;
	}

	public boolean isAuthorized() {
		return authorized;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public void setAuthorized(boolean authorized) {
		this.authorized = authorized;
	}

	public void setAvatarSignature(String avatarSignature) {
		this.avatarSignature = avatarSignature;
	}

	public void setBadge(int badge) {
		this.badge = badge;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public void setIsInit(Boolean isInit) {
		this.isInit = isInit;
	}

	public void setLabels(Set<String> labels) {
		this.labels = JsonUtils.gson.toJson(labels);
	}

	public void setLockAmount(Integer lockAmount) {
		this.lockAmount = lockAmount;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setQqUid(String qqUid) {
		this.qqUid = qqUid;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public void setWxUid(String wxUid) {
		this.wxUid = wxUid;
	}

	public void setXlwbUid(String xlwbUid) {
		this.xlwbUid = xlwbUid;
	}

}
