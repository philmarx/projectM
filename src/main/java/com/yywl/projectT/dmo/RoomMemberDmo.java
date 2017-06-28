package com.yywl.projectT.dmo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="room_member")
public class RoomMemberDmo implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name="room")
	private RoomDmo room;
	@ManyToOne
	@JoinColumn(name="member")
	private UserDmo member;
	
	private String nickname;
	@Column(name = "is_lock_money")
	private boolean isLockMoney = false;

	/**
	 * 请求没有迟到
	 */
	private boolean requestNotLate;

	/**
	 * 是否在线
	 */
	private boolean isOnline=true;
	
	/**
	 * 是否出发
	 */
	private boolean isAttend;


	/**
	 * 是否签到过
	 */
	private boolean isSigned;


	@ManyToOne
	@JoinColumn(name="game")
	private GameDmo game;
	private int result=0;
	
	private int point=0;

	private boolean ready;

	private double longitude=0;
	
	private double latitude=0;
	
	private int dealState=0;

	/**
	 * 是否已评价过
	 */
	private boolean isEvaluated=false;

	public RoomMemberDmo() {
		super();
	}

	public int getDealState() {
		return dealState;
	}

	public GameDmo getGame() {
		return game;
	}
			

	public Long getId() {
		return id;
	}


	public double getLatitude() {
		return latitude;
	}


	public double getLongitude() {
		return longitude;
	}


	public UserDmo getMember() {
		return member;
	}


	public String getNickname() {
		return nickname;
	}


	public int getPoint() {
		return point;
	}


	public int getResult() {
		return result;
	}


	public RoomDmo getRoom() {
		return room;
	}


	public boolean isAttend() {
		return isAttend;
	}


	public boolean isEvaluated() {
		return isEvaluated;
	}


	public boolean isLockMoney() {
		return isLockMoney;
	}


	public boolean isOnline() {
		return isOnline;
	}


	public boolean isReady() {
		return ready;
	}


	public boolean isRequestNotLate() {
		return requestNotLate;
	}


	public boolean isSigned() {
		return isSigned;
	}


	public void setAttend(boolean isAttend) {
		this.isAttend = isAttend;
	}


	public void setDealState(int dealState) {
		this.dealState = dealState;
	}


	public void setEvaluated(boolean isEvaluated) {
		this.isEvaluated = isEvaluated;
	}


	public void setGame(GameDmo game) {
		this.game = game;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}


	public void setLockMoney(boolean isLockMoney) {
		this.isLockMoney = isLockMoney;
	}


	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}


	public void setMember(UserDmo member) {
		this.member = member;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public void setOnline(boolean isOnline) {
		this.isOnline = isOnline;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public void setReady(boolean ready) {
		this.ready = ready;
	}


	public void setRequestNotLate(boolean requestNotLate) {
		this.requestNotLate = requestNotLate;
	}


	public void setResult(int result) {
		this.result = result;
	}


	public void setRoom(RoomDmo room) {
		this.room = room;
	}


	public void setSigned(boolean isSigned) {
		this.isSigned = isSigned;
	}

	

}
