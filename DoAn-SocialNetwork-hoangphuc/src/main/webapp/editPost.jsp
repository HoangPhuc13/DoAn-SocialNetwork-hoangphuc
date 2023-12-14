<%@page import="model.baiViet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Winku Social Network Toolkit</title>
<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/color.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/responsive.css" />





<style type="text/css">
.edit-btn {
	text-align: right;
	margin-bottom: 10px;
}

.edit-btn button {
	border: none;
	background: #088dcd;
	color: white;
}

.edit-btn button:hover {
	background: #045185;
}

.post-avatar {
	height: 45px;
	width: 45px;
}
</style>


</head>
<body>


	<form action="update-post-servlet" method="post">
		<div class="container">
			<c:set var="postId" value="${sessionScope.postInfo.getId()}"></c:set>
			<c:set var="noidung" value="${sessionScope.postInfo.getNoiDung()}" />
			<c:set var="hinhanh" value="${sessionScope.postInfo.getHinhAnh()}" />
			<c:set var="ngaydang" value="${sessionScope.postInfo.getNgayDang()}" />
			<c:set var="userAvatar"
				value="${sessionScope.userPostInfo.getAnhDaiDien()}" />
			<c:set var="userName" value="${sessionScope.userPostInfo.getHoTen()}" />
			<fmt:formatDate pattern="HH:mm dd-MM-yyyy"
				value="${sessionScope.postInfo.ngayDang}" var="formattedDate" />



			<div class="central-meta item">
				<div class="user-post">
					<div class="friend-info">
						<figure>
							<img class="post-avatar" src="${userAvatar}" alt="" />
						</figure>
						<div class="friend-name">
							<ins>
								<a href="#" title="">${userName}</a>
							</ins>
							<span>${formattedDate}</span>
						</div>
						<div class="description">
							<textarea name="noidung" style="background: #f3f3f3; border: 1px solid #333333;" rows="2" cols="3" required="required">${noidung}</textarea>
						</div>
						<div class="post-meta">
							<img style="object-fit: fill; height: 300px;" src="${hinhanh}"
								alt="" />
						</div>
					</div>
					<!-- start comment -->


					<!-- end comment -->
				</div>

			</div>
			<div class="edit-btn">
				<input name="postId" type="hidden" value="${postId}">
				<button type="submit">Edit Post</button>
			</div>
		</div>
	</form>




</body>
</html>