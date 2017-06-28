package com.yywl.projectT.bean.config;

import java.util.concurrent.TimeUnit;

import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.stereotype.Component;

import com.yywl.projectT.bean.Keys;

@Component
public class CustomServletContainer implements EmbeddedServletContainerCustomizer {

	@Override
	public void customize(ConfigurableEmbeddedServletContainer container) {
		container.setPort(Keys.SERVER_PORT);
		container.setSessionTimeout(10, TimeUnit.MINUTES);
	}

}
