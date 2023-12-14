<%@page import="model.taiKhoan"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="css/main.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/color.css">
<link rel="stylesheet" href="css/responsive.css">


</head>
<body>
	<c:if test="${empty sessionScope.loginStatus}">
		<c:redirect url="login&register.jsp" />
	</c:if>
	<!--<div class="se-pre-con"></div>-->
	<div class="theme-layout">


		<div class="responsive-header">
			<div class="mh-head first Sticky">
				<span class="mh-btns-left"> <a class="" href="#menu"><i
						class="fa fa-align-justify"></i></a>
				</span> <span class="mh-text"> <a href="newsfeed.html" title=""><img
						src="images/logo2.png" alt=""></a>
				</span> <span class="mh-btns-right"> <a class="fa fa-sliders"
					href="#shoppingbag"></a>
				</span>
			</div>
			<div class="mh-head second">
				<form class="mh-form">
					<input placeholder="search" /> <a href="#/" class="fa fa-search"></a>
				</form>
			</div>

		</div>

		<!-- responsive header -->

		<div class="topbar stick">
			<div class="logo">
				<a title="" href="newsfeed.jsp"><img src="images/logo.png"
					alt=""></a>
			</div>
			<div class="top-area">

				<ul class="setting-area">
					<li><a href="#" title="Home" data-ripple=""><i
							class="ti-search"></i></a>
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
						</div></li>
					<li><a onclick ="redirect('newsfeed.jsp')" href="newsfeed.html" title="Home" data-ripple=""><i
							class="ti-home"></i></a></li>
					<li><a href="#" title="Notification" data-ripple=""> <i
							class="ti-bell"></i><span>20</span>
					</a>
						<div class="dropdowns">
							<span>4 New Notifications</span>
							<ul class="drops-menu">
								<li><a href="notifications.html" title=""> <img
										src="images/resources/thumb-1.jpg" alt="">
										<div class="mesg-meta">
											<h6>sarah Loren</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag green">New</span></li>
								<li><a href="notifications.html" title=""> <img
										src="images/resources/thumb-2.jpg" alt="">
										<div class="mesg-meta">
											<h6>Jhon doe</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag red">Reply</span></li>
								<li><a href="notifications.html" title=""> <img
										src="images/resources/thumb-3.jpg" alt="">
										<div class="mesg-meta">
											<h6>Andrew</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag blue">Unseen</span></li>
								<li><a href="notifications.html" title=""> <img
										src="images/resources/thumb-4.jpg" alt="">
										<div class="mesg-meta">
											<h6>Tom cruse</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag">New</span></li>
								<li><a href="notifications.html" title=""> <img
										src="images/resources/thumb-5.jpg" alt="">
										<div class="mesg-meta">
											<h6>Amy</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag">New</span></li>
							</ul>
							<a href="notifications.html" title="" class="more-mesg">view
								more</a>
						</div></li>
					<li><a href="#" title="Messages" data-ripple=""><i
							class="ti-comment"></i><span>12</span></a>
						<div class="dropdowns">
							<span>5 New Messages</span>
							<ul class="drops-menu">
								<li><a href="notifications.html" title=""> <img
										src="images/resources/thumb-1.jpg" alt="">
										<div class="mesg-meta">
											<h6>sarah Loren</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag green">New</span></li>
								<li><a href="notifications.html" title=""> <img
										src="images/resources/thumb-2.jpg" alt="">
										<div class="mesg-meta">
											<h6>Jhon doe</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag red">Reply</span></li>
								<li><a href="notifications.html" title=""> <img
										src="images/resources/thumb-3.jpg" alt="">
										<div class="mesg-meta">
											<h6>Andrew</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag blue">Unseen</span></li>
								<li><a href="notifications.html" title=""> <img
										src="images/resources/thumb-4.jpg" alt="">
										<div class="mesg-meta">
											<h6>Tom cruse</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag">New</span></li>
								<li><a href="notifications.html" title=""> <img
										src="images/resources/thumb-5.jpg" alt="">
										<div class="mesg-meta">
											<h6>Amy</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag">New</span></li>
							</ul>
							<a href="messages.html" title="" class="more-mesg">view more</a>
						</div></li>

				</ul>
				<div class="user-img">
					<c:set var="avatar"
						value="${sessionScope.loggedInUser.getAnhDaiDien()}" />
					<img src="${avatar}" alt="nothing" width="60px" height="60px">
					<span class="status f-online"></span>
					<div class="user-setting" style="left: -80px; width: 150px">
						<script>
							// Định nghĩa hàm redirect
							function redirect(url) {
								window.location.href = url;

							}
						</script>
						<a href="my-page.jsp" title=""
							onclick="redirect('/DoAn-SocialNetwork/my-page.jsp')"><i
							class="ti-user"></i> view profile</a> <a href="edit-profile.jsp"
							title=""
							onclick="redirect('/DoAn-SocialNetwork/edit-profile.jsp')"><i
							class="ti-pencil-alt"></i>edit profile</a> <a
							href="edit-password.jsp" title=""
							onclick="redirect('/DoAn-SocialNetwork/edit-password.jsp')"><i
							class="ti-lock"></i>edit password</a> <a href="#" title=""
							onclick="redirect('/DoAn-SocialNetwork/controller/logout-servlet')"><i
							class="ti-power-off"></i>log out</a>
					</div>
				</div>

			</div>
		</div>
		<!-- topbar -->

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
												<a href="/DoAn-SocialNetwork/controller/friend-servlet" title="">Friends</a>
											</li>	
										</ul>
									</div><!-- Shortcuts -->
								</aside>
							</div><!-- sidebar -->
								<div class="col-lg-6">
									<div class="central-meta">
										<div class="frnds">
											<!-- Tab panes -->
											<div class="tab-content">
												<div class="tab-pane active fade show " id="frends">
													<c:if
														test="${not empty sessionScope.arrayList_TaiKhoans_SauKhiTimKiem}">

														<ul class="nearby-contct">
															<c:forEach var="item"
																items="${sessionScope.arrayList_TaiKhoans_SauKhiTimKiem}"
																varStatus="loop">
																<li>
																	<div class="nearly-pepls">
																		<!-- Các thông tin của item -->
																		<figure>
																			<a href="profile-servlet?id=${item.id}" title=""><img
																				src="${item.anhDaiDien}" alt=""></a>
																		</figure>
																		<div class="pepl-info">
																			<h4>
																				<a href="profile-servlet?id=${item.id}" title=""> <c:out
																						value="${item.hoTen}" /></a>
																			</h4>
																			<c:choose>
																				<c:when test="${item.friend}">
																					<!-- Nếu là bạn bè -->
																					<a									
																						href="/DoAn-SocialNetwork/controller/delete-friend-Servlet
																						?friendIdToDelete=${item.id}&url=s"
																						onclick=" alert('Hủy kết bạn thành công');" title=""
																						class="add-butn friend-btn" data-ripple="" 
																						style="background-color:#5590ad;">Hủy kết bạn
																					</a>

																				</c:when>
																				<c:otherwise>
																					<!-- Nếu không phải bạn bè -->
									
																					<a
																						style="width:95px;text-align:center;"
																						href="/DoAn-SocialNetwork/controller/add-friend-servlet?friendIdToAdd=${item.id}"
																						onclick="alert('Kết bạn thành công')" title=""
																						class="add-butn friend-btn" data-ripple="" >Kết bạn
																					</a>

																				</c:otherwise>
																			</c:choose>
																			
																		</div>
																	</div>
																</li>
															</c:forEach>

														</ul>
													</c:if>
													<c:if test="${empty sessionScope.arrayList_TaiKhoans_SauKhiTimKiem}">
														<h2>Không tìm thấy kết quả nào :(</h2>
													</c:if>
													
													<div class="lodmore">
														<button class="btn-view btn-load-more"></button>
													</div>
												</div>
												<div class="tab-pane fade" id="frends-req">
													<ul class="nearby-contct">
														<li>
															<div class="nearly-pepls">
																<figure>
																	<a href="time-line.html" title=""><img
																		src="images/resources/nearly5.jpg" alt=""></a>
																</figure>
																<div class="pepl-info">
																	<h4>
																		<a href="time-line.html" title="">Amy watson</a>
																	</h4>
																	<span>ftv model</span> <a href="#" title=""
																		class="add-butn more-action" data-ripple="">delete
																		Request</a> <a href="#" title="" class="add-butn"
																		data-ripple="">Confirm</a>
																</div>
															</div>
														</li>

														<li>
															<div class="nearly-pepls">
																<figure>
																	<a href="time-line.html" title=""><img
																		src="images/resources/nearly1.jpg" alt=""></a>
																</figure>
																<div class="pepl-info">
																	<h4>
																		<a href="time-line.html" title="">sophia Gate</a>
																	</h4>
																	<span>ftv model</span> <a href="#" title=""
																		class="add-butn more-action" data-ripple="">delete
																		Request</a> <a href="#" title="" class="add-butn"
																		data-ripple="">Confirm</a>
																</div>
															</div>
														</li>
														<li>
															<div class="nearly-pepls">
																<figure>
																	<a href="time-line.html" title=""><img
																		src="images/resources/nearly6.jpg" alt=""></a>
																</figure>
																<div class="pepl-info">
																	<h4>
																		<a href="time-line.html" title="">caty lasbo</a>
																	</h4>
																	<span>ftv model</span> <a href="#" title=""
																		class="add-butn more-action" data-ripple="">delete
																		Request</a> <a href="#" title="" class="add-butn"
																		data-ripple="">Confirm</a>
																</div>
															</div>
														</li>
														<li>
															<div class="nearly-pepls">
																<figure>
																	<a href="time-line.html" title=""><img
																		src="images/resources/friend-avatar9.jpg" alt=""></a>
																</figure>
																<div class="pepl-info">
																	<h4>
																		<a href="time-line.html" title="">jhon kates</a>
																	</h4>
																	<span>ftv model</span> <a href="#" title=""
																		class="add-butn more-action" data-ripple="">delete
																		Request</a> <a href="#" title="" class="add-butn"
																		data-ripple="">Confirm</a>
																</div>
															</div>
														</li>
														<li>
															<div class="nearly-pepls">
																<figure>
																	<a href="time-line.html" title=""><img
																		src="images/resources/nearly2.jpg" alt=""></a>
																</figure>
																<div class="pepl-info">
																	<h4>
																		<a href="time-line.html" title="">sara grey</a>
																	</h4>
																	<span>ftv model</span> <a href="#" title=""
																		class="add-butn more-action" data-ripple="">delete
																		Request</a> <a href="#" title="" class="add-butn"
																		data-ripple="">Confirm</a>
																</div>
															</div>
														</li>
														<li>
															<div class="nearly-pepls">
																<figure>
																	<a href="time-line.html" title=""><img
																		src="images/resources/nearly4.jpg" alt=""></a>
																</figure>
																<div class="pepl-info">
																	<h4>
																		<a href="time-line.html" title="">Sara grey</a>
																	</h4>
																	<span>ftv model</span> <a href="#" title=""
																		class="add-butn more-action" data-ripple="">delete
																		Request</a> <a href="#" title="" class="add-butn"
																		data-ripple="">Confirm</a>
																</div>
															</div>
														</li>
														<li>
															<div class="nearly-pepls">
																<figure>
																	<a href="time-line.html" title=""><img
																		src="images/resources/nearly3.jpg" alt=""></a>
																</figure>
																<div class="pepl-info">
																	<h4>
																		<a href="time-line.html" title="">Sexy cat</a>
																	</h4>
																	<span>ftv model</span> <a href="#" title=""
																		class="add-butn more-action" data-ripple="">delete
																		Request</a> <a href="#" title="" class="add-butn"
																		data-ripple="">Confirm</a>
																</div>
															</div>
														</li>
														<li>
															<div class="nearly-pepls">
																<figure>
																	<a href="time-line.html" title=""><img
																		src="images/resources/friend-avatar9.jpg" alt=""></a>
																</figure>
																<div class="pepl-info">
																	<h4>
																		<a href="time-line.html" title="">jhon kates</a>
																	</h4>
																	<span>ftv model</span> <a href="#" title=""
																		class="add-butn more-action" data-ripple="">delete
																		Request</a> <a href="#" title="" class="add-butn"
																		data-ripple="">Confirm</a>
																</div>
															</div>
														</li>
													</ul>
													<button class="btn-view btn-load-more"></button>
												</div>
											</div>
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
									<a href="index-2.html" title=""><img src="images/logo.png"
										alt=""></a>
								</div>
								<p>The trio took this simple idea and built it into the
									world’s leading carpooling platform.</p>
							</div>
							<ul class="location">
								<li><i class="ti-map-alt"></i>
									<p>33 new montgomery st.750 san francisco, CA USA 94105.</p></li>
								<li><i class="ti-mobile"></i>
									<p>+1-56-346 345</p></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-4">
						<div class="widget">
							<div class="widget-title">
								<h4>follow</h4>
							</div>
							<ul class="list-style">
								<li><i class="fa fa-facebook-square"></i> <a
									href="https://web.facebook.com/shopcircut/" title="">facebook</a></li>
								<li><i class="fa fa-twitter-square"></i><a
									href="https://twitter.com/login?lang=en" title="">twitter</a></li>
								<li><i class="fa fa-instagram"></i><a
									href="https://www.instagram.com/?hl=en" title="">instagram</a></li>
								<li><i class="fa fa-google-plus-square"></i> <a
									href="https://plus.google.com/discover" title="">Google+</a></li>
								<li><i class="fa fa-pinterest-square"></i> <a
									href="https://www.pinterest.com/" title="">Pintrest</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-4">
						<div class="widget">
							<div class="widget-title">
								<h4>Navigate</h4>
							</div>
							<ul class="list-style">
								<li><a href="about.html" title="">about us</a></li>
								<li><a href="contact.html" title="">contact us</a></li>
								<li><a href="terms.html" title="">terms & Conditions</a></li>
								<li><a href="#" title="">RSS syndication</a></li>
								<li><a href="sitemap.html" title="">Sitemap</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-4">
						<div class="widget">
							<div class="widget-title">
								<h4>useful links</h4>
							</div>
							<ul class="list-style">
								<li><a href="#" title="">leasing</a></li>
								<li><a href="#" title="">submit route</a></li>
								<li><a href="#" title="">how does it work?</a></li>
								<li><a href="#" title="">agent listings</a></li>
								<li><a href="#" title="">view All</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-4">
						<div class="widget">
							<div class="widget-title">
								<h4>download apps</h4>
							</div>
							<ul class="colla-apps">
								<li><a href="https://play.google.com/store?hl=en" title=""><i
										class="fa fa-android"></i>android</a></li>
								<li><a href="https://www.apple.com/lae/ios/app-store/"
									title=""><i class="ti-apple"></i>iPhone</a></li>
								<li><a href="https://www.microsoft.com/store/apps" title=""><i
										class="fa fa-windows"></i>Windows</a></li>
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
	<div class="side-panel"></div>
	<!-- side panel -->

	<script data-cfasync="false"
		src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script src="js/main.min.js"></script>
	<script src="js/script.js"></script>
	<script src="js/map-init.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8c55_YHLvDHGACkQscgbGLtLRdxBDCfI"></script>

</body>
</html>