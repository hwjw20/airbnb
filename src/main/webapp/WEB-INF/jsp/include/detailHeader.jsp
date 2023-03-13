<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header id="detailHeader">
			<div class="d-flex justify-content-between pt-3">
				
				<div class="d-flex pl-3">
					<div>로고</div>
					<a id="logo" href="/rooms/list/view"><h4 class="ml-2" style="color:#f52a4f">airbnb</h4></a>
					
				</div>
				
				<div class="input-group col-5">
			  		<input type="text" class="form-control">
			  		<div class="input-group-append">
			    		<button class="btn" type="button" style="background-color:#f52a4f"><i class="bi bi-search text-white"></i></button>
			  		</div>	
				</div>
				
				<%-- 세션에 "userId"라는 키 값이 없다면 로그인이 안된 상태 --%>
				<c:if test="${empty userId}">
				<div id="account" class="dropdown">
					<button class="btn" type="button" id="dropdownMenuButton" data-toggle="dropdown">
						<i class="bi bi-list"></i>
		    			<i class="bi bi-person-circle"></i>
				  	</button>
				  <div class="dropdown-menu dropdown-menu-right">
				    <a class="dropdown-item small" href="/user/signin/email/view">로그인</a>
				    <a class="dropdown-item small" href="/user/signup/view">회원가입</a>
				    <div class="dropdown-divider"></div>
				    <br>
				    <br>
				  </div>
				</div>
				</c:if>
				
				<%-- 세션에 "userId"라는 키 값이 있다면 로그인이 된 상태 --%>
				<c:if test="${not empty userId}">
				<div id="account" class="dropdown">
					<button class="btn" type="button" id="dropdownMenuButton" data-toggle="dropdown">
						<i class="bi bi-list"></i>
		    			<i class="bi bi-person-circle"></i>
				  	</button>
				  <div class="dropdown-menu dropdown-menu-right">
				    <a class="dropdown-item small" href="/user/reservation/view">여행</a>
				    <a class="dropdown-item small" href="/user/wishlist/view">위시리스트</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item small" href="/host/view">숙소관리</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item small" href="/user/signout">로그아웃</a>
				  </div>
				</div>
				</c:if>
				
			</div>
			<hr>
		</header>