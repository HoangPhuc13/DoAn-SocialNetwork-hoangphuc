<%@page import="data_access.taiKhoanDAO"%>
<%@page import="data_access.BaiVietDAO"%>
<%@page import="model.baiViet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="model.taiKhoan"%>
<%@page import="model.binhLuan"%>
<%@page import="data_access.BinhLuanDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Winku Social Network Toolkit</title>
<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16">



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/color.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/responsive.css" />


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/newsfeed_css.css">
<!-- Thêm thư viện jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Add thư viện jQuery vào để submit file tự động -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


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
							<form method="post" class="form-search">
								<input type="text" placeholder="Search Friend">
								<button data-ripple>
									<i class="ti-search"></i>
								</button>
							</form>
						</div>
					</li>


				</ul>
				<div class="user-img">
					<img src="${sessionScope.loggedInUser.getAnhDaiDien()}" alt=""
						class="navbar-avatar">
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
									<%-- <img src="${pageContext.request.contextPath}/avatar/meme.jpg " alt="" class=" avatar-height"> --%>
									<img src="${sessionScope.loggedInUser.getAnhDaiDien()}" alt=""
										class="avatar-height">
									<form class="edit-phto" action="edit-avatar-servlet"
										id="uploadImage" method="post" enctype="multipart/form-data">
										<i class="fa fa-camera-retro"></i> <label
											class="fileContainer"> Edit Display Photo <input
											type="file" id="profile_avatar" name="profile_avatar" />
										</label>


									</form>
								</figure>
							</div>

							<div style="padding-top: 10px">
								<ul style="list-style-type: none">
									<li class="admin-name">
										<h5 style="text-align: center; color: #088dcd">${sessionScope.loggedInUser.getHoTen() }</h5>
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
											<h4 class="widget-title">Socials</h4>
											<ul class="socials">
												<li class="facebook">
													<a title="" href="#">
														<i class="fa fa-facebook"></i> <span>facebook</span>
														<ins>45 likes</ins>
													</a>
												</li>
												<li class="twitter">
													<a title="" href="#">
														<i class="fa fa-twitter"></i> <span>twitter</span>
														<ins>25 likes</ins>
													</a>
												</li>
												<li class="google">
													<a title="" href="#">
														<i class="fa fa-google"></i> <span>google</span>
														<ins>35 likes</ins>
													</a>
												</li>
											</ul>
										</div>
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
													<a href="friends.jsp" title="">Friends</a>
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
										<!-- Code chức năng thêm bài viết -->
										<div class="new-postbox">
											<figure>
												<img class="post-avatar"
													src="${sessionScope.loggedInUser.getAnhDaiDien()}" alt="" />
											</figure>
											<div class="newpst-input" style="border: 1px solid gray">
												<form action="post-servlet" method="post"
													onsubmit="return checkFormValidity()"
													enctype="multipart/form-data">
													<textarea name="content" id="content" rows="2"
														placeholder="write something" required="required"></textarea>
													<div class="image-container">

														<img class="previewImage" alt="nothing" id="previewImage"
															style="object-fit: cover; display: none" />
														<span class="remove-icon" id="removeImageIcon">&times;</span>
													</div>

													<!-- <img class="previewImage" alt="nothing" src="" id="previewImage" style="object-fit: contain; display: none"> -->

													<div class="attachments" style="border-top: 1px solid gray">
														<ul>
															<li>
																<i class="fa fa-music"></i> <label class="fileContainer">
																	<input type="file" />
																</label>
															</li>
															<li>
																<i class="fa fa-image"></i> <label class="fileContainer">
																	<input type="file" id="inputImage" name="inputImage"
																	autocomplete="off" onchange="checkFormValidity()" />
																</label>
															</li>
															<li>
																<i class="fa fa-video-camera"></i> <label
																	class="fileContainer"> <input type="file" />
																</label>
															</li>
															<li>
																<i class="fa fa-camera"></i> <label
																	class="fileContainer"> <input type="file" />
																</label>
															</li>

															<li>
																<button type="submit" id="postSubmit">Post</button>
															</li>
														</ul>
													</div>
												</form>
											</div>
										</div>
									</div>
									<div class="loadMore">
										<!-- START LOAD TIMELINE -->
										<!-- Thực hiện load bài viết ở đây -->
										<%
										ArrayList<baiViet> arrayList = new ArrayList<baiViet>();

										taiKhoan tk = (taiKhoan) session.getAttribute("loggedInUser");
										Integer loginId = tk.getId();
										BaiVietDAO baiVietDAO = new BaiVietDAO();
										arrayList = baiVietDAO.selectAllById(tk);

										for (baiViet baiViet : arrayList) {
											Timestamp ngaydang = baiViet.getNgayDang();
											SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm dd-MM-yyyy");
											String formattedDate = (ngaydang != null) ? dateFormat.format(ngaydang) : "N/A";
											Integer baiviet_id = baiViet.getTaiKhoan_id();

											taiKhoanDAO taiKhoanDAO = new taiKhoanDAO();
											String username = taiKhoanDAO.selectById(baiViet.getTaiKhoan_id()).getHoTen();
											String user_avatar = taiKhoanDAO.selectById(baiViet.getTaiKhoan_id()).getAnhDaiDien();
										%>

										<div class="central-meta item">
											<div class="user-post">
												<!-- Thêm phần tử cho icon 3 chấm và dropdown menu -->
												<%
												String displayValue = "style=\"display: inline-block";
												if (loginId.equals(baiviet_id)) {
													displayValue = "style=\"display: none";
												}
												%>

												<div class="ellipsis" id="ellipsis"
													<%=(loginId.equals(baiviet_id)) ? "style=\"display: inline-block" + "\"" : "style=\"display: none" + "\""%>>

													<button style="border: none" onclick="toggleDropdown(this)">...</button>
													<div class="dropdown-content">
														<a class="update_delete updatePost"
															data-id="<%=baiViet.getId()%>">Chỉnh sửa bài viết</a>
														<a class="update_delete deletePost"
															data-id=<%=baiViet.getId()%> href="#">Xóa bài viết</a>
													</div>
												</div>
												<div class="friend-info">
													<figure>
														<img
															style="width: 45px; height: 45px; border-radius: 100%"
															src="<%=user_avatar%>" alt="" />
													</figure>
													<div class="friend-name">
														<ins>
															<a href="#" title="">
																<%=username%>
															</a>
														</ins>
														<span> <%=formattedDate%>
														</span>
													</div>
													<div class="post-meta">
														<div class="description">
															<p>
																<%=baiViet.getNoiDung()%>
															</p>
														</div>
														<img src="<%=baiViet.getHinhAnh()%>" alt="" />
														<div class="we-video-info">
															<ul>
																<li>
																	<span class="views" data-toggle="tooltip" title="views">
																		<i class="fa fa-eye"></i> <ins>1.2k</ins>
																	</span>
																</li>
																<li>
																	<span class="comment" data-toggle="tooltip"
																		title="Comments"> <i class="fa fa-comments-o"></i>
																		<ins>52</ins>
																	</span>
																</li>
																<li>
																	<span class="like" data-toggle="tooltip" title="like">
																		<i class="ti-heart"></i> <ins>2.2k</ins>
																	</span>
																</li>
																<li>
																	<span class="dislike" data-toggle="tooltip"
																		title="dislike"> <i class="ti-heart-broken"></i>
																		<ins>200</ins>
																	</span>
																</li>
															</ul>
														</div>

													</div>
												</div>
												<!-- start comment -->
												<div class="coment-area">
													<ul class="we-comet">

														<%
														BinhLuanDAO binhLuanDAO = new BinhLuanDAO();

														for (binhLuan binhLuan : binhLuanDAO.selectAllBinhLuanById(baiViet.getId())) {

															taiKhoan taiKhoan = taiKhoanDAO.selectById(binhLuan.getTaiKhoan_id());
															Timestamp ngaytao = binhLuan.getNgayTao();
															SimpleDateFormat formatNgayTao = new SimpleDateFormat("HH:mm dd-MM-yyyy");

															String avatar = taiKhoan.getAnhDaiDien();
															String name = taiKhoan.getHoTen();
															String noidung = binhLuan.getNoiDung();
															String formattedNgayTao = (ngaytao != null) ? formatNgayTao.format(ngaytao) : "N/A";
														%>
														<!--START LOAD COMMENT LÊN -->
														<li>
															<div class="comet-avatar">
																<img class="post-avatar" src="<%=avatar%>" alt="">
															</div>
															<div class="we-comment">
																<div class="coment-head">
																	<h5>
																		<a id="cmt-name"><%=name%></a>
																	</h5>
																	<span><%=formattedNgayTao%></span>
																	<a class="we-reply" href="#" title="Reply">
																		<i class="fa fa-reply"></i>
																	</a>
																</div>
																<p><%=noidung%></p>
															</div>
														</li>
														<%
														}
														%>
														<!--END LOAD COMMENT LÊN -->

														<li class="post-comment">
															<div class="comet-avatar">
																<img class="post-avatar"
																	src="${sessionScope.loggedInUser.getAnhDaiDien()}"
																	alt="">
															</div>
															<div class="post-comt-box">
																<form action="comment-servlet" method="post">
																	<textarea id="user-comment" name="user-comment"
																		placeholder="Post your comment" rows="4" cols="50"
																		wrap="soft" required="required" style="height: auto;"></textarea>
																	<input name="baiViet_id" id="baiViet_id"
																		value="<%=baiViet.getId()%>" type="hidden">
																	<div>
																		<button type="submit"
																			style="background: #088dcd; bottom: -25px;">Post</button>
																	</div>

																</form>
															</div>
														</li>
													</ul>
												</div>
												<!-- end comment -->
											</div>
										</div>
										<%
										}
										%>
										<!-- Thực hiện load bài viết ở đây -->
										<!-- END LOAD TIMELINE	-->
									</div>
								</div>
								<!-- centerl meta -->
								<div class="col-lg-3">
									<aside class="sidebar static">

										<div class="widget friend-list stick-widget">
											<h4 class="widget-title">Friends</h4>
											<div id="searchDir"></div>
											<ul id="people-list" class="friendz-list">
												<li>
													<figure>
														<img src="images/resources/friend-avatar.jpg" alt="">
														<span class="status f-online"></span>
													</figure>
													<div class="friendz-meta">
														<a href="time-line.html">bucky barnes</a>
														<i><a
																href="https://wpkixx.com/cdn-cgi/l/email-protection"
																class="__cf_email__"
																data-cfemail="4136282f352433322e2d25243301262c20282d6f222e2c">[email&#160;protected]</a></i>
													</div>
												</li>
												<li>
													<figure>
														<img src="images/resources/friend-avatar2.jpg" alt="">
														<span class="status f-away"></span>
													</figure>
													<div class="friendz-meta">
														<a href="time-line.html">Sarah Loren</a>
														<i><a
																href="https://wpkixx.com/cdn-cgi/l/email-protection"
																class="__cf_email__"
																data-cfemail="3a585b48545f497a5d575b535614595557">[email&#160;protected]</a></i>
													</div>
												</li>
												<li>
													<figure>
														<img src="images/resources/friend-avatar3.jpg" alt="">
														<span class="status f-off"></span>
													</figure>
													<div class="friendz-meta">
														<a href="time-line.html">jason borne</a>
														<i><a
																href="https://wpkixx.com/cdn-cgi/l/email-protection"
																class="__cf_email__"
																data-cfemail="127873617d7c7052757f737b7e3c717d7f">[email&#160;protected]</a></i>
													</div>
												</li>
												<li>
													<figure>
														<img src="images/resources/friend-avatar4.jpg" alt="">
														<span class="status f-off"></span>
													</figure>
													<div class="friendz-meta">
														<a href="time-line.html">Cameron diaz</a>
														<i><a
																href="https://wpkixx.com/cdn-cgi/l/email-protection"
																class="__cf_email__"
																data-cfemail="620803110d0c0022050f030b0e4c010d0f">[email&#160;protected]</a></i>
													</div>
												</li>
												<li>

													<figure>
														<img src="images/resources/friend-avatar5.jpg" alt="">
														<span class="status f-online"></span>
													</figure>
													<div class="friendz-meta">
														<a href="time-line.html">daniel warber</a>
														<i><a
																href="https://wpkixx.com/cdn-cgi/l/email-protection"
																class="__cf_email__"
																data-cfemail="0963687a66676b496e64686065276a6664">[email&#160;protected]</a></i>
													</div>
												</li>
												<li>

													<figure>
														<img src="images/resources/friend-avatar6.jpg" alt="">
														<span class="status f-away"></span>
													</figure>
													<div class="friendz-meta">
														<a href="time-line.html">andrew</a>
														<i><a
																href="https://wpkixx.com/cdn-cgi/l/email-protection"
																class="__cf_email__"
																data-cfemail="5b313a283435391b3c363a323775383436">[email&#160;protected]</a></i>
													</div>
												</li>
												<li>

													<figure>
														<img src="images/resources/friend-avatar7.jpg" alt="">
														<span class="status f-off"></span>
													</figure>
													<div class="friendz-meta">
														<a href="time-line.html">amy watson</a>
														<i><a
																href="https://wpkixx.com/cdn-cgi/l/email-protection"
																class="__cf_email__"
																data-cfemail="472d263428292507202a262e2b6924282a">[email&#160;protected]</a></i>
													</div>
												</li>
												<li>

													<figure>
														<img src="images/resources/friend-avatar5.jpg" alt="">
														<span class="status f-online"></span>
													</figure>
													<div class="friendz-meta">
														<a href="time-line.html">daniel warber</a>
														<i><a
																href="https://wpkixx.com/cdn-cgi/l/email-protection"
																class="__cf_email__"
																data-cfemail="7a101b091514183a1d171b131654191517">[email&#160;protected]</a></i>
													</div>
												</li>
												<li>

													<figure>
														<img src="images/resources/friend-avatar2.jpg" alt="">
														<span class="status f-away"></span>
													</figure>
													<div class="friendz-meta">
														<a href="time-line.html">Sarah Loren</a>
														<i><a
																href="https://wpkixx.com/cdn-cgi/l/email-protection"
																class="__cf_email__"
																data-cfemail="7c1e1d0e12190f3c1b111d1510521f1311">[email&#160;protected]</a></i>
													</div>
												</li>
											</ul>
											<div class="chat-box">
												<div class="chat-head">
													<span class="status f-online"></span>
													<h6>Bucky Barnes</h6>
													<div class="more">
														<span><i class="ti-more-alt"></i></span> <span
															class="close-mesage"><i class="ti-close"></i></span>
													</div>
												</div>
												<div class="chat-list">
													<ul>
														<li class="me">
															<div class="chat-thumb">
																<img src="images/resources/chatlist1.jpg" alt="">
															</div>
															<div class="notification-event">
																<span class="chat-message-item"> Hi James! Please
																	remember to buy the food for tomorrow! I’m gonna be
																	handling the gifts and Jake’s gonna get the drinks </span> <span
																	class="notification-date"><time
																		datetime="2004-07-24T18:18" class="entry-date updated">Yesterday
																		at 8:10pm</time></span>
															</div>
														</li>
														<li class="you">
															<div class="chat-thumb">
																<img src="images/resources/chatlist2.jpg" alt="">
															</div>
															<div class="notification-event">
																<span class="chat-message-item"> Hi James! Please
																	remember to buy the food for tomorrow! I’m gonna be
																	handling the gifts and Jake’s gonna get the drinks </span> <span
																	class="notification-date"><time
																		datetime="2004-07-24T18:18" class="entry-date updated">Yesterday
																		at 8:10pm</time></span>
															</div>
														</li>
														<li class="me">
															<div class="chat-thumb">
																<img src="images/resources/chatlist1.jpg" alt="">
															</div>
															<div class="notification-event">
																<span class="chat-message-item"> Hi James! Please
																	remember to buy the food for tomorrow! I’m gonna be
																	handling the gifts and Jake’s gonna get the drinks </span> <span
																	class="notification-date"><time
																		datetime="2004-07-24T18:18" class="entry-date updated">Yesterday
																		at 8:10pm</time></span>
															</div>
														</li>
													</ul>
													<form class="text-box">
														<textarea placeholder="Post enter to post..."></textarea>
														<div class="add-smiles">
															<span title="add icon" class="em em-expressionless"></span>
														</div>
														<div class="smiles-bunch">
															<i class="em em---1"></i> <i class="em em-smiley"></i> <i
																class="em em-anguished"></i> <i class="em em-laughing"></i>
															<i class="em em-angry"></i> <i class="em em-astonished"></i>
															<i class="em em-blush"></i> <i class="em em-disappointed"></i>
															<i class="em em-worried"></i> <i
																class="em em-kissing_heart"></i> <i class="em em-rage"></i>
															<i class="em em-stuck_out_tongue"></i>
														</div>
														<button type="submit"></button>
													</form>
												</div>
											</div>
										</div>
										<!-- friends list sidebar -->
									</aside>
								</div>
								<!-- sidebar -->
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
									<a href="index-2.html" title="">
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
	<!-- thay đổi avatar -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#profile_avatar').change(function() {
				$('#uploadImage').submit();
			});
		});
	</script>


	<!-- START DELETE POST -->
	<script>
		$(document)
				.ready(
						function() {
							$('.deletePost').click(function(e) {
								e.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

								var postId = $(this).data('id'); // Lấy giá trị postId từ thuộc tính data-postid
								deletePost(postId);
							});

							function deletePost(postId) {
								$
										.ajax({
											type : 'POST', // Hoặc 'GET' tùy vào cách bạn cấu hình servlet
											url : '${pageContext.request.contextPath}/delete-post-servlet', // Đường dẫn đến servlet xử lý việc xóa bài viết
											data : {
												postId : postId
											}, // Dữ liệu gửi đi (postId)
											success : function(response) {
												// Xử lý kết quả trả về khi xóa thành công (nếu cần)
												console
														.log('Bài viết đã được xóa.');
												// Thực hiện các hành động cần thiết sau khi xóa bài viết thành công
											},
											error : function(xhr, status, error) {
												// Xử lý khi có lỗi xóa bài viết
												console
														.error(
																'Đã xảy ra lỗi khi xóa bài viết:',
																error);
											}
										});
							}
						});
	</script>
	<!-- END DELETE POST -->

	<!--START EDIT POST MODAL -->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('.updatePost')
									.click(
											function(e) {
												e.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>
												var postId = $(this).data('id'); // Lấy giá trị data-id từ thẻ <a>

												$
														.ajax({
															type : 'POST',
															url : '${pageContext.request.contextPath}/edit-post-servlet', // Đường dẫn đến servlet
															data : {
																postId : postId
															}, // Dữ liệu gửi đến servlet
															success : function(
																	response) {
																// Load nội dung từ editPost.jsp vào modal
																$(
																		'#editModalContent')
																		.html(
																				response);
																openModal(); // Mở modal sau khi load xong nội dung
															},
															error : function() {
																console
																		.log('Lỗi xử lý yêu cầu.');
															}
														});
											});
						});
	</script>


	<!--START MODAL -->
	<div id="backdrop" class="backdrop"></div>
	<div id="editModal" class="modal"
		style="width: 40%; margin: 10px auto 0 auto;">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<!-- Nội dung của modal -->
			<div id="editModalContent">
				<!-- Đây là nơi hiển thị thông tin của bài viết cần chỉnh sửa -->
				<jsp:include page="editPost.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<!-- END MODAL -->


	<script type="text/javascript">
		let scrollPosition = 0; // Biến lưu vị trí scroll trước khi mở modal

		function openModal() {
			// Lưu vị trí scroll trước khi mở modal
			scrollPosition = window.pageYOffset;
			event.preventDefault();
			let modalContent = document.getElementById('editModalContent');

			document.getElementById('editModal').style.display = 'block';
			document.body.classList.add('fixed-backdrop');
			//document.body.classList.add('blur-content');
			// Hiển thị phần nền mờ
			document.getElementById('backdrop').style.display = 'block';

			// Hiển thị modal
			document.getElementById('editModal').style.display = 'block';
		}

		function closeModal() {
			document.getElementById('editModal').style.display = 'none';
			document.body.classList.remove('fixed-backdrop');
			//document.body.classList.remove('blur-content');
			// Ẩn phần nền mờ
			document.getElementById('backdrop').style.display = 'none';

			// Ẩn modal
			document.getElementById('editModal').style.display = 'none';
			// Phục hồi vị trí scroll ban đầu khi đóng modal
			window.scrollTo(0, scrollPosition);
		}
	</script>

	<!--END EDIT POST MODAL -->


	<script>
		document.getElementById('cmt-name').addEventListener('click',
				function(event) {
					event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>
					// Các xử lý khác có thể được thêm vào đây
				});
	</script>



	<script type="text/javascript">
		var textarea = document.getElementById("user-comment");

		//Execute a function when the user presses a key on the keyboard
		textarea.addEventListener("keydown", function(event) {
			// If the user presses the "Enter" key on the keyboard
			if (event.key === "Enter") {
				// Cancel the default action, if needed
				event.preventDefault();

			}
		});
	</script>





	<!-- Chức năng đẳng bài viết	 -->
	<script type="text/javascript">
		function checkFormValidity() {
			var content = document.getElementById('content').value.trim();
			var imageInput = document.getElementById('inputImage');
			var submitButton = document.getElementById('postSubmit');

			if (content === ''
					&& (!imageInput.files || imageInput.files.length === 0)) {
				// Nếu textarea trống và không có hình ảnh được chọn, ngăn form submit
				alert("Vui lòng nhập nội dung hoặc chọn hình ảnh trước khi gửi.");
				return false; // Ngăn form submit
			}
			return true; // Cho phép form submit
		}
	</script>


	<!-- Tạo menu dropdown -->
	<script type="text/javascript">
		function toggleDropdown(button) {
			var dropdown = button.nextElementSibling;
			dropdown.classList.toggle("show");
		}

		// Đóng dropdown nếu người dùng nhấp ra ngoài
		window.onclick = function(event) {
			if (!event.target.matches('.ellipsis button')) {
				var dropdowns = document.querySelectorAll('.dropdown-content');
				dropdowns.forEach(function(dropdown) {
					if (dropdown.classList.contains('show')) {
						dropdown.classList.remove('show');
					}
				});
			}
		}
	</script>


	<!-- Chức năng load ảnh lên khung Post khi thực hiện thêm ảnh  -->
	<script type="text/javascript">
		document.getElementById("inputImage").addEventListener(
				"change",
				function() {
					var previewImage = document.getElementById("previewImage");
					var removeImageIcon = document
							.getElementById("removeImageIcon");
					var file = this.files[0];

					if (file) {
						var reader = new FileReader();

						reader.onload = function(e) {
							previewImage.src = e.target.result;
							previewImage.style.display = "block";
							removeImageIcon.style.display = "block"; // Hiển thị icon X khi có ảnh được chọn
						};

						reader.readAsDataURL(file);
					} else {
						previewImage.src = "";
						previewImage.style.display = "none";
						removeImageIcon.style.display = "none"; // Ẩn icon X khi không có ảnh được chọn
					}
				});

		document.getElementById("removeImageIcon").addEventListener("click",
				function() {
					var previewImage = document.getElementById("previewImage");
					var inputImage = document.getElementById("inputImage");

					// Xóa hình ảnh từ thẻ img
					previewImage.src = "";
					previewImage.style.display = "none";

					// Đặt giá trị của input file về null để xóa file đã chọn
					inputImage.value = null;

					// Ẩn icon X khi loại bỏ ảnh
					this.style.display = "none";
				});
	</script>











	<script data-cfasync="false"
		src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/js/map-init.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8c55_YHLvDHGACkQscgbGLtLRdxBDCfI"></script>

</body>
</html>