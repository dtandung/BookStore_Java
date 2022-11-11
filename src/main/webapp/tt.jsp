<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%	
		String masv = request.getParameter("masv");		
		if(masv.equals("sv1"))
			out.print("Thong tin sinh vien: Duong Tan Dung");
		else if(masv.equals("sv2"))
			out.print("Thong tin sinh vien: Truong Phu Quoc");	
	%>
</body>
</html>