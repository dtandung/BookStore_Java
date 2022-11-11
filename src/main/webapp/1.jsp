<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html {
	font-family: sans-serif;
}

body {
	background-color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.Cal {
	width: 300px;
	height: auto;
	margin: auto;
	border-radius: 10px;
	background-color: #99CCFF;
	padding: 30px;
	display: grid;
	justify-content: center;
	align-items: center;
	position: relative;
}

.Cal-input {
	height: 25px;
	border-radius: 5px;
	border: none;
	padding: 5px;
	width: 180px;
	outline: none;
}
/* .Cal-input:hover{
		background-color:#FFCC99;
	} */
.Cal-btn {
	width: 34px;
	height: 30px;
	border-radius: 10px;
	border: none;
	margin: 0 10px 0 0;
	background-color: white;
}

.Cal-btn:hover {
	background-color: #FFCC99;
}

h1 {
	padding-bottom: 10px;
}

.top {
	margin-bottom: 20px;
}

.middle {
	margin-top: 58px;
}

.bot {
	background-color: white;
	font-weight: 600;
	position: absolute;
	top: 62%;
}
</style>
<body>
	<div class="Cal">
		<h1>Calculator</h1>
		<%
		long a = 0, b = 0, kq = 0;
		if (request.getAttribute("aa") != null) {
			a = (long) request.getAttribute("aa");
			b = (long) request.getAttribute("bb");
			kq = (long) request.getAttribute("kq");
		}
		%>
		<form action="Test" method="post">
			<div class="top">
				<input class="Cal-input" type="number" name="txtnum1"
					placeholder="Enter First Number" value="<%=a%>" /> <br> <br>
				<input class="Cal-input" type="number" name="txtnum2"
					placeholder="Enter Second Number" value="<%=b%>" />
			</div>
			<div class="middle">
				<input class="Cal-btn" type="submit" name="btnsubmitC" value="+" />
				<input class="Cal-btn" type="submit" name="btnsubmitT" value="-" />
				<input class="Cal-btn" type="submit" name="btnsubmitN" value="*" />
				<input class="Cal-btn" type="submit" name="btnsubmitCh" value="/" />
			</div>
			<%-- <%
			double c = 0;
			if (a == null && b == null)
				out.print("");
			else {
			%>
			<%
			if (request.getParameter("btnsubmit").equals("+")) {
				c = Double.parseDouble(a) + Double.parseDouble(b);
			} else if (request.getParameter("btnsubmit").equals("-")) {
				c = Double.parseDouble(a) - Double.parseDouble(b);
			} else if (request.getParameter("btnsubmit").equals("*")) {
				c = Double.parseDouble(a) * Double.parseDouble(b);
			} else if(Double.parseDouble(b) == 0){
				out.print("<script>alert('Bo tay');</script>");
			} else if (request.getParameter("btnsubmit").equals("/")) {
				c = Double.parseDouble(a) / Double.parseDouble(b);
			}
			%>
			<%}%> --%>
			<input class="Cal-input bot" type="text" name="txtnum3"
				placeholder="Result" value="<%=kq%>" disabled />
		</form>

	</div>
</body>
</html>