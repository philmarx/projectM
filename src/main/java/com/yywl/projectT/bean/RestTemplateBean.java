package com.yywl.projectT.bean;

import javax.annotation.PostConstruct;

import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class RestTemplateBean {
	private RestTemplate restTemplate;

	public RestTemplate getBean() {
		return this.restTemplate;
	}

	@PostConstruct
	private void init() {
		this.restTemplate = new RestTemplate(new SimpleClientHttpRequestFactory());
	}
}
