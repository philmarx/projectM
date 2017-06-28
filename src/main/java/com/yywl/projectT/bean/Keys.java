package com.yywl.projectT.bean;

import org.springframework.stereotype.Component;

@Component
public class Keys {

	/**
	 * 默认端口
	 */
	public static final int SERVER_PORT = 9001;

	/**
	 * 每页最多显示行数
	 */
	public static final int PAGE_MAX_SIZE = 50;

	/**
	 * 发送小纸条提升好感度
	 */
	public static final double NOTE_ADD_FRIEND_POINT = 0.2;
	/**
	 * 查看排行榜显示的数量
	 */
	public static final int ORDER_SIZE = 15;

	public static class DruidConfig{
		public final static String username="tommet";
		public final static String password="tommet-druid";
		public final static String allow="218.108.228.117";
	}
	
	/**
	 * 房间万能密码
	 *
	 */
	public static final String ROOM_KEY = "AMIIBCgseMsjbg2ds3BZ";

	public static class Aliyun {
		public final static String STS_ACCESS_KEY_SECRET = "2FGcnVJFUAj0RqFdaR3WskshqkD2Uv";
		public final static String STS_ACCESS_KEY_ID = "LTAIG9PISoHt0Dnq";
		public final static String STS_ROLE_ARN = "acs:ram::1227591017927389:role/aliyunosstokengeneratorrole";
		public final static String STS_ROLE_SESSION_NAME = "external-username";
		public final static String REGION_CN_HANGZHOU = "cn-hangzhou";
		public final static String STS_API_VERSION = "2015-04-01";

	}

	public static class Weixin {
		public final static String APP_ID = "wxc9ba3b479546a874";
		public final static String APP_KEY = "DXFvNseMvdfIFmCcU6pUOk8IgigrCEuX";
		public final static String MCH_ID = "1480291952";
		public static final String CALL = "http://tomeet-app.hzease.com/weixin/call";
	}

	/**
	 * 支付宝订单方式
	 */
	public static final String ALIPAY_TYPE = "支付宝";
	/**
	 * 微信支付方式
	 */
	public static final String WEIXIN_TYPE = "微信";

	public static final class Alipay {
		public final static String APP_ID = "2017042506958849";
		public final static String APP_PRIVATE_KEY = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDjM9NVabApy6KePXl9w7QprjqIOb4Ib0IiDXFvNseMvdfIFmX8CcU6pUOk8IgigrR+CEunaKyNuDbrxAnfS1ThsQ69bCuARY1TnSggM4d8Wu/4o7vymEBvSCDdg6cW9+9TIXLJ0j6Kg1Li1uZe4+s6adSogPbeSvluzPfce8QdwqKlv6S4IK24WIzSJG9rR8La4Xqr72CDkQYhIPy+qCTdbbX69RvK8VUegCF1ZWTSiePXI9Lt1NkzgL7NTOfP+/RQBJ34u+p/4uldr8hJhPtiHS7vWuRO3LQ93wZkGdBiKL7W+ca5PSgkWjyOEApoWML7fG2QF86MRwH/TZVE2k7TAgMBAAECggEBAJjeIuBCJxxH/hdYJ2k+BvdQWeOUbk8AhM+imeMJSYRhq1Dd+Sp2bHSEA5pzmDUYGlb+P+DYpdkIzDMfiMDrz6W22sMKh85bfbZ3dCsOYKeEDBgQGoIkfJ4jOrGwRflHQoh9Zd1zD09lApzLmN7ZnUiFMmdZtkBk06UAVfjMcWzPZoCP7C6FY6BRDtZfeY2cu6aLr3QMgyKwxoKqERniC08/PBKW0bHds3BZA637A/o17uKeQfvu5d6poff6Zd8k/ptDvbzVyv59khTk/kYu5Dh0ZcwC96l+5Y82E6vp8CW7wo/L5+vJIYPvxJOU7bFOMMEZE68q4LzsADEYwXPo1jkCgYEA/D0STuOGk+iho12ucnqzvbKaqav7jBsmebYxlFe7KirxDpksxZgf7GBk6Z1nofnc6l2VXwuPZmWZTrsa4BR5HuCHMTjavq3Nq4EBFTwixgHj1KoNQotLVitPkjzONDe0K4+XW/CAZ/ZZSyg+cOsiiBrdo4btlBp1seLv8M2hjw8CgYEA5pctiAATvuWLqi63QWwztXA5W+JQmNo1GEF6wZ4i9YXPL1/cjOI7u2Q5+e6s+c0j7/2yrSlJYUkRZDrVNF/u/o+rKuAUlkP5kZCuJZu4Pu+OWgTJVa8d+tvy4cUczfZ43ql03n4SEZkDAECaA8QThIa0EXMb4472p3k+rYBRQ/0CgYBDX4ihW7KZlTx/Z0luOIoD9E3NXiudW68mOVz604ghlkC29oD38k8skv7BS5Lft96jFwYL0gmmfyK43c8q5S0I604Q/q+m2MOjuJxycJKVMvII3rcV/CDOTlk9pVIqrmpIbF0waIfTvQBSy9gJzzR1CEAFKsgQlBS1w/j05+fsTwKBgGYDyA79Cb9QyoNV+5kkB5Rju9ycuU+Gair6/RYfohPBSTIKVQa3J/n1k3ixUTGKwjVwpdXaCC7UJq+TH7P2JUPVx8JGNJVuKUFvIrxcshyV2wKUT4Zq3PaYzFF55Q5x1nObwKqWV+QVL7Cy4/B6lK/y8EMwC8yW+SSKjWIw/ML5AoGABeAslJGapsshwB+mp8FywYrQ8ZTOJ8YtvO6Ic36Ke4CMnfoMQQaeEUcxTxCO3HFsLa27TnhGoljdTei640UtqRXB8NFv1tliouxJddVQXDS26pNZcTwbCpvnC9kfVv6zvKnBUlFJHsRQ3m/R3g8aV4E1Fn7lG3VEwfPV5FPnRMk=";
		/**
		 * 应用公钥
		 */
		public final static String APP_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4zPTVWmwKcuinj15fcO0Ka46iDm+CG9CIg1xbzbHjL3XyBZl/AnFOqVDpPCIIoK0fghLp2isjbg268QJ30tU4bEOvWwrgEWNU50oIDOHfFrv+KO78phAb0gg3YOnFvfvUyFyydI+ioNS4tbmXuPrOmnUqID23kr5bsz33HvEHcKipb+kuCCtuFiM0iRva0fC2uF6q+9gg5EGISD8vqgk3W21+vUbyvFVHoAhdWVk0onj1yPS7dTZM4C+zUznz/v0UASd+Lvqf+LpXa/ISYT7Yh0u71rkTty0Pd8GZBnQYii+1vnGuT0oJFo8jhAKaFjC+3xtkBfOjEcB/02VRNpO0wIDAQAB";
		/**
		 * 阿里公钥
		 */
		public final static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvCvLwb8jl/kO60x/O2Lpr8kYHIDvS2hY5ozVMKGrgO+xEr7uw69o4NomhYOve1GhQmWehRzt0RpICiVSmTgka2WH/Z/5V/DFw39P6hOKkLg19b6DAFTOJwz6rrRzKnkvqZwCRlbs3MR8LHdQvNnb+e4rv1ZQBRXSh/dfZOnhD+7UNNMqv3s7iUdhgxUxiItHEWjY5Pg+6pI/V4VfmEPEChhkCmwQJjSC3LR6GXuiLMXpJK5pAcbgaWtn2j4I3UN6B2hHzyFniVyWyLXfE79ZKpKW/WlaAxoL/GoaKHdc4KC/L/s/Ru+NJpkNRabQrbu2v9RvPgnBU7uAfgHqsLX7IQIDAQAB";
		public final static String FORMAT = "json";
		public final static String CHARSET = "utf-8";

		public final static String CALL = "http://tomeet-app.hzease.com/alipay/call";
		
		public final static String APP_GATEWAY="http://tomeet-app.hzease.com/alipay/gateway";
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
		public final static String CMD_MSG_SENDLOCATION = "sendLocation";
		public final static String CMD_MSG_OUTMAN = "outMan";
		public final static String CMD_MSG_REFRESH_FRIENDS = "refreshFriends";
		public final static String CMD_MSG_RECEIVE_NOTES = "receiveScrip";

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

	public final static String SECRET = "tomeet";

	public final static String RONGCLOUD_SYSTEM_ID = "888888";

	public final static int AVERAGE_POINT = 5;

	public final static int NOTE_BADGE = 5;

	/**
	 * 喊话消耗徽章
	 */
	public static final int DECLARATION_BADGE = 1;

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
		 * 在圈内创建一次活动，经验值增加20
		 */
		public final static int CREATE_EXPERIENCE_ADD = 20;

		/**
		 * 圈子签到一次，经验值加2分
		 */
		public final static int SIGN_EXPERIENCE_ADD = 2;
	}

	/**
	 * 默认徽章数
	 */
	public final static int INIT_BADGE = 10;

	/**
	 * 会员经历一场活动，徽章增加1
	 */
	public final static int VIP_BADGE_ADD = 1;

	/**
	 * 系统用户ID，用于存剩余的保证金
	 */
	public final static long SYSTEM_ID = 888888L;

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
		public static final int DISTANCE = 300;
	}

	/**
	 * 使用一个徽章增加10个经验值
	 */
	public final static int USE_BADGE_ADD_EXPERIENCE = 10;

	/**
	 * 加入圈子时的经验值
	 */
	public static final int JOIN_CIRCLE_INIT_EXPERIENCE = 100;

	/**
	 * 创建圈子时增加的经验值
	 */
	public static final int CREATE_BADGE_ADD_EXPERIENCE = 200;

}
