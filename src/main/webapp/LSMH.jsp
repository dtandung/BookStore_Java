<%@page import="bean.khachhangbean"%>
<%@page import="bean.lichsumuahangbean"%>
<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Nhà Sách Minh Khai</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
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

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/public/share/assets/plugins/sweet-alert/sweetalert.min.js"></script>
<script
	src="/public/share/assets/js/pages/sweet-alert/sweet-alert-data.js"></script>
<link rel="stylesheet" href="base.css">
<base href="/JavanangcaoNhom04/">
</head>

<style>
a.bg-danger {
	pointer-events: none;
}

.navbar-nav {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
}

.icon_refund {
	font-size: 18px;
}

.continute_purchase a:hover {
	color: white;
	text-decoration: none;
}

.continute_purchase_text {
	color: #FFC107;
}

.soluong {
	width: 45px;
}

.form-control:focus {
	border-color: #DC3545;
	box-shadow: none;
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
				<c:if test="${sessionScope['khachhang'] != null}">
					<li class="nav-item"><a class="nav-link text-danger"
						href=thanh-toan>Thanh toán</a></li>
					<li class="nav-item"><a class="nav-link text-danger"
						href="LSMHController">Lịch sử mua hàng</a></li>
				</c:if>
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
					href="FrmDangKy.jsp"> <i class="fa fa-registered"
						aria-hidden="true"></i> Register
				</a></li>

				<li class="nav-item"><a class="nav-link text-danger"
					href="logout.jsp"> <i class="fa-solid fa-right-to-bracket "></i>
						Logout
				</a></li>
				<li class="nav-item">
					 <c:choose>
						<c:when test="${sessionScope.khachhang == null }">
							<a class="nav-link text-danger" href="ktdn"> <i
								class="fa-solid fa-right-from-bracket"></i> Login
							</a>
						</c:when>

						<c:otherwise>
							<a class="nav-link text-danger" href="Frmdangnhap.jsp"> Hi:
								${ sessionScope.khachhang.getHoten() } </a>
						</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</div>
	</nav>
	<div class="row" style="margin-right: 0px; margin-top: 50px">
		<div class="col-12">
			<div
				class=" d-flex flex-column-reverse justify-content-center w-full p-3">

				<table class="table table-striped mt-2">
					<thead>
						<tr class="bg-danger text-white text-center">

							<th class="col-md-3">Tên sách</th>
							<th class="col-md-1">Số Lượng</th>
							<th class="col-md-2">Ngày Mua</th>
							<th class="col-md-1">Giá</th>
							<th class="col-md-2	">Thành Tiền</th>
							<th class="col-md-2">Trạng Thái</th>
						</tr>
					</thead>
					<form action="LSMHController/check" method="post">
						<div class="d-flex flex-column-reverse">
							<div class=" p-2">
							<tbody>
							<c:forEach items="${ lsmh }" var="item">
								<tr>
									<td class="text-center">${item.tensach }</td>
									<td class="text-center">${item.soLuongMua }</td>
									<td class="text-center">${item.ngayMua }</td>

									<td class="text-center">${item.gia }</td>
									<td class="text-center">${item.thanhTien }</td>
									<c:choose>
										<c:when test="${item.daMua == true }">
											<td class="text-center col-md-2">Đã Thanh Toán</td>
										</c:when>
										<c:otherwise>
											<td class="col-md-2">Chưa Thanh Toán</td>
										</c:otherwise>

									</c:choose>
							</c:forEach>
						</tbody>
						</div>
						<div class=" p-2 justify-content-start">
							<button formaction="htsach_Controller" style="width: 190px"
								formmethod="post" type="submit"
								class="btn btn-small btn-info mr-3 ">Quay Lại Trang chủ</button>
						</div>
						</div>
					</form>
				</table>
			</div>
		</div>
	</div>
</body>
</html>