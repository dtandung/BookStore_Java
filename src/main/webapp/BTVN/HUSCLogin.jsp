<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>student.husc.edu.vn/Account/Login</title>
<link href="style.css" rel="stylesheet" >
</head>
<body>
	<div class="husc-login">
		<div class="husc-lay-image text-center">
			<div class="husc-login-logo" >
					<a href="https://ums.husc.edu.vn/">
						<img alt="" src="logo.png" >
					</a>
			</div>
			<div class="husc-login-image">
					<img alt="" src="image1.png">
			</div>
		</div>
		<div class="husc-lay-login" >
				<form action=" " method="post" class="husc-form-login">
					<img alt="" src="logo-small.png">
					<h2 class="form-login-heading">SINH VIÊN</h2>
					<div class="form-group">
						<lable class="form-group__lable">Mã Sinh Viên:</lable>
						<input type="text" id="loginID" name="loginID" class="form-control input-lg"
						placeholder="Mã Sinh Viên" required autofocus value>
					</div>
					<div class="form-group">
						<lable class="form-group__lable">Mật Khẩu</lable>
						<input type="password" id="password" name="password" class="form-control input-lg"
						placeholder="Mật Khẩu" required value>
					</div>
					<div class="form-group">
						<span class="text-danger"></span>
					</div>
					<button class="form-button" type="submit">Đăng Nhập</button>
				</form>
		</div>
	</div>
		<footer>
			<div class="footer-contact">
				<p><a href="http://husc.edu.vn" style="color:#fff" target="_blank">Trường Đại học Khoa học, Đại học Huế</a></p>
                <p><span class="glyphicon glyphicon-home"></span> 77 Nguyễn Huệ, Thành phố Huế, Tỉnh Thừa Thiên Huế, Việt Nam</p>
                <p><span class="glyphicon glyphicon-phone"></span> Điện thoại: (+84) 0234.3823290 – Fax: (+84) 0234.3824901</p>
			</div>
		</footer>
</body>
</html>