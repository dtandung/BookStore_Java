<%@page import="bean.giohangbean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.giohangbo"%>
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
	giohangbo gh = (giohangbo) session.getAttribute("gio");

	if (request.getParameter("btnsl") != null) {
		String msach = request.getParameter("btnsl");
		long sl = Long.parseLong(request.getParameter("t" + msach));
		if(sl == 0){
			gh.Xoa(msach);
		}
		else
			gh.Sua(msach, sl);

	}

	if (request.getParameter("btnxoa") != null) {
		String msach = request.getParameter("btnxoa");
		gh.Xoa(msach);

	}

	if (request.getParameter("btnxoaChon") != null) {
		String[] gtcheck = request.getParameterValues("check");
		if (gtcheck != null) {
			for (String ss : gtcheck)
		gh.Xoa(ss);
		}

	}

	if (request.getParameter("btnxoaAll") != null) {
		gh.xoaTC();
	}
	session.setAttribute("gio", gh);

	if (gh.ds.size() == 0)
		response.sendRedirect("htsach_Controller");
	else
		response.sendRedirect("htgio.jsp");
	%>

	<%-- <% 
   	 Enumeration<String> d= request.getParameterNames();
  	 while(d.hasMoreElements()){
  		 String tendk = d.nextElement();
  		 String gt = request.getParameter(tendk);
     out.println(tendk+":"+gt+"<br>");
  	 }
	
  	String[] gtcheck=request.getParameterValues("check");
    for(String ss: gtcheck)
 	   out.println(ss);

	%> --%>
	<%-- 	<%
		String msach=request.getParameter("masach");
		String sl=request.getParameter("t");
		

			giohangbo gh=(giohangbo) session.getAttribute("gio");
		if(msach != null ) {
			if(request.getParameter("btnsl")!=null)
			{
				gh.Sua(msach, Long.parseLong(sl));
				session.setAttribute("gio", gh);
				response.sendRedirect("htgio.jsp");

			}
			
			if (request.getParameter("btnxoa") != null) {
				gh.Xoa(msach);
				session.setAttribute("gio", gh);
				response.sendRedirect("htgio.jsp");

			}
			
/* 			if(request.getParameter("btnXoaAll")!=null)
			{
				gh.XoaALL();
				session.setAttribute("gio", gh);
				response.sendRedirect("htgio.jsp");
			} */
			
			
		}
  		else
		{
  		/* 	giohangbo gh=(giohangbo)session.getAttribute("gio"); */
  			gh.xoaTC();
  			session.setAttribute("gio", gh);
  			response.sendRedirect("htsach.jsp");
		} 
			
	%> --%>
</body>
</html>