<%-- <%-- <%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Calendar c= Calendar.getInstance();
  int ngay=c.get(Calendar.DAY_OF_MONTH);
  int thang=c.get(Calendar.MONTH)+1	;
  int nam=c.get(Calendar.YEAR);
%>
 <div align="right">
   Hom nay, ngay <%=ngay %> thang <%=thang %> nam <%=nam %>
  </div>
  <hr>

<form action="htkq.jsp" method="post">
   Chon ngay:
    <select name="sngay">
    <%for(int i=1;i<=31;i++){ %>
         <option <%=(ngay==i?"selected":"") %>> <%=i %> </option>
         <%} %>
    </select>
    Chon thang:
    <select name="sthang">
        <%for(int i=1;i<=12;i++){ %>
         <option <%=(thang==i?"selected":"") %>> <%=i %> </option>
         <%} %>
    </select>
    Chon nam:
    <select name="snam">
    <%for(int i=nam-10;i<=nam;i++){ %>
         <option <%=(nam==i?"selected":"") %>> <%=i %> </option>
         <%} %>
    </select>	
    <input name="but1" type="submit" value="Xem ket qua">
</form>
</body>
</html>


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
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
  body {
  	padding: 0;
  	margin: 0;
	
        font-family: 'Poppins', sans-serif;
        background: #f1f1f1;
    }

    a {
        text-decoration: none;
    }

    /* Card Styles */

    .card-sl {
    width:275px;
    max-width: 275px;
    background: pink;
        border-radius: 8px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }
    
    .card-book {
    background: red;
    border-radius: 8px;
    background-color: white;
    	min-height: 475px;
    }
    
    .card-image{
    	width: 240px!important;
    	height: 250px!important;
    }

	img {
	max-height: 240px;
	}
	
	.card-author {
		max-height: 130px;
		min-height: 90px;
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
        box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2), 0 1px 2px 0 rgba(0, 0, 0, 0.19);
    }


    .card-heading {
        font-size: 18px;
        font-weight: bold;
       
    }

    .card-text {
    padding-top: 0px !important;
    word-break: break-word;
    white-space: normal;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    min-height: 2.8em;
    max-height: 2.8em;
    font-size: 0.8em;
    }
    
    .btn {
    	width: 100%;
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
				<li class="nav-item"><a class="nav-link text-danger"
					href="thanh-toan">Thanh toán</a></li>
				<c:if test="${sessionScope['khachhang'] != null}">
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
					<%
					if (session.getAttribute("khachhang") == null) {
					%>  <c:choose>
						<c:when test="${sessionScope.khachhang == null }">
							<a class="nav-link text-danger" href="ktdn"> <i
								class="fa-solid fa-right-from-bracket"></i> Login
							</a>
						</c:when>
						 <%} else {%>
						<c:otherwise>
							<a class="nav-link text-danger" href="Frmdangnhap.jsp"> Hi:
								${ sessionScope.khachhang.getHoten() } </a>
							<%}%>
						</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</div>
	</nav>
	<div class="row">
		<div class="col-2">
			<div class="table table-hover">
				<a
					class=" text-white text-center nav-link collapsed border-bottom bg-danger">
					<h3 class="font-weight-bold">SÁCH</h3>
				</a>
				<c:forEach var="l" items="${dsloai}">
					<a
						class="list-group-item list-group-item-action list-group-item-light p-3 text-danger"
						href="htsach_Controller?ml=${l.getMaloai()}">
						${l.getTenloai()}</a>
				</c:forEach>
			</div>
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

		<div class="col-10 ">
			<div class="row d-flex justify-content-center">


				<c:forEach items="${dssach}" var="item">

					<div class="col-4">
						<div class=" mt-5 d-flex justify-content-center">
							<div class="card-sl p-3">
								<div class="card-image d-flex justify-content-center">
									<img class="img-prd"src="${item.anh }" />
								</div>						
								<div class="card-author">
									<div class="card-heading">
								
									${item.tensach}
									
									</div>
									<div class="card-text mb-2">
										<span>Tác giả: ${item.tacgia }</span>
									</div>
									
								</div>
								<div class="">Giá: ${item.gia}vnđ</div>
								<a
									href="giohang_Controller?ms=${item.masach}&ts=${item.tensach}&gia=${item.gia}">
									<input class=" mt-4 btn btn-danger" name="butt"
									type="submit" value="Mua">
								</a>
							 </div>
						</div>

					</div>

				</c:forEach>
				<c:forEach items="${dssach}" var="item">
				<div class="col-6">
					<div class="container mt-5 d-flex justify-content-center">

						<div class="card p-3">

							<div class="d-flex align-items-center">

								<div class="image">
									<img src="${item.anh }" class="rounded" width="155">
								</div>

								<div class="ml-3 w-100">

									<h4 class="mb-0 mt-0 ">${item.tensach}</h4>
									<span>Tác giả: ${item.tacgia }</span>

									<div
										class="p-2 mt-2 bg-primary d-flex justify-content-between rounded text-white stats">

										<div class="d-flex flex-column">

											<span class="articles"> Giá Bán</span> <span class="number1">${item.gia}vnđ</span>

										</div>

									</div>
									<div class="button mt-2 d-flex flex-row align-items-center">

										<a
											href="giohang_Controller?ms=${item.masach}&ts=${item.tensach}&gia=${item.gia}">
											<input class="btn btn-danger" name="butt" type="submit"
											value="Mua">
										</a>

									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
				</c:forEach>
					<%
				}
				}
				%>
			</div>
			<div class="box-footer text-center mt-3 ">
				<c:if test="${ totalPage > 0 }">
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

	</div>
</body>
</html>



 --%> --%>