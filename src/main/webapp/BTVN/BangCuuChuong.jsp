<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bảng Cửu Chương</title>
</head>
<body>
	<table border="2" width="100%" >
		<tr align="center">
			<td>
				<%for(int i=1; i<=10; i++){ %>
					1x<%=i %>=<%=i*1 %> <hr>
				<%} %>
			</td>
			<td>
				<%for(int i=1; i<=10; i++){ %>
					2x<%=i %>=<%=i*2 %> <hr>
				<%} %>
			</td>
			<td>
				<%for(int i=1; i<=10; i++){ %>
					3x<%=i %>=<%=i*3 %> <hr>
				<%} %>
			</td>
			<td>
				<%for(int i=1; i<=10; i++){ %>
					4x<%=i %>=<%=i*4 %> <hr>
				<%} %>
			</td>
			<td>
				<%for(int i=1; i<=10; i++){ %>
					5x<%=i %>=<%=i*5 %> <hr>
				<%} %>
			</td>
			<td>
				<%for(int i=1; i<=10; i++){ %>
					6x<%=i %>=<%=i*6 %> <hr>
				<%} %>
			</td>
			<td>
				<%for(int i=1; i<=10; i++){ %>
					7x<%=i %>=<%=i*7 %> <hr>
				<%} %>
			</td>
			<td>
				<%for(int i=1; i<=10; i++){ %>
					8x<%=i %>=<%=i*8 %> <hr>
				<%} %>
			</td>
			<td>
				<%for(int i=1; i<=10; i++){ %>
					9x<%=i %>=<%=i*9 %> <hr>
				<%} %>
			</td>
		</tr>
	</table>
	
</body>
</html>