package com.yywl.projectT.vo;

public class RoomResultMemberVo extends RoomMemberVo {

	public RoomResultMemberVo(long id, String nickname, boolean ready, String avatarSignature) {
		super(id, nickname, ready, avatarSignature);
	}

	/**
	 * 活动结束后加分情况
	 */
	private int point;

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	
	
}
