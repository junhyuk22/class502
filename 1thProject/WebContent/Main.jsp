<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String s_id = (String) session.getAttribute("sessionId");
	String s_nick = (String) session.getAttribute("s_nick");
	String s_reg_date = (String) session.getAttribute("s_reg_date");
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>펫 병원 24시</title>
<script>
	function loginCheck(flag){
		if(flag==1){
			document.loginC.action="logincheck.jsp";
		}
		else if(flag==2)
		{
			document.loginC.action="logout.jsp";
		}
		document.loginC.submit();
		
	}

</script>

</head>
<body>
	<h1>Main 페이지 입니다.</h1>
	<%
		if (s_id == null) {
	%>
	<script>
			alert("로그인을 해주세요.");
			
		</script>
	<%
		Thread.sleep(2000);
			response.sendRedirect("loginForm.jsp");
		} else {
	%><h2>
		환영 합니다
		<%=s_id%>님
	</h2>
	<form name="loginC" method="post">

		<table border="1">
			<tr>
				<th colspan="2">회 원 정 보</th>
				<%
					if (session.getAttribute("sessionId") == null) {
							response.sendRedirect("loginForm.jsp");
						}
				%>
				<script> console.log("<%=session.getAttribute("sessionId")%>"); </script>
				<%
					if (session.getAttribute("sessionId") != null) {
				%>
				<td rowspan="2" align="center"><input type="button"
					value="로그아웃" onClick="loginCheck(2)" /></td>
				<%
					}
				%>
			</tr>
			<tr>
				<td width="200" align="center">아이디</td>
				<td width="200" align="center"><%=s_id%></td>

			</tr>
			<tr>
				<td width="200" align="center">닉네임</td>
				<td width="200" align="center"><%=s_nick %></td>
			</tr>
			<tr>
				<td width="200" align="center">가입일</td>
				<td width="200" align="center"><%=s_reg_date %></td>
			</tr>
			
		</table>
	</form>




	<%
		}
	%>
</body>
</html>