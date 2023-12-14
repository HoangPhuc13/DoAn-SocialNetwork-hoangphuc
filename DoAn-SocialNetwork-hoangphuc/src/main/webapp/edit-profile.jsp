<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Winku Social Network Toolkit</title>
<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/color.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/responsive.css">

<style type="text/css">
.avatar-height {
	height: 160px;
}

.navbar-avatar {
	height: 60px;
	width: 60px;
}
</style>
</head>
<body>
	<c:if test="${empty sessionScope.loginStatus}">
		<c:redirect url="login&register.jsp" />
	</c:if>
	<!--<div class="se-pre-con"></div>-->
	<div class="theme-layout">

		<div class="responsive-header">
			<div class="mh-head first Sticky">
				<span class="mh-btns-left"> <a class="" href="#menu">
						<i class="fa fa-align-justify"></i>
					</a>
				</span> <span class="mh-text"> <a href="newsfeed.html" title="">
						<img src="images/logo2.png" alt="">
					</a>
				</span> <span class="mh-btns-right"> <a class="fa fa-sliders"
						href="#shoppingbag"></a>
				</span>
			</div>
			<div class="mh-head second">
				<form class="mh-form">
					<input placeholder="search" />
					<a href="#/" class="fa fa-search"></a>
				</form>
			</div>

		</div>
		<!-- responsive header -->

		<div class="topbar stick">
			<div class="logo">
				<a title="" href="newsfeed.jsp">
					<img src="images/logo.png" alt="">
				</a>
			</div>

			<div class="top-area">
				<ul class="setting-area">
					<li>
						<a href="#" title="Home" data-ripple="">
							<i class="ti-search"></i>
						</a>
						<div class="searched">
							<form method="post" class="form-search" id="searchForm"
								action="/DoAn-SocialNetwork/search-friends">

								<input type="text" placeholder="Search Users" name="keyWord"
									required>

								<button type="button" onclick="submitSearchForm()">
									<i class="ti-search"></i>
								</button>
								<script type="text/javascript">
									function submitSearchForm() {
										var form = document
												.getElementById("searchForm");
										var input = document
												.querySelector('input[name="keyWord"]');

										if (input.value.length < 1) {
											input.placeholder = "Please type something to find!"
											return;
										}

										form.submit();
									}
								</script>
							</form>
						</div>
					</li>


				</ul>
				<div class="user-img">
					<c:set var="user" value="${sessionScope.loggedInUser}" />
					<img class="navbar-avatar" src="${user.getAnhDaiDien()}"
						alt="nothing">
					<span class="status f-online"></span>
					<div class="user-setting" style="left: -80px; width: 150px">
						<script>
							// Định nghĩa hàm redirect
							function redirect(url) {
								window.location.href = url;

							}
						</script>
						<a href="my-page.jsp" title=""
							onclick="redirect('/DoAn-SocialNetwork/my-page.jsp')">
							<i class="ti-user"></i> view profile
						</a>
						<a href="edit-profile.jsp" title=""
							onclick="redirect('/DoAn-SocialNetwork/edit-profile.jsp')">
							<i class="ti-pencil-alt"></i>edit profile
						</a>
						<a href="edit-password.jsp" title=""
							onclick="redirect('/DoAn-SocialNetwork/edit-password.jsp')">
							<i class="ti-lock"></i>edit password
						</a>
						<a href="#" title=""
							onclick="redirect('/DoAn-SocialNetwork/controller/logout-servlet')">
							<i class="ti-power-off"></i>log out
						</a>
					</div>
				</div>

			</div>
		</div>
		<!-- topbar -->

		<section>
			<div class="feature-photo">
				<figure>
					<img src="images/resources/timeline-1.jpg" alt="">
				</figure>


				<form class="edit-phto">
					<i class="fa fa-camera-retro"></i> <label class="fileContainer">
						Edit Cover Photo <input type="file" />
					</label>
				</form>
				<div class="container-fluid">
					<div class="row merged">
						<div class="col-lg-2 col-sm-3">
							<div class="user-avatar">
								<figure>
									<img class="avatar-height" src="${user.getAnhDaiDien()}" alt="">
									<form class="edit-phto">
										<i class="fa fa-camera-retro"></i> <label
											class="fileContainer"> Edit Display Photo <input
											type="file" />
										</label>
									</form>
								</figure>
							</div>

							<div style="padding-top: 10px">
								<ul style="list-style-type: none">
									<li class="admin-name">
										<h5 style="text-align: left; color: #088dcd">${user.getHoTen()}
										</h5>
									</li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
		</section>
		<!-- top area -->

		<section>
			<div class="gap gray-bg">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<div class="row" id="page-contents">
								<div class="col-lg-3">
									<aside class="sidebar static">

										<div class="widget">
											<h4 class="widget-title">Shortcuts</h4>
											<ul class="naves">
												<li>
													<i class="ti-clipboard"></i>
													<a href="newsfeed.jsp" title="">News feed</a>
												</li>

												<li>
													<i class="ti-files"></i>
													<a href="my-page.jsp" title="">My pages</a>
												</li>
												<li>
													<i class="ti-user"></i>
													<a href="/DoAn-SocialNetwork/controller/friend-servlet"
														title="">Friends</a>
												</li>
												<li>
													<i class="ti-image"></i>
													<a href="photos.jsp" title="">Images</a>
												</li>
												<li>
													<i class="ti-video-camera"></i>
													<a href="videos.jsp" title="">Videos</a>
												</li>
												<li>
													<i class="ti-comments-smiley"></i>
													<a href="messages.html" title="">Messages</a>
												</li>
											</ul>
										</div>
										<!-- Shortcuts -->
									</aside>
								</div>
								<!-- sidebar -->
								<div class="col-lg-6">
									<div class="central-meta">
										<div class="editing-info">
											<h5 class="f-title">
												<i class="ti-info-alt"></i> Edit Basic Information
											</h5>

											<form method="post"
												action="/DoAn-SocialNetwork/controller/edit-profile-servlet"
												accept-charset="UTF-8">
												<div class="form-group ">
													<input type="text" id="input" required="required"
														name="name" value="${user.getHoTen()}" /> <label
														class="control-label" for="input">Your Name</label><i
														class="mtrl-select"></i>
												</div>
												<div class="form-group">
													<input type="email" required="required" name="email"
														value="${user.getEmail()}" /> <label
														class="control-label" for="input"><a
															href="https://wpkixx.com/cdn-cgi/l/email-protection"
															class="__cf_email__" data-cfemail="4b0e262a22270b">[email&#160;protected]</a></label><i
														class="mtrl-select"></i>
												</div>
												<div class="form-group">
													<input type="text" required="required" name="phone_number"
														id="phone_input" value="${user.getSoDienThoai()}" /> <label
														class="control-label" for="input">Phone No.</label><i
														class="mtrl-select"></i> <span id="phone-error-message"
														class="error-message" style="color: red"></span>
												</div>

												<div class="form-radio">
													<div class="radio">
														<label> <input type="radio" name="gender"
															value="male"><i class="check-box"></i>Male
														</label>
													</div>
													<div class="radio">
														<label> <input type="radio" name="gender"
															value="female"><i class="check-box"></i>Female
														</label>
													</div>
												</div>
												<div class="form-group">
													<input type="text" required="required" name="address"
														value="${user.getDiaChi()}" /> <label
														class="control-label" for="input">Your address</label><i
														class="mtrl-select"></i>
												</div>

												<div class="submit-btns">
													<button type="submit" class="mtr-btn" id="submit-btn">
														<span>Update</span>
													</button>
												</div>
											</form>

											<script type="text/javascript">
												var phone_input = document
														.getElementById('phone_input');
												var phone_error = document
														.getElementById('phone-error-message');
												var submit_btn = document
														.getElementById('submit-btn');

												function validatePhoneNumber(
														phoneNumber) {
													// Sử dụng biểu thức chính quy để kiểm tra số điện thoại có đúng định dạng không
													var phoneRegex = /^\d{10}$/;

													// Kiểm tra điều kiện
													return phoneRegex
															.test(phoneNumber);
												}

												phone_input.oninput = function() {

													let phoneNumber = phone_input.value;

													if (validatePhoneNumber(phoneNumber)) {
														phone_error.textContent = '';
														submit_btn.disabled = false;
													} else {
														phone_error.textContent = 'Số điện thoại phải có 10 chữ số';
														submit_btn.disabled = true;

														if (phoneNumber.length < 1) {
															phone_error.textContent = '';
														}
													}
												}

												var isMale = $
												{
													user.isGioiTinh()
												};
												var gender = document
														.getElementsByName('gender');
												if (isMale) {
													gender[0].checked = true;
												} else {
													gender[1].checked = true;
												}
											</script>
										</div>
									</div>
								</div>
								<!-- centerl meta -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<footer>
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-4">
						<div class="widget">
							<div class="foot-logo">
								<div class="logo">
									<a href="newsfeed.jsp" title="">
										<img src="images/logo.png" alt="">
									</a>
								</div>
								<p>The trio took this simple idea and built it into the
									world’s leading carpooling platform.</p>
							</div>
							<ul class="location">
								<li>
									<i class="ti-map-alt"></i>
									<p>33 new montgomery st.750 san francisco, CA USA 94105.</p>
								</li>
								<li>
									<i class="ti-mobile"></i>
									<p>+1-56-346 345</p>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-4">
						<div class="widget">
							<div class="widget-title">
								<h4>follow</h4>
							</div>
							<ul class="list-style">
								<li>
									<i class="fa fa-facebook-square"></i>
									<a href="https://web.facebook.com/shopcircut/" title="">facebook</a>
								</li>
								<li>
									<i class="fa fa-twitter-square"></i>
									<a href="https://twitter.com/login?lang=en" title="">twitter</a>
								</li>
								<li>
									<i class="fa fa-instagram"></i>
									<a href="https://www.instagram.com/?hl=en" title="">instagram</a>
								</li>
								<li>
									<i class="fa fa-google-plus-square"></i>
									<a href="https://plus.google.com/discover" title="">Google+</a>
								</li>
								<li>
									<i class="fa fa-pinterest-square"></i>
									<a href="https://www.pinterest.com/" title="">Pintrest</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-4">
						<div class="widget">
							<div class="widget-title">
								<h4>Navigate</h4>
							</div>
							<ul class="list-style">
								<li>
									<a href="about.html" title="">about us</a>
								</li>
								<li>
									<a href="contact.html" title="">contact us</a>
								</li>
								<li>
									<a href="terms.html" title="">terms & Conditions</a>
								</li>
								<li>
									<a href="#" title="">RSS syndication</a>
								</li>
								<li>
									<a href="sitemap.html" title="">Sitemap</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-4">
						<div class="widget">
							<div class="widget-title">
								<h4>useful links</h4>
							</div>
							<ul class="list-style">
								<li>
									<a href="#" title="">leasing</a>
								</li>
								<li>
									<a href="#" title="">submit route</a>
								</li>
								<li>
									<a href="#" title="">how does it work?</a>
								</li>
								<li>
									<a href="#" title="">agent listings</a>
								</li>
								<li>
									<a href="#" title="">view All</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-4">
						<div class="widget">
							<div class="widget-title">
								<h4>download apps</h4>
							</div>
							<ul class="colla-apps">
								<li>
									<a href="https://play.google.com/store?hl=en" title="">
										<i class="fa fa-android"></i>android
									</a>
								</li>
								<li>
									<a href="https://www.apple.com/lae/ios/app-store/" title="">
										<i class="ti-apple"></i>iPhone
									</a>
								</li>
								<li>
									<a href="https://www.microsoft.com/store/apps" title="">
										<i class="fa fa-windows"></i>Windows
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- footer -->
		<div class="bottombar">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<span class="copyright"><a target="_blank"
								href="https://www.templateshub.net">Templates Hub</a></span> <i><img
								src="images/credit-cards.png" alt=""></i>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script data-cfasync="false"
		src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script src="js/main.min.js"></script>
	<script src="js/script.js"></script>
	<script src="js/map-init.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8c55_YHLvDHGACkQscgbGLtLRdxBDCfI"></script>

</body>
</html>