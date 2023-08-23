package com.jiwon.airbnb.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.jiwon.airbnb.common.FileManagerService;
import com.jiwon.airbnb.common.PermissionInterceptor;

@Configuration
public class WebMVCController implements WebMvcConfigurer{

	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/images/**").addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH + "/");
	}
	
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(interceptor)
//		.addPathPatterns("/**")
//		.excludePathPatterns("/user/signout", "/static/**", "/images/**");
//	}
	
}
