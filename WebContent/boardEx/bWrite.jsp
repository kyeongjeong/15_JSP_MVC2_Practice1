<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bWrite</title>
	<!-- WebContent 하위 경로부터 작성한다. -->
	<script src="ckeditor/ckeditor.js"></script>
</head>
<body>

	<div align="center">
		<h3>커뮤니티 게시글 작성</h3>
		<form action="bWrite" method="post" >
			<table border="1">
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" size="70"/></td>
				</tr>
				<tr >
					<td>제목</td>
					<td><input type="text" name="subject" size="70"/></td>
				</tr>
				<tr>
					<td >이메일</td>
					<td><input type="text" name="email" size="70"/></td>
				</tr>
				<tr>
					<td> 비밀번호</td>
					<td><input type="password" name="password" size="70"/></td>
				</tr>
				<tr>
					<td align="center">글내용</td>
					<td>
						<textarea rows="10" cols="50" name="content" ></textarea>
						<script>CKEDITOR.replace("content");</script>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="글쓰기" />
						<input type="button" onclick="location.href='bList'" value="목록보기">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>