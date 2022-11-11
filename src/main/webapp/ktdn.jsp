<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String un  = request.getParameter("txtun"); 
	String pass  = request.getParameter("txtpass"); 
	if(un.equals("tandung") && pass.equals("123")){
		session.setAttribute("dn", un);
		response.sendRedirect("htsach.jsp");
	}
	else	
		response.sendRedirect("Frmdangnhap.jsp?kt=1");
%>
</body>
</html>



