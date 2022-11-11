<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- font -->
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
	<link rel="stylesheet" href="base.css">
	<link rel="stylesheet" href="sach.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
.page-item.active .page-link {
    color: #fff;
    background-color: #DC3545;
    border-color: #DC3545;
}
.page-link{
	color: #DC3545;
}
.page-link:hover{
	color: #DC3545;
}
.page-link:focus{
	 box-shadow:none;
}
.form-control:focus{
	border-color:#DC3545;
	box-shadow:none;
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
						<form class="form-inline" method="get" action="htsach_Controller">
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
					<%-- <%
					if (session.getAttribute("khachhang") == null) {
					%>  --%> <c:choose>
						<c:when test="${sessionScope.khachhang == null }">
							<a class="nav-link text-danger" href="ktdn"> <i
								class="fa-solid fa-right-from-bracket"></i> Login
							</a>
						</c:when>
						<%--  <%} else {%> --%>
						<c:otherwise>
							<a class="nav-link text-danger" href="Frmdangnhap.jsp"> Hi:
								${ sessionScope.khachhang.getHoten() } </a>
							<%-- <%}%> --%>
						</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</div>
	</nav>
	<div class="row" style="margin-right: 0px; margin-top: 50px">
		<!-- begin side bar right -->
		<div class=" col-2">
			<a
				class="text-white text-center nav-link border-bottom bg-danger">
				<h3 class="font-weight-bold">SÁCH</h3>
			</a>
			<div class="table" style="width: 100%">

				<c:forEach var="l" items="${dsloai}">
					<a
						class="padding-left list-group-item p-3 list-group-item-action text-danger"
						href="htsach_Controller?ml=${l.getMaloai()}">
						${l.getTenloai()}</a>
				</c:forEach>
			</div>

		</div>
		<!-- end side bar right -->

		<!-- begin content -->
		<div class="col-10">
			<div class="row d-flex justify-content-center">


				<c:forEach items="${dssach}" var="item">

					<div class="col-3">
						<div class=" mt-5 d-flex justify-content-center">
							<div class="card-sl p-3">
								<div class="card-image d-flex justify-content-center">
									<img class="img-prd" src="${item.anh }" />
								</div>
								<div class="card-author">
									<div class="card-heading">${item.tensach}</div>
									<div class="card-text mb-2">
										<span>Tác giả: ${item.tacgia }</span>
									</div>

								</div>
								<div class="">Giá: ${item.gia}vnđ</div>
								<a
									href="giohang_Controller?ms=${item.masach}&ts=${item.tensach}&gia=${item.gia}">
									<input class=" mt-4 btn btn-danger" name="butt" type="submit"
									value="Mua">
								</a>
							</div>
						</div>

					</div>

				</c:forEach>

			</div>
			<div class="box-footer  text-center mt-3 ">
				<c:if test="${ totalPage > 1 }">
					<div class="col">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center">
								<li class="page-item "><a class="page-link"
									href="htsach_Controller?index=${indexPage-1}${txttk != null ? '&txttk=': ''}${txttk != null ? txttk : ''}
								${ml != null ? '&ml=': ''}${ml != null ? ml : ''}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
								</a></li>
								<c:forEach var="i" begin="1" end="${totalPage}">
									<li class="page-item ${indexPage == i ? 'active' : '' }"><a
										class="page-link"
										href="htsach_Controller?index=${i}${txttk != null ? '&txttk=' : ''}${txttk != null ? txttk : ''}
								${ml != null ? '&ml=': ''}${ml != null ? ml : ''}">${i}</a></li>
									<!-- <li class="page-item"><a class="page-link" href="#">2</a></li> -->
								</c:forEach>

								<li class="page-item"><a class="page-link"
									href="htsach_Controller?index=${indexPage+1}${txttk != null ? '&txttk=': ''}${txttk != null ? txttk : ''}
								${ml != null ? '&ml=': ''}${ml != null ? ml : ''}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</c:if>
			</div>
		</div>
		<!-- end content -->

	</div>
</body>
</html>
