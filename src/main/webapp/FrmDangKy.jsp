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
<style>
</style>
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
										<h1 class="h4 text-gray-900 mb-4">Register Here!</h1>
									</div>
									<form class="user" action='ktdk' method="POST">
										<div class="bd form-group">
											<input type="text" class="form-control form-control-user"
												name="fullname" placeholder="Fullname">
										</div>
										<div class="bd form-group">
											<input type="text" class="form-control form-control-user"
												name="address" placeholder="Address">
										</div>
										
										<div class="bd form-group">
											<input type="text" class="form-control form-control-user"
												name="phonenumber" placeholder="Phone Number">
										</div>
										
										<div class="bd form-group">
											<input type="text" class="form-control form-control-user"
												name="email" placeholder="Email">
										</div>
										
										<div class="bd form-group">
											<input type="text" class="form-control form-control-user"
												name="username" placeholder="Username">
										</div>
										
										<div class="bd form-group">
											<input type="password" class="form-control form-control-user"
												name="password" placeholder="Password">
										</div>
										
										<div class="bd form-group">
											<input type="password" class="form-control form-control-user"
												name="password_confirm" placeholder="Password Confirm">
										</div>
										<div class="row d-flex justify-content-center  ">
											<button formaction="htsach_Controller" formmethod="post" type="submit" 
											class="btn btn-success btn-user btn-md mr-4">Back</button>
											<button name="but2" type="submit" 
											class="btn btn-danger btn-user btn-md ">Register</button>
										</div>
									</form>
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



