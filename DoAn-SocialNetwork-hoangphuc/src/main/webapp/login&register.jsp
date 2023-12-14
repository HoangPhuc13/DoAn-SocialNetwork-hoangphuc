<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
	<title>Winku Social Network Toolkit</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/fav.png" type="image/png" sizes="16x16"> 

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/color.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request .contextPath}/css/responsive.css">
    
    <style type="text/css">
    	.register-btn{
    		background: currentColor;
		    border: 1px solid currentColor;
		    font-size: 16px;
		    color: #4f93ce;
		    margin-top: 10px;
		    padding: 7px 30px;
    	}
    </style>
</head>
<body>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<c:if test="${sessionScope.loginStatus == true}">
    <c:redirect url="newsfeed.jsp"></c:redirect>
</c:if>


<!--<div class="se-pre-con"></div>-->
<div class="theme-layout">
	<div class="container-fluid pdng0">
		<div class="row merged">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="land-featurearea">
					<div class="land-meta">
						<h1>Winku</h1>
						
						<div class="friend-logo">
							<span><img src="${pageContext.request.contextPath}/images/wink.png" alt=""></span>
						</div>
						
					</div>	
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			 
				<div class="login-reg-bg <%= (request.getAttribute("show") != null)?request.getAttribute("show")+"":""%>">
					<div class="log-reg-area sign">
						<h2 class="log-title">Login</h2>
						
						<h5 class="log-title mt-3 " style="color:red"><%=(session.getAttribute("loginMessage") != null) ? session.getAttribute("loginMessage") : "" %></h5>
							
						<form method="post" action="/DoAn-SocialNetwork/controller/login-servlet">
								
								<%
									Cookie[] cookies = null;
									Cookie cookie = null;
									cookies = request.getCookies();
								    String username = ""; 
								    String password = ""; 
									
									if (cookies != null) {
							 
							            for (int i = 0; i < cookies.length; i++) {
							                cookie = cookies[i];
							               	if (cookie.getName().equals("username")){
							               		username = cookie.getValue();
							               	} 
							               	else if (cookie.getName().equals("password")){
							               		password = cookie.getValue();
							               	}
							            }
									}   
								%>								
							<div class="form-group">	
							  <input type="text" id="input" required="required" name="username" value="<%= username%>"/>
							  <label class="control-label" for="input" >Username</label><i class="mtrl-select"></i>
							</div>
							<div class="form-group">	
							  <input type="password" required="required" name="password" value="<%= password%>"/>
							  <label class="control-label" for="input" >Password</label><i class="mtrl-select"></i>
							</div>
						
							  
						
							<div class="checkbox">
							  <label>
								<input type="checkbox" checked="checked" name="isRememberUser"/><i class="check-box"></i>Always Remember Me.
							  </label>
							</div>
							<a href="#" title="" class="forgot-pwd">Forgot Password?</a>
							<div class="submit-btns">
								<button class="mtr-btn signin" type="submit" ><span>Login</span></button>
								<button class="mtr-btn signup" type="button"><span>Register</span></button>
							</div>
						</form>
					</div>
					
					<%=url %>
					<div class="log-reg-area reg">
						<h2 class="log-title">Register</h2>
						<h5 class="log-title mt-3 " style="color:red"><%= (request.getAttribute("thongBao") != null)?request.getAttribute("thongBao")+"":"" %></h5>
						<h5 class="log-title mt-3 " style="color:green"><%= (request.getAttribute("thongBao2") != null)?request.getAttribute("thongBao2")+"":"" %></h5>
						<form method="post" action="<%=url %>/controller/register-servlet">
							<div class="form-group">		
							  <input type="text" required="required" name="fullname"/>
							  <label class="control-label" for="input">Fullname</label><i class="mtrl-select"></i>
							</div>
							<div class="form-group">	
							  <input type="text" required="required" name="register_username"/>
							  <label class="control-label" for="input">User Name</label><i class="mtrl-select"></i>
							</div>
							<div class="form-group">	
							  <input type="password" required="required" name="password"/>
							  <label class="control-label" for="input">Password</label><i class="mtrl-select"></i>
							</div>
							<div class="form-radio">
							  <div class="radio">
								<label>
								  <input type="radio" name="radio" value="male" checked="checked"/><i class="check-box"></i>Male
								</label>
							  </div>
							  <div class="radio">
								<label>
								  <input type="radio" name="radio" value="female"/><i class="check-box"></i>Female
								</label>
							  </div>
							</div>
							<div class="form-group">	
							  <input type="email" required="required" name="email"/>
							  <label class="control-label" for="input"><a href="https://wpkixx.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="6c29010d05002c">[email&#160;protected]</a></label><i class="mtrl-select"></i>
							</div>
							<div class="checkbox">
							  <label>
								<input type="checkbox" checked="checked"/><i class="check-box"></i>Accept Terms & Conditions ?
							  </label>
							</div>
							<a href="${pageContext.request.contextPath}/login&register.jsp" title="" class="already-have">Already have an account</a>
							<div class="submit-btns">
								<button class="register-btn"  type="submit"><span style="color: white">Register</span></button>
								
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	<script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="js/main.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>