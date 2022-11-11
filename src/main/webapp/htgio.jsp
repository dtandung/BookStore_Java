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
<link rel="stylesheet" href="Assets/htgio.css">
<base href="/JavanangcaoNhom04/">
</head>

<style>

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

	<div class="row" style="margin-right: 0px;  margin-top: 50px">
		<div class="col-2">
			<div class="table table-hover">
				<a
					class=" text-white text-center nav-link collapsed border-bottom bg-danger">
					<h3 class="font-weight-bold">SÁCH</h3>
				</a>
				<c:forEach var="l" items="${dsloai}">
					<a
						class="padding-left list-group-item list-group-item-action list-group-item-light p-3 text-danger"
						href="htsach_Controller?ml=${l.getMaloai()}">
						${l.getTenloai()}</a>
				</c:forEach>

				<%--  <%
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
				%> --%>
			</div>
		</div>
		<div class="col-10">
			<div
				class=" d-flex flex-column-reverse justify-content-center w-full p-3">

				<table class="table  table-striped mt-2">
					<thead>
						<tr class="bg-danger text-white text-center">
							<th class="col-md-1"></th>
							<th class="col-md-2">Mã sách</th>
							<th class="col-md-2">Tên sách</th>
							<th class="col-md-1">Giá</th>
							<th class="col-md-3">Số lượng</th>
							<th class="col-md-2	">Thành Tiền</th>
							<th class="col-md-2"></th>
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
									class="btn btn-outline-success ml-3 " style="width:200px">Đi mua hàng ngay </button>
								 <img class="rounded mx-auto d-block" style="width:500px!important" src="image_sach/cartempty.png">
								<h5 class="text-center text-danger">Nhìn cái gì? Đi mua hàng đi!!! </h5>
							</c:if>

							<c:forEach items="${ sessionScope.gio.getAll() }" var="item">
								<tr>
									<td class="text-center"><input type="checkbox"
										name="check" value="${ item.masach }" class="form-check-input"
										id="exampleCheck1"></td>
									<td class="text-center">${ item.masach }</td>
									<td class="text-center">${ item.tensach }</td>
									<td class="text-center">${ item.gia }</td>

									<td class="text-center">
										<div class="d-flex buttons_added justify-content-center">

											<!-- <input class="minus is-form" type="button" value="-"> -->
											<input aria-label="quantity" class="soluong mr-3 input-qty"
												min="0" name="t${ item.masach }" type="number"
												value="${ item.soluong }">

											<!-- <input class="plus is-form" type="button" value="+"> -->

											<button name="btnsl" value="${ item.masach }" type="submit"
												class=" btn btn-outline-info" style="width:100px">Cập Nhật</button>


										</div>
									</td>

									<td class="text-center">${ item.thanhtien }</td>
									<td>
										<button value="${ item.masach }" name="btnxoa" type="submit"
											class="btn-icon">
											<i class="icon-delete fa-solid fa-trash pr-2"></i>
										</button>

									</td>

								</tr>
							</c:forEach>


							<%
							/* }
							} */
							%>
							<c:if test="${ sessionScope.gio.getAll().size() > 0}">

								<tr class="bg-danger text-white text-left">
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th class="text-center" scope="col" colspan="2">Tổng Tiền:
										${sessionScope.gio.Tongtien() }đ</th>
									<th scope="col"></th>
								</tr>
						</tbody>
						<div class="d-flex p-2 justify-content-center">
							<button name="btnxoaChon" type="submit"
								class="btn btn-outline-info mr-3 ">Xóa Đã Chọn</button>

							<button name="btnxoaAll" type="submit"
								class="btn btn-outline-danger mr-3 ">
								<iconify-icon class="icon_refund" icon="gridicons:refund"></iconify-icon>
								Hoàn Trả Tất Cả
							</button>

							<button type="button"
								class="btn btn-outline-warning continute_purchase ">
								<a class="continute_purchase_text" href="htsach_Controller">
									<i class="fa-solid fa-backward"></i> Tiếp Tục Mua Hàng
								</a>
							</button>

							<button formaction="htgio_Controller/confirm" formmethod="post"
								name="btnxacnhan" type="submit"
								class="btn btn-outline-success ml-3 ">Xác Nhận Thanh
								Toán</button>
						</div>
						</c:if>
					</form>
				</table>
			</div>
		</div>

	</div>

	<c:if test="${sessionScope['success'] != null }">
		<script type="text/javascript">
			Swal.fire({
				position : 'center',
				icon : 'success',
				title : 'Mua hàng thành công !!!',
				showConfirmButton : false,
				timer : 2500
			})
		</script>
		<%
		session.removeAttribute("success");
		%>
	</c:if>
</body>
</html>