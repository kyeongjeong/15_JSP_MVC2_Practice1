<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mLogin</title>
</head>
<body>

	<div align="center">
		<form action="loginMember" method="post">
			<h3>로그인</h3>
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="memberId" autofocus required></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="passwd" required></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="로그인"></td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>