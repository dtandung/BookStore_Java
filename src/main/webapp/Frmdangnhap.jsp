<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<body class="bg-info" style="background: url(bot.jpg);
							background-position: center;
							background-size: cover;">
	<div class="container align-center mt-5">
		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-4">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">

							<div class="col-lg-12">
								<div class="p-3">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>
									<form class="user" action="ktdn/login" method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												name="un" placeholder="Username">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												name="pass" placeholder="Password">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">Remember
													Me</label>
											</div>
										</div>
										<button type="submit" 
											class="btn btn-danger btn-user btn-block">Login</button>
									<%-- 	<%
										if (request.getParameter("kt") != null) {
											out.print("Đăng Nhập Sai");
										}
										%> --%>
										<c:if test="${kt != null }">
											<c:out value=""></c:out>
										</c:if>
								
									</form>

									<div class="text-center ">
										<a class="small text-danger" href="forgot-password.html">Forgot
											Password?</a>
									</div>
									<div class="text-center ">
										<a class="small text-danger" href="FrmDangKy.jsp">Create an Account!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
</body>
</html>



