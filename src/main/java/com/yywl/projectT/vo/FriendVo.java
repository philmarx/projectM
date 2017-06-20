package com.yywl.projectT.vo;

public class FriendVo {
	private Long id;
	private int point;
	private String nickname;
	private String avatarSignature;

	public String getAvatarSignature() {
		return avatarSignature;
	}

	public void setAvatarSignature(String avatarSignature) {
		this.avatarSignature = avatarSignature;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public FriendVo() {
		super();
	}

	public FriendVo(Long id, int point, String nickname,  String avatarSignature) {
		super();
		this.id = id;
		this.point = point;
		this.nickname = nickname;
		this.avatarSignature = avatarSignature;
	}

}
