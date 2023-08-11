<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mRegister</title>
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
	
	
	var isValidId = false;
	var isValidConfirmPasswd = false;
	
	function checkFormData() {
		
		var birthDt = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
		$("[name='birthDt']").val(birthDt);
		
		if (!isValidConfirmPasswd) {
			alert("패스워드를 확인하세요.");
			$("#confirmPasswd").focus();
			return false;
		}
		
		if (!isValidId) {
			alert("아이디 중복체크를 확인하세요.");
			$("#memberId").focus();
			return false;
		}
		
	}	
	
	$().ready(function(){
		
		$("#confirmPasswd").blur(function(){
			
			if ($("#passwd").val() == $("#confirmPasswd").val()){
				$("#msg").html("<span style='color:green;'>패스워드 일치</span>");
				isValidConfirmPasswd = true;
			}
			else {
				$("#msg").html("<span style='color:red;'>패스워드 불일치</span>");
				isValidConfirmPasswd = false;
			}
			
			
		});
		
		$("#btnOverlapped").click(function(){
			
			$.ajax({
				
				url : "checkDuplicateId",
				type : "get",
				data : {"memberId" : $("#memberId").val()},
				success : function(result) {
					
					if (result == "isDuple") {
						$("#overlappedIdMsg").html("<span style='color:red;'>사용할 수 없는 아이디 입니다.</span>")
						isValidId = false;
					}
					else {
						$("#overlappedIdMsg").html("<span style='color:green;'>사용할 수 있는 아이디 입니다.</span>")
						isValidId = true;
					}
					
				}
				
			});
			
		});
		
		
	});

</script>
</head>
<body>

	<div align="center">
		<form action="registerMember" method="post" enctype="multipart/form-data" onsubmit="return checkFormData();">
			<h3>회원 가입</h3>
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력하세요." required>
						<input type="button" id="btnOverlapped" value="중복확인" ><br>
						<span id="overlappedIdMsg"></span>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요." required></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="confirmPasswd" placeholder="비밀번호를 확인하세요."><span id="msg"></span></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="memberNm" placeholder="이름을 입력하세요." required></td>
				</tr>
				<tr>
					<td>프로필이미지</td>
					<td><input type="file" name="imgNm" required></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						남 &nbsp;<input type="radio" name="sex" value="m" checked> &emsp;
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
						<input type="text" name="hp" placeholder="-를 포함해서 입력하세요." required><br>
						SMS 소식을 수신합니다. <input type="checkbox" id="smsRecvAgreeYn" name="smsRecvAgreeYn" value="Y" checked>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="email" placeholder="이메일을 입력하세요."><br>
						E-mail을 수신합니다.  <input type="checkbox" id="emailRecvAgreeYn" name="emailRecvAgreeYn" value="Y" checked>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						우편번호 : <input type="text" id="zipcode" name="zipcode" required>
						<input type="button" value="검색" onclick="execDaumPostcode();"> <br><br>
						도로명 주소 : <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소를 입력하세요."><br>
						지번 주소 : <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소를 입력하세요."><br>
						나머지 주소 : <input type="text" id="namujiAddress" name="namujiAddress" placeholder="나머지주소를 입력하세요.">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="가입하기">
					</td>
				</tr>
			</table>
		</form>		
	</div>
	
</body>
</html>