<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,java.util.Date,java.text.SimpleDateFormat,search.first.project.*" %>
<%
	Date date = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	request.setCharacterEncoding("utf-8");

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String db_id = "hr";
	String db_pass = "hr";
	
	String sql = "INSERT INTO member VALUES(member_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
	String L_id = (String)request.getParameter("L_id");
	String L_passwd = (String)request.getParameter("L_passwd");
	String L_email = (String)request.getParameter("L_email");
	String L_nick = (String)request.getParameter("L_nick");
	String L_name = (String)request.getParameter("L_name");
	String L_birth = (String)request.getParameter("L_birth");
	String L_phone = (String)request.getParameter("L_phone");
	String L_address = (String)request.getParameter("L_address");
	String L_ip = request.getRemoteAddr();
	String L_regdate = sf.format(date);
	EmailCheck email = new EmailCheck();
	String L_email_check= email.ranEmail();
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, db_id, db_pass);
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, L_id);
	stmt.setString(2, L_passwd);
	stmt.setString(3, L_email);
	stmt.setString(4, L_nick);
	stmt.setString(5, L_name);
	stmt.setString(6, L_birth);
	stmt.setString(7, L_phone);
	stmt.setString(8, L_address);
	stmt.setString(9, L_ip);
	stmt.setString(10, L_regdate);
	stmt.setString(11, L_email_check);
	stmt.executeUpdate();
	
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();%>
	<Script>
		alert("회원가입이 완료되었습니다.");
	</Script>
	<% 
	response.sendRedirect("loginForm.jsp");
	%>
