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
		<%-- <div class="col-2">
			<div class="table table-hover">
				<a
					class=" text-white text-center nav-link collapsed border-bottom bg-danger">
					<h3 class="font-weight-bold">SÁCH</h3>
				</a>
				<%
				ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
				if (dsloai != null) {
					for (loaibean l : dsloai) {
				%>
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3 text-danger"
					href="htsach_Controller?ml=<%=l.getMaloai()%>"> <%=l.getTenloai()%></a>
				<%
				}
				}
				%>
			</div>
</div> --%>
		<div class="col-12">
			<div
				class=" d-flex flex-column-reverse justify-content-center w-full p-3">

				<table class="table  table-striped mt-2">
					<thead>
						<tr class="bg-danger text-white text-center">
							<!-- <th class="col-md-1"></th> -->
							<th class="col-md-1">Mã sách</th>
							<th class="col-md-3">Tên sách</th>
							<th class="col-md-1">Giá</th>
							<th class="col-md-2">Số lượng</th>
							<th class="col-md-2	">Thành Tiền</th>

						</tr>
					</thead>
					<form action="htgio_Controller" method="post">
						<%-- 	<%
				giohangbo gh = (giohangbo) session.getAttribute("gio");
				if (gh != null) {
					for (giohangbean s : gh.ds) {
				%> --%>
						<tbody>
							<c:if test="${ sessionScope.gio.getAll().size() == 0 }">
								<button formaction="htsach_Controller" formmethod="post"
									name="btnxacnhan" type="submit"
									class=" btn btn-outline-success ml-3 " style="width: 200px">Đi
									mua hàng ngay</button>
								<img class="rounded mx-auto d-block" style="width:500px!important" src="image_sach/cartempty.png">
								<h4 class="text-center text-danger">Đã bảo rồi đi mua hàng đi!!!</h4>
							</c:if>
							<c:forEach items="${ sessionScope.gio.getAll() }" var="item">
								<tr>
									<%-- <td class="text-center"><input type="checkbox" name="check"
						value="${ item.masach }" class="form-check-input"
						id="exampleCheck1"></td> --%>
									<td class="text-center">${ item.masach }</td>
									<td class="text-center">${ item.tensach }</td>
									<td class="text-center">${ item.gia }</td>

									<td class="text-center">${ item.soluong }</td>

									<td class="text-center">${ item.thanhtien }</td>

									<%-- <td>
						<button value="${ item.masach }" name="btnxoa" type="submit"
							class="btn btn-outline-danger ">
							<i class="fa-solid fa-trash pr-2"></i> Delete
						</button>

					</td> --%>
								</tr>
							</c:forEach>


							<%
							/* }
							} */
							%>
							<c:if test="${ sessionScope.gio.getAll().size() > 0}">

								<tr class="bg-danger text-white text-left">
									<!-- <th scope="col"></th> -->
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th class="text-center" scope="col" colspan="2">Tổng Tiền:
										${sessionScope.gio.Tongtien() }đ</th>

								</tr>
						</tbody>
						<div class="d-flex p-2 justify-content-center">
							<button name="btnthaydoi" type="submit"
								class="btn btn-outline-info mr-3 ">Thay đổi</button>

							<button formaction="thanh-toan/chap-nhan" formmethod="post"
								name="btnxacnhan" type="submit"
								class="btn btn-outline-success ml-3 ">Thanh Toán</button>
						</div>
						</c:if>
					</form>
				</table>
			</div>
		</div>
	</div>


</body>
</html>
