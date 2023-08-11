<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mUpdate</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="jquery/jquery-3.6.1.min.js"></script>
<script>
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	
	            var fullRoadAddr = data.roadAddress; 
	            var extraRoadAddr = ''; 
	
	            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            if (data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            if (extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            if (fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('roadAddress').value = fullRoadAddr;
	            document.getElementById('jibunAddress').value = data.jibunAddress;
	          
	        }
	    }).open();
	}
</script>
<script>

	$().ready(function(){
		
		$("[name='sex']").each(function(){
			
			if ($(this).val() == "${memberDTO.sex}") {
				$(this).prop("checked" , true);
			}
			
		});		
		
		var birthDt = "${memberDTO.birthDt}".split("-");
		var year = birthDt[0];
		var month = birthDt[1];
		var day = birthDt[2];
		
		$("#birthY").val(year);
		$("#birthM").val(month);
		$("#birthD").val(day);
		
		
		if ("${memberDTO.smsRecvAgreeYn}" == "Y") {
			$("#smsRecvAgreeYn").prop("checked" , true);
		}
		
		if ("${memberDTO.emailRecvAgreeYn}" == "Y") {
			$("#emailRecvAgreeYn").prop("checked" , true);
		}
		
		
		
		$("form").submit(function(){
			var birthDt = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
			$("[name='birthDt']").val(birthDt);
		});
		
	});
	
</script>
</head>
<body>
	
	<div align="center">
		<form action="updateMember" method="post" enctype="multipart/form-data" >
			<h3>내 정보 수정하기</h3>
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" value="${memberDTO.memberId }" disabled>
						<input type="hidden" id="memberId" name="memberId" value="${memberDTO.memberId }" readonly>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="memberNm" value="${memberDTO.memberNm }"></td>
				</tr>
				<tr>
					<td>프로필이미지</td>
					<td>
						<img src="step02_memberEx/memberImg/${memberDTO.imgNm }" width="50" height="50"><br>
						<input type="file" name="imgNm" >
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						남 &nbsp;<input type="radio" name="sex" value="m"> &emsp;
						여 &nbsp;<input type="radio" name="sex" value="f">
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						 <select id="birthY">
				        	<c:forEach var="i" begin="0" end="2023" >
				        		<option>${2023 - i}</option>
				        	</c:forEach>
				        </select>년 
			          	<select id="birthM">
				          	<c:forEach var="i" begin="1" end="12" >
				          		<c:choose>
				           		<c:when test="${i < 10 }">
				            		<option>0${i}</option>
				           		</c:when>
				           		<c:otherwise>
				            		<option>${i}</option>
				           		</c:otherwise>
				          		</c:choose>
				          	</c:forEach>
				         </select>월
				         <select id="birthD">
				          	<c:forEach var="i" begin="1" end="31" >
				          		<c:choose>
				           		<c:when test="${i < 10 }">
				            		<option>0${i}</option>
				           		</c:when>
				           		<c:otherwise>
				            		<option>${i}</option>
				           		</c:otherwise>
				          		</c:choose>
				          	</c:forEach>
				         </select>일
				         <input type="hidden" name="birthDt"/>
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="text" name="hp" value="${memberDTO.hp }"><br>
						SMS 소식을 수신합니다. <input type="checkbox" id="smsRecvAgreeYn" name="smsRecvAgreeYn" value="Y" >
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="email" value="${memberDTO.email }"><br>
						E-mail을 수신합니다.  <input type="checkbox" id="emailRecvAgreeYn" name="emailRecvAgreeYn" value="Y" >
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						우편번호 : <input type="text" id="zipcode" name="zipcode" value="${memberDTO.zipcode }">
						<input type="button" value="검색" onclick="execDaumPostcode();"> <br><br>
						도로명 주소 : <input type="text" id="roadAddress" name="roadAddress" value="${memberDTO.roadAddress }"><br>
						지번 주소 : <input type="text" id="jibunAddress" name="jibunAddress" value="${memberDTO.jibunAddress }"><br>
						나머지 주소 : <input type="text" id="namujiAddress" name="namujiAddress" value="${memberDTO.namujiAddress }">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<button type="submit">수정하기</button>
					</td>
				</tr>
			</table>
		</form>		
	</div>
	
</body>
</html>