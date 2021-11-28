package com.homet.config;

import java.util.Arrays; 
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.homet.interceptor.LoginInterceptor;



@Configuration
public class MvcConfiguration implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		List<String> patterns= Arrays.asList("/detail","/user/*","/health/*","/kit/*");
		List<String> excludes= Arrays.asList("/user/join");
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(patterns)
		.excludePathPatterns(excludes);
	}

  

	
}
