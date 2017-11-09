<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫병원 24시</title>
<script>
	function loginCheck(flag){
		if(flag==1){
			document.loginC.action="logincheck.jsp";
		}
		else if(flag==2)
		{
			document.loginC.action="logout.jsp";
		}
		else if(flag==3){
			document.loginC.action="joinForm.jsp";
		}
		document.loginC.submit();
		
	}
	function sessionTest(){
		if(confirm("이전 접속이 종료되지 않았습니다. 같은 ID로 재접속 하시겠습니까? ")){
			response.sendRedirect("Main.jsp");
		}
		else{
			session.invalidate();
			
			/* response.sendRedirect("logout.jsp"); */
			
		}
	}

</script>

</head>
<body>
	<%if(session.getAttribute("sessionId")!= null){ %>
	<script>sessionTest();</script>
	<%}
	else{
		 %>
			<form name="loginC" method="post">
			<input type="hidden" name="L_ip" value="<%= request.getRemoteAddr() %>"/>
			<table border="1">
				<tr><th colspan="2"> 회 원 가 입 </th>
					<td rowspan="2" align="center"><input type="button" value = "로그인" onClick="loginCheck(1)"/></td>
					<script> console.log("<%=session.getAttribute("sessionId")%>");</script>
					<%if(session.getAttribute("sessionId")!= null){ %>
					<td rowspan="2" align="center"><input type="button" value = "로그아웃" onClick="loginCheck(2)"/></td>
					<%}} %>
				</tr>
				<tr>
					<td width="200" align ="center"> 아이디</td>
					<td width="200" align ="center"><input type="text" name="L_id"/></td>
					
				</tr>
				<tr>
					<td width="200" align ="center"> 비밀번호</td>
					<td width="200" align ="center"><input type="text" name="L_passwd"/></td>
				</tr>
				<tr>
					<td width="200" align = "center"><input type="button" value="회원가입" onClick="loginCheck(3)"/></td>
				</tr>
			</table>
			</form>

</body>
</html>