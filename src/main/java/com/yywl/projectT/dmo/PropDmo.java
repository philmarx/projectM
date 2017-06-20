package com.yywl.projectT.dmo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 小道具
 * 
 * @author jphil
 *
 */
@Entity
@Table(name = "prop")
public class PropDmo implements Serializable {

	private static final long serialVersionUID = -7350948423925385444L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	/**
	 * 小纸条数量
	 */
	private int noteCount;

	/**
	 * 标签清除卡数量
	 */
	private int labelClearCount;

	/**
	 * 改名卡数量
	 */
	private int changeNicknameCount;

	/**
	 * 会员失效时间
	 */
	@Temporal(TemporalType.TIMESTAMP)
	private Date vipExpireDate;
	@ManyToOne
	@JoinColumn(name = "user_id")
	private UserDmo user;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getNoteCount() {
		return noteCount;
	}

	public void setNoteCount(int noteCount) {
		this.noteCount = noteCount;
	}

	public int getLabelClearCount() {
		return labelClearCount;
	}

	public void setLabelClearCount(int labelClearCount) {
		this.labelClearCount = labelClearCount;
	}

	public int getChangeNicknameCount() {
		return changeNicknameCount;
	}

	public void setChangeNicknameCount(int changeNicknameCount) {
		this.changeNicknameCount = changeNicknameCount;
	}

	public Date getVipExpireDate() {
		return vipExpireDate;
	}

	public void setVipExpireDate(Date vipExpireDate) {
		this.vipExpireDate = vipExpireDate;
	}

	public UserDmo getUser() {
		return user;
	}

	public void setUser(UserDmo user) {
		this.user = user;
	}

	public PropDmo() {
		super();
	}

	public PropDmo(Long id, int noteCount, int labelClearCount, int changeNicknameCount, Date vipExpireDate,
			UserDmo user) {
		super();
		this.id = id;
		this.noteCount = noteCount;
		this.labelClearCount = labelClearCount;
		this.changeNicknameCount = changeNicknameCount;
		this.vipExpireDate = vipExpireDate;
		this.user = user;
	}

}
