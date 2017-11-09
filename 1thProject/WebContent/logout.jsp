<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 병원 24시</title>
</head>
<body>
	<%
		session.invalidate();
		response.sendRedirect("loginForm.jsp");
	%>

</body>
</html>