package com.yywl.projectT.bean.config;

import java.beans.PropertyVetoException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

import com.alibaba.druid.pool.DruidDataSource;
import com.yywl.projectT.bean.Keys.DruidConfig;

@Configuration
@EnableScheduling
@EnableCaching
public class Config {

	private DruidDataSource db;

	@Bean
	@ConfigurationProperties(prefix = "db") // 在application.properties中注册keys.db前缀，可设置属性
	public DataSource dataSource() throws PropertyVetoException {
		return this.db;
	}

	@Bean
	public ServletRegistrationBean druidServlet() {
		ServletRegistrationBean registrationBean = new ServletRegistrationBean(
				new com.alibaba.druid.support.http.StatViewServlet(), "/druid/*");
		Map<String, String> params = new HashMap<>();
		params.put("resetEnable", "true");
		params.put("loginUsername", DruidConfig.username);
		params.put("loginPassword", DruidConfig.password);
		params.put("allow", DruidConfig.allow);
		registrationBean.setInitParameters(params);
		return registrationBean;
	}

	@PostConstruct
	public void postConstruct() {
		this.db = new DruidDataSource();
	}

	@PreDestroy
	public void preDestory() {
		this.db.close();
	}
}
