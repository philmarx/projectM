package com.yywl.projectT;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
public class ProjectMApplication  extends SpringBootServletInitializer{
/**
 * 在tomcat运行需要继承SpringBootServletInitializer实现configure方法
 */
    @Override    
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {    
        return application.sources(ProjectMApplication.class);    
        
    }    
	
	public static void main(String[] args) {
		SpringApplication.run(ProjectMApplication.class, args);
		
	}
	
}
