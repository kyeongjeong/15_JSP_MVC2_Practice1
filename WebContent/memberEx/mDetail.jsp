<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mDetail</title>
</head>
<body>

	<div align="center">
		<h3>${memberDTO.memberNm }님 회원정보조회</h3>
		<p>
			<a href="logoutMember">로그아웃</a>&emsp;
			<a href="updateMember">수정하기</a>&emsp;
			<a href="deleteMember">탈퇴하기</a>
		</p>
		<table border="1">
			<tr>
				<td>프로필 이미지</td>
				<td><img src="step02_memberEx/memberImg/${memberDTO.imgNm}" width="200" height="100"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${memberDTO.memberId }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${memberDTO.memberNm }</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<c:choose>
						<c:when test="${memberDTO.sex == 'm'}">
							남
						</c:when>
						<c:otherwise>
							여
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${memberDTO.birthDt }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${memberDTO.hp } 
					<c:choose>
						<c:when test="${memberDTO.smsRecvAgreeYn == 'Y'}">
							(문자 수신동의)
						</c:when>
						<c:otherwise>
							(문자 수신 비동의)
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${memberDTO.email } 
					<c:choose>
						<c:when test="${memberDTO.emailRecvAgreeYn == 'Y'}">
							(메일 수신동의)
						</c:when>
						<c:otherwise>
							(메일 수신 비동의)
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					${memberDTO.zipcode } <br>
					${memberDTO.roadAddress } <br>
					${memberDTO.jibunAddress } <br>
					${memberDTO.namujiAddress } <br>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>