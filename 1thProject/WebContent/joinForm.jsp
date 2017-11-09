<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫병원 24시</title>
<script>
	function sessionTest(){
		if(confirm("이전 접속이 종료되지 않았습니다. 같은 ID로 재접속 하시겠습니까? ")){
			response.sendRedirect("Main.jsp");
		}
		else{
			response.sendRedirect("logout.jsp");
		}
	}

</script>

</head>
<body>
	<%if(session.getAttribute("sessionId")!= null){ %>
	<script>sessionTest();</script>
	<% }
	else{
		 %>
			<form action = "joinUs.jsp" method="post">
			<table border="1">
				<tr><th colspan="2"> 회 원 가 입 </th>
				</tr>
				<tr>
					<td width="200" align ="center">아이디</td>
					<td width="200" align ="center"><input type="text" name="L_id"/></td>
				</tr>
				<tr>
					<td width="200" align ="center">비밀번호</td>
					<td width="200" align ="center"><input type="text" name="L_passwd"/></td>
				</tr>
			
				<tr>
					<td width="200" align ="center">이메일</td>
					<td width="200" align ="center"><input type="text" name="L_email"/></td>
				</tr>
				<tr>
					<td width="200" align ="center">닉네임</td>
					<td width="200" align ="center"><input type="text" name="L_nick"/></td>
				</tr>
				<tr>
					<td width="200" align ="center">이름</td>
					<td width="200" align ="center"><input type="text" name="L_name"/></td>
				</tr>
				<tr>
					<td width="200" align ="center">생년월일</td>
					<td width="200" align ="center"><input type="text" name="L_birth"/></td>
				</tr>
				<tr>
					<td width="200" align ="center">핸드폰번호</td>
					<td width="200" align ="center"><input type="text" name="L_phone"/></td>
				</tr>
				<tr>
					<td width="200" align ="center">주 소</td>
					<td width="200" align ="center"><input type="text" name="L_address"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="가입완료"/></td>
				</tr>
			<%} %>			
			</table>
			</form>

</body>
</html>