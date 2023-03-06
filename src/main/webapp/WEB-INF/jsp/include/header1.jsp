<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<header>
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
				
				<div class="dropdown">
				  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
				    Dropdown link
				  </a>
				
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				    <li><a class="dropdown-item" href="#">Action</a></li>
				    <li><a class="dropdown-item" href="#">Another action</a></li>
				    <li><a class="dropdown-item" href="#">Something else here</a></li>
				  </ul>
			</div>
				
				<div id="account" class="dropdown pr-3">
				  	<a class="btn btn-outline-secondary dropdown-toggle" role="button" href="#">
						<i class="bi bi-list"></i>
		    			<i class="bi bi-person-circle"></i>
				  	</a>
				  	<ul class="dropdown-menu">
				  		<li><a class="dropdown-item" href="/user/signin/email/view">로그인</a></li>
				  		<li><a class="dropdown-item" href="/user/signup/view">회원가입</a></li>
				  		<li><hr class="dropdown-divider"></li>
				  	</ul>
				</div>
			</div>
			<hr>
		</header>