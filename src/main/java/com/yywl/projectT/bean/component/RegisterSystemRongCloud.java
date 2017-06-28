package com.yywl.projectT.bean.component;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yywl.projectT.bean.Keys;
/**
 * 注册融云系统用户
 */
@Component
public class RegisterSystemRongCloud {
	
	@Autowired
	RongCloudBean rongCloud;
	
	@PostConstruct
	public void register(){
		try {
			rongCloud.getToken(Keys.RONGCLOUD_SYSTEM_ID, "系统");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
