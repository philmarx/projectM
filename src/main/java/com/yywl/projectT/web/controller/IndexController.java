package com.yywl.projectT.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/")
	public String login() {
		//login.html在resources/static下
		return "login.html";
	}
}
