package com.yywl.projectT.core;

import java.beans.PropertyVetoException;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

import com.yywl.projectT.bean.RongCloudBean;

@Component
@EnableScheduling
@EnableCaching
public class Config {
	@Autowired
	Keys keys;
	@Autowired
	RongCloudBean rongCloud;

	@PreDestroy
	public void preDestory() {
		try {
			Enumeration<Driver> enumeration= DriverManager.getDrivers();
			db.close();
			while(enumeration.hasMoreElements()){
				Driver driver=enumeration.nextElement();
				DriverManager.deregisterDriver(driver);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private BasicDataSource db;
	
	@PostConstruct
	public void postConstruct() {
		try {
			rongCloud.getToken(Keys.RONGCLOUD_SYSTEM_ID, "系统");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Bean
	public DataSource dataSource() throws PropertyVetoException {
		/*db=new ComboPooledDataSource();
		db.setUser(keys.getDbUsername());
		db.setPassword(keys.getDbPassword());
		db.setJdbcUrl(keys.getDbUrl());
		db.setDriverClass("com.mysql.jdbc.Driver");*/
		db = new BasicDataSource();
		db.setUrl(keys.getDbUrl());
		db.setUsername(keys.getDbUsername());
		db.setPassword(keys.getDbPassword());
		db.setDriverClassName("com.mysql.jdbc.Driver");
		// 配置连接池的初始值,连接池启动时创建的初始化连接数量（默认值为0）
		// db.setInitialSize(1);
		// 当最小空闲时，当连接少于minIdle时会自动去申请一些连接
		db.setMinIdle(1);
		// 连接池中可同时连接的最大的连接数（默认值为8，调整为20，高峰单机器在20并发左右，自己根据应用场景定）
		db.setMaxActive(100);
		// 最大空闲时，当经过一个高峰之后，连接池可以将一些用不到的连接释放，一直减少到maxIdle为止
		db.setMaxIdle(20);
		// 最大等待时间，当没有可用连接时，连接池等待连接释放的最大时间，超过该时间限制会抛出异常，如果设置-1表示无限等待（默认为无限)以毫秒为单位
		db.setMaxWait(60000);
		// 是否自动回收超时连接
		db.setRemoveAbandoned(true);
		// 超时时间(以秒数为单位
		db.setRemoveAbandonedTimeout(180);
		// 代表每次检查链接的数量，建议设置和maxActive一样大，这样每次可以有效检查所有的链接
		db.setNumTestsPerEvictionRun(100);
		return db;
	}
}
