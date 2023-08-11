<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bList</title>
</head>
<body>

	<div align="center">
		<h3>커뮤니티 게시글 리스트</h3>
		<table border="1">
			<tr align="center">
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			
			<c:forEach var="boardDTO" items="${boardList }" varStatus="i">
				<tr align="center">
					<td>${i.count }</td>
					<td><a href="bDetail?boardId=${boardDTO.boardId }">${boardDTO.subject }</a></td>
					<td>${boardDTO.writer }</td>
					<td>${boardDTO.enrollDt }</td>
					<td>${boardDTO.readCnt }</td>
				</tr>
			</c:forEach>
			
			<tr align="right">
				<td colspan="5">
					<input type="button" style="float: right" value="글쓰기" onclick="location.href='bWrite'">
				</td>
			</tr>
		</table>
	</div>
	
</html>