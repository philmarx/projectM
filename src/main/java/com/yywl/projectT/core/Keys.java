package com.yywl.projectT.core;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Keys {

	/**
	 * 默认端口
	 */
	public static final int SERVER_PORT = 9000;

	/**
	 * 每页最多显示行数
	 */
	public static final int PAGE_MAX_SIZE = 50;

	/**
	 * 查看排行榜显示的数量
	 */
	public static final int ORDER_SIZE = 15;

	public static class Aliyun {
		public final static String STS_ACCESS_KEY_SECRET = "2FGcnVJFUAj0RqFdaR3WskshqkD2Uv";
		public final static String STS_ACCESS_KEY_ID = "LTAIG9PISoHt0Dnq";
		public final static String STS_ROLE_ARN = "acs:ram::1227591017927389:role/aliyunosstokengeneratorrole";
		public final static String STS_ROLE_SESSION_NAME = "external-username";
		public final static String REGION_CN_HANGZHOU = "cn-hangzhou";
		public final static String STS_API_VERSION = "2015-04-01";

	}

	public static class RongCloud {
		// 正式环境
		public final static String APP_KEY = "8w7jv4qb8dlvy";
		public final static String APP_SECRET = "WVXvhJkK8hBqL5";

		// 开发环境
		// public final static String APP_KEY = "mgb7ka1nmvikg";
		// public final static String APP_SECRET = "fmnAt5ZeMPdp";

		public final static String CMD_MSG_REFRESH_ROOM = "refreshRoom";
		public final static String CMD_MSG_ROOM_DISSOLVE = "roomDissolve";
		public final static String CMD_SENDLOCATION = "sendLocation";
		public final static String CMD_OUTMAN = "outMan";
		public final static String CMD_REFRESH_FRIENDS="refreshFriends";
		public final static String CMD_RECEIVE_NOTES="receiveScrip";

	}

	public static class JPhsh {
		public final static String TEMP_ID = "49723";
		public final static String APP_KEY = "2c1a3f3d166e936294efc85e";
		public final static String MARKET_SECRET = "fc087c690a65cd1960467818";

		public final static String AUTHORIZATION = "Basic MmMxYTNmM2QxNjZlOTM2Mjk0ZWZjODVlOmZjMDg3YzY5MGE2NWNkMTk2MDQ2NzgxOA==";
		public final static String ALIAS = "testAlias";
	}

	public static class LoginType {
		public final static String PHONE = "PHONE";
		public final static String WEIBO = "WEIBO";
		public final static String WECHAT = "WECHAT";
		public final static String QQ = "QQ";
	}

	@Value("${keys.db.url}")
	private String dbUrl;

	@Value("${keys.db.username}")
	private String dbUsername;

	@Value("${keys.db.password}")
	private String dbPassword;

	public String getDbUrl() {
		return dbUrl;
	}

	public String getDbUsername() {
		return dbUsername;
	}

	public String getDbPassword() {
		return dbPassword;
	}

	public final static String SECRET = "app.yueyuan.pro";

	public final static String RONGCLOUD_SYSTEM_ID = "888888";

	public final static int AVERAGE_POINT = 5;

	public final static int NOTE_BADGE = 5;

	/**
	 * 喊话消耗徽章
	 */
	public static final int DECLARATION_BADGE=1;
	
	public static class Circle {
		/**
		 * 创建和加入圈子时扣除的勋章
		 */
		public final static int badgeSpend = 1;
		public final static String PREFIX = "";
		/**
		 * 在圈内加入一次活动，经验值增加10
		 */
		public final static int JOIN_EXPERIENCE_ADD = 10;
		/**
		 * 在圈内创建一次活动，经验值增加10
		 */
		public final static int CREATE_EXPERIENCE_ADD=10;
	}

	/**
	 * 默认徽章数
	 */
	public final static int INIT_BADGE = 10;

	/**
	 * 会员经历一场活动，徽章增加1
	 */
	public final static int VIP_BADGE_ADD=1;
	
	public static class Room {
		public final static String PREFIX = "";
		/**
		 * 娱乐模式的分数
		 */
		public final static int ENTERTAINMENT_POINT = 25;
		/**
		 * 初始化的分数
		 */
		public final static int INIT_POINT = 1000;

		/**
		 * 每场活动的总人数限制
		 */
		public final static int MEMBER_COUNT = 50;

		/**
		 * 默认每天最多进行的活动数
		 */
		public final static int MAX_ROOM_COUNT = 3;
		
		/**
		 * 活动地点的有效范围
		 */
		public static final int DISTANCE=300;
	}
}
