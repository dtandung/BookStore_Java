<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<a href="vdRequest.jsp?masv=sv1"> Dương Tấn Dũng</a> <hr>
				<a href="vdRequest.jsp?masv=sv2"> Trương Phú Quốc</a> <hr>
			</td>
			<td>
				<%
				String masv = request.getParameter("masv");		
				if(masv==null)
						out.print("Ban chay dau tien");
				else if(masv.equals("sv1"))
						out.print("Thông tin sinh viên: Dương Tấn Dũng");
				else if(masv.equals("sv2"))
						out.print("Thông tin sinh viên: Trương Phú Quốc");	
				%>
			</td>
		</tr>
	</table>
</body>
</html>