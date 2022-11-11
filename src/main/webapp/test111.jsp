<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Nhà Sách Minh Khai</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://code.iconify.design/iconify-icon/1.0.0/iconify-icon.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
body {
	font-family: Varela Round;
	background: #f1f1f1;
}

a {
	text-decoration: none;
}

/* Card Styles */
.card-sl {
	border-radius: 8px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.card-image img {
	max-height: 100%;
	max-width: 100%;
	border-radius: 8px 8px 0px 0;
}

.card-action {
	position: relative;
	float: right;
	margin-top: -25px;
	margin-right: 20px;
	z-index: 2;
	color: #E26D5C;
	background: #fff;
	border-radius: 100%;
	padding: 15px;
	font-size: 15px;
	box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2), 0 1px 2px 0
		rgba(0, 0, 0, 0.19);
}

.card-action:hover {
	color: #fff;
	background: #E26D5C;
	-webkit-animation: pulse 1.5s infinite;
}

.card-heading {
	font-size: 18px;
	font-weight: bold;
	background: #fff;
	padding: 10px 15px;
}

.card-text {
	padding: 10px 15px;
	background: #fff;
	font-size: 14px;
	color: #636262;
}

.card-button {
	display: flex;
	justify-content: center;
	padding: 10px 0;
	width: 100%;
	background-color: #1F487E;
	color: #fff;
	border-radius: 0 0 8px 8px;
}

.card-button:hover {
	text-decoration: none;
	background-color: #1D3461;
	color: #fff;
}

@
-webkit-keyframes pulse { 0% {
	-moz-transform: scale(0.9);
	-ms-transform: scale(0.9);
	-webkit-transform: scale(0.9);
	transform: scale(0.9);
}
70
%
{
-moz-transform
:
scale(
1
);
-ms-transform
:
scale(
1
);
-webkit-transform
:
scale(
1
);
transform
:
scale(
1
);
box-shadow
:
0
0
0
50px
rgba(
90
,
153
,
212
,
0
);
}
100
%
{
-moz-transform
:
scale(
0.9
);
-ms-transform
:
scale(
0.9
);
-webkit-transform
:
scale(
0.9
);
transform
:
scale(
0.9
);
box-shadow
:
0
0
0
0
rgba(
90
,
153
,
212
,
0
);
}
}
</style>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="htsach_Controller"> <img
			src="minhkhai-logo.png" style="width: 130px;">
		</a>

		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto text-body">

				<li class="nav-item"><a class="nav-link text-danger"
					href="htsach_Controller">Trang chủ</a></li>
				<li class="nav-item"><a class="nav-link text-danger"
					href="htgio_Controller">Giỏ hàng</a></li>
				<li class="nav-item"><a class="nav-link text-danger" href="#">Thanh
						toán</a></li>
				<li class="nav-item"><a class="nav-link text-danger" href="#">Lịch
						sử mua hàng</a></li>
			</ul>

			<ul class="navbar-nav">
				<li class="nav-item"><div class="input-group ">
						<form action="htsach_Controller" method="post"
							class="form-inline ">
							<input type="search" name="txttk" class="form-control"
								placeholder="Tìm Kiếm">
							<div class="input-group-append ">
								<button name="butt" class="btn btn-danger" type="submit">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</form>
					</div></li>

				<li class="nav-item"><a class="nav-link text-danger"
					href="logout.jsp"> <i class="fa-solid fa-right-to-bracket "></i>
						Logout
				</a></li>
				<li class="nav-item">
					<%
					if (session.getAttribute("dn") == null) {
					%> <a class="nav-link text-danger" href="Frmdangnhap.jsp"> <i
						class="fa-solid fa-right-from-bracket"></i> Login
				</a> <%
 } else {
 %><a class="nav-link text-danger" href="Frmdangnhap.jsp"> Hi: <%=session.getAttribute("dn")%>
				</a> <%
 }
 %>
				</li>
			</ul>
		</div>
	</nav>
	<c:forEach items="${dssach}" var="item">
		<div class="container" style="margin-top: 50px;">
			<div class="row">
				<div class="col-md-3">
					<div class="card-sl">
						<div class="card-image">
							<img
								src="${item.anh }"/>
						</div>

						<a class="card-action" href="#"><i class="fa fa-heart"></i></a>
						<div class="card-heading">${item.tensach}</div>
						<div class="card-text">
						<span>Tác giả: ${item.tacgia }</span>
						</div>
						<div class="card-text">Giá: ${item.gia}vnđ</div>
						<a
											href="giohang_Controller?ms=${item.masach}&ts=${item.tensach}&gia=${item.gia}">
											<input class="btn btn-danger" name="butt" type="submit"
											value="Mua">
										</a>
						<a href="#" class="card-button"> Purchase</a>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>
