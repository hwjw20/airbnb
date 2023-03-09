package com.jiwon.airbnb.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class PermissionInterceptor implements HandlerInterceptor{

	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		String uri = request.getRequestURI();
		
		if(userId != null) {
			// 로그인이 되어 있는 경우
			// 회원가입페이지, 로그인 페이지를 접근할 경우
			// /user/signin/view /user/singup/view
			// /user로 시작하는 페이지 접근할 경우
			if(uri.startsWith("/user")) {
				// 메모 리스트로 페이지 이동
				response.sendRedirect("/rooms/list/view");
				return false;
			}
			
		} else {
			// 로그인 되어 있지 않은 경우
			// 메모리스트, 입력화면 디테일화면으로 접근할 경우
			// 로그인 페이지로 이동
			if(uri.startsWith("/mypage")) {
				response.sendRedirect("/user/signin/email/view");
				return false;
			}
			
		}
		
		return true;
	}
}
