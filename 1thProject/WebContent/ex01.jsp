<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pass = "hr";
	String sql = "SELECT * FROM member";
	
	Class.forName(driver);
	//String 문자열로 받은 클래스 이름을 가지고 classPath를 뒤져서 classLoader로 부터
	//Class를 넘겨받아 return하는것이다.
	Connection conn = DriverManager.getConnection(url,user,pass);
	Statement pstmt = conn.createStatement();
	ResultSet rs = pstmt.executeQuery(sql);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연동 테스트</title>
</head>
<body>
	<%while(rs.next()){ %>
	<table>
	<tr>
		
		<td><%= rs.getString("L_id") %></td>
		<td><%= rs.getString("L_passwd") %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
		<td><%= rs.getString(6) %></td>
		<td><%= rs.getString(7) %></td>
		<td><%= rs.getString(8) %></td>
		<td><%= rs.getString(9) %></td>
		
	
	</tr>
	<% } %>
	
	
	</table>

</body>
</html>