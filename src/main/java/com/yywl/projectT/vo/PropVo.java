package com.yywl.projectT.vo;

import java.util.Date;

public class PropVo {

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
	private Date vipExpireDate = new Date();

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

	public PropVo() {
		super();
	}

	public PropVo(int noteCount, int labelClearCount, int changeNicknameCount, Date vipExpireDate) {
		super();
		this.noteCount = noteCount;
		this.labelClearCount = labelClearCount;
		this.changeNicknameCount = changeNicknameCount;
		this.vipExpireDate = vipExpireDate;
	}

}
