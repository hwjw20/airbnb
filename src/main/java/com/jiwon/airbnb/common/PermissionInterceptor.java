package com.jiwon.airbnb.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class PermissionInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		// /user/signin/email/view
		String uri = request.getRequestURI();
		
		if(userId != null) {
			// 로그인이 되어 있는 경우
			// 숙소 리스트 화면 제외한 다른 페이지 접근하면
			// 숙소 리스트 페이지로 이동
			if(!uri.startsWith("/rooms")) {
				response.sendRedirect("/rooms/list/view");
				return false;
			}
		} else {
			// 로그인이 되어 있지 않은 경우
			// 마이페이지, 호스트 모드 화면으로 접근하면
			// 로그인 페이지로 이동
			if(uri.startsWith("/mypage") || uri.startsWith("/host")) {
				response.sendRedirect("/user/signin/email/view");
				return false;
			}
		}
		
		return true;
	}
}
