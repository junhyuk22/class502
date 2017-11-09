<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 병원 24시</title>
<script>
function test(){
	alert("아이디/비번 잘못 입력하셨습니다.");
}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("L_id");
		String passwd = request.getParameter("L_passwd");

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "hr";
		String db_pass = "hr";

		String sql = "SELECT * FROM member WHERE L_id = ?";

		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, db_id, db_pass);
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, id);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next())	
			{
				if (passwd.equals(rs.getString("L_passwd")))
					{
						%>
						<script>alert("환영합니다. <%=id%>님 ");
						</script>
						
						<%
						String nick = rs.getString("L_nick");
						String reg_date = rs.getString("L_regdate");
						session.setAttribute("sessionId",id);
						session.setAttribute("s_nick",nick);
						session.setAttribute("s_reg_date",reg_date);
						response.sendRedirect("Main.jsp");
					} 
					else 
					{
						%><script>alert("비번이 틀렸습니다.");
									history.go(-1);
						</script><%
						
					}
			}
		else{
			%> <script>alert("ID가 틀렸습니다.");
									history.go(-1);
						</script><% 
			
		}
		 
		
		
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	%>
</body>
</html>