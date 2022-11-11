<%@page import="java.util.Calendar"%>
<%@page import="bean.sinhvienbean"%>
<%@page import="bo.sinhvienbo"%>
<%@page import="bean.monhocbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="bo.monhocbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
	.box-primary {
    border-top-color: #3c8dbc!important;
}

.box {
    position: relative;
    margin-bottom: 20px;
    width: 100%;
    box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 1px;
    border-radius: 3px;
    background: rgb(255, 255, 255);
    border-top: 3px solid rgb(210, 214, 222);
}

body {
	background-color: #ecf0f5!important;
}
.col-2 {
	height: 100vh!important;
	background-color: #FDFDFE!important;
	padding-right: 0;
}
.form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #80bdff;
    outline: 0;
    box-shadow:none;
}
a:hover{
	background-color: none;
}

</style>


<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark d-flex justify-content-end">
  	<span>
  		<%Calendar c= Calendar.getInstance();
  		int ngay=c.get(Calendar.DAY_OF_MONTH);
  		int thang=c.get(Calendar.MONTH)+1	;
 		 int nam=c.get(Calendar.YEAR);
		%>
 <div class="text-white">
   Hôm nay, Ngày <%=ngay %> Tháng <%=thang %> Năm <%=nam %>
 </div>

  	</span>
</nav>

	<div class="row">
		<div class="col-2">
			<div class="list-group list-group-flush  w-100">
			<a class=" list-group-item list-group-item-action text-white list-group-item-primary bg-info p-3">
			 <h1>Môn Học</h1></a>
				<%
					monhocbo mbo = new monhocbo();
					ArrayList<monhocbean> dsmonhoc = mbo.getmon();
					for (monhocbean m : dsmonhoc) {
					%>
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="htSV.jsp?ml=<%=m.getMamon()%>"><%=m.getTenmon()%></a>
					<%
					}
					%>
			</div>
		</div>

		<div class="col-10 ">
			<form id="searchInput" action="htSV.jsp" method="post">
				<div class="row pt-3 pr-3">
					<div class="col-sm-12">
						<div class="input-group">
							<input type="text" name="txttk" class="form-control"
								placeholder="Nhập tên sinh viên" autofocus=""> <span
								class="input-group-btn">
								<button type="submit" id="search-btn"
									class="btn btn-flat btn-info" name="butt">
									<i class="fa fa-search"></i>
								</button> 
							</span>
						</div>
					</div>
				</div>
			</form>

			<div class="row p-3 ">
				<%
					sinhvienbo sbo = new sinhvienbo();
					ArrayList<sinhvienbean> dssv = sbo.getsinhvien();
					String ml = request.getParameter("ml");
					String key = request.getParameter("txttk");
					if (ml != null)
						dssv = sbo.TimMa(ml);
					else if (key != null)
						dssv = sbo.Tim(key);

					int n = dssv.size();
					for (int i = 0; i < n; i++) {
						sinhvienbean s = dssv.get(i);
					%> 
				<div class="col-6 ">
					<div class="box box-primary border border-info ">
						<div class="row">
							<div class="col-4">
								<img class="img-thumbnail w-100" src="<%=s.getAnh() %>">
							</div>
							<div class="col-8">
								<ul class="list-group list-group-flush">
									<li class="list-group-item">
										<lable>Mã Sinh Viên: </lable><span><%=s.getMasinhvien() %></span>
									</li>
									<li class="list-group-item">
										<lable>Họ và Tên: </lable><span><%=s.getHoten() %></span>
									</li>
									<li class="list-group-item">
										<lable>Địa Chỉ: </lable><span><%=s.getDiachi() %></span>
									</li>
									<li class="list-group-item">
										<lable>Email: </lable><span><%=s.getEmail() %></span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<%} %>
			</div>
		</div>
	</div>

</body>
</html>