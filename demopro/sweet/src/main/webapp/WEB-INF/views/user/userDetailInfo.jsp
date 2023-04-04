<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userDetailInfo.jsp</title>
<!-- 스타일 추가 -->
<link rel="stylesheet" href="${contextPath}/resources/css/userDetail.css">
<!-- 다음 우편번호 API -->
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 <script>
 function execDaumPostcode() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	    	
	      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	      var extraRoadAddr = ''; // 도로명 조합형 주소 변수
			
	      
	      
	      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	        extraRoadAddr += data.bname;
	      }
	      // 건물명이 있고, 공동주택일 경우 추가한다.
	      if(data.buildingName !== '' && data.apartment === 'Y'){
	        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	      }
	      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	      if(extraRoadAddr !== ''){
	        extraRoadAddr = ' (' + extraRoadAddr + ')';
	      }
	      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	      if(fullRoadAddr !== ''){
	        fullRoadAddr += extraRoadAddr;
	      }

	      // 우편번호와 주소 정보를 해당 필드에 넣는다.
	      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	      document.getElementById('roadAddress').value = fullRoadAddr;
	      document.getElementById('jibunAddress').value = data.jibunAddress;

	      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	      if(data.autoRoadAddress) {
	        //예상되는 도로명 주소에 조합형 주소를 추가한다.
	        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

	      } else if(data.autoJibunAddress) {
	          var expJibunAddr = data.autoJibunAddress;
	          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	      } else {
	          document.getElementById('guide').innerHTML = '';
	      }
	      
	    }
	  }).open();
	  
	}
 </script>
 
 <!-- 이메일 자동 -->
 <script>
 function emailCheck(val){
		var obj = document.getElementById("email2");
		if(val == "email") {	// 직접입력 선택한 경우인지 확인하는
			obj.value = "";
			obj.readOnly = false;
			obj.focus();
		} else {
			obj.value = val;
			obj.readOnly = true;
		}
	}
 </script>
</head>
<body>
<h1>회원정보수정</h1>
<!-- <h3>기본정보</h3>
<hr class="hr1"> -->
<br>
<section id="container">
			<form action="${contextPath}/user/updateUser.do" method="post">
				<div class="form-group has-feedback">
					<h5><label class="control-label" for="member_id">아이디</label></h5>
					<div class="form-block">
					<input class="form-control" type="text" id="member_id" name="member_id" value="${member.member_id}" readonly="readonly"/>
					</div>
				</div>
				<hr class="hr2">
				<div class="form-group has-feedback">
					<h5><label class="control-label" for="member_pw">패스워드</label></h5>
					<div class="form-block">
					<input class="form-control" type="password" id="member_pw" name="member_pw" value="${member.member_pw}"/>
					</div>
				</div>
				<hr class="hr2">
				<div class="form-group has-feedback">
					<h5><label class="control-label" for="name">성명</label></h5>
					<div class="form-block">
					<input class="form-control" type="text" id="name" name="name" value="${member.name}"/>
					</div>
				</div>
				<hr class="hr2">
				<div class="form-group has-feedback">
					<h5><label class="control-label" for="name">이메일</label></h5>
					
					<div class="form-block">
					<input class="form-control" type="text" id="email1" name="email1" value="${member.email1}" style="margin-right:0px;"/>
					@
					<input class="form-control" type="text" id="email2" name="email2" value="${member.email2}"/>
					
					<!-- 이메일 자동선택 추가 -->
					
					<!-- 자동 선택 -->

					 <select  id="email3" onChange="emailCheck(this.options[this.selectedIndex].value)" title="사용하실 이메일 뒷 주소" >
						<option value="email_choice">선택해주세요</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="naver.com">naver.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="google.com">google.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>	
					</div>
				</div>
				<hr class="hr2">
				<div class="form-group has-feedback">
					<h5 style="line-height:10em;"><label class="control-label" for="name">주소</label></h5>
					<div class="form-block">
					<input class="form-control" type="text" id="zipcode" name="addr1" value="${member.addr1}"/>
					<a href="javascript:execDaumPostcode()" class="d-button">우편번호</a>

					<input class="form-control" type="text" id="roadAddress" name="addr2" value="${member.addr2}" style="margin-top:10px; width:500px;"/>기본주소
					<br>
					<input class="form-control" type="text" id="addr3" name="addr3" value="${member.addr3}" style="margin-top:10px; width:500px;"/>상세주소
					<br>
					</div> 
				</div>
				<hr class="hr2">
				<div class="form-group has-feedback">
					<h5><label class="control-label" for="name">일반전화</label></h5>
					<!-- 
					<input class="form-control" type="text" id="tel1" name="tel1" value="${member.tel1}"/> -->
					<!-- 전화번호 선택지 -->
					<div class="form-block">
					  <select name="tel1" id="tel1" value="${member.tel1}">
					      <option>02</option>
					      <option>042</option>
					    </select>    
					    
					<input class="form-control2" type="text" id="tel2" name="tel2" value="${member.tel2}"/>
					<input class="form-control2" type="text" id="tel3" name="tel3" value="${member.tel3}"/>
					</div>
				</div>
				<hr class="hr2">
				<div class="form-group has-feedback">
					<h5><label class="control-label" for="name">휴대전화</label></h5>
					<!--  
					<input class="form-control" type="text" id="hp1" name="hp1" value="${member.hp1}"/> -->
					<!-- 휴대폰번호 앞 자리 선택지 -->
					<div class="form-block">
					 <select name="hp1" id="hp1" value="${member.hp1}">
					      <option>010</option>
					      <option>011</option>
					      <option>016</option>
					    </select>    
					<input class="form-control2" type="text" id="hp2" name="hp2" value="${member.hp2}"/>
					<input class="form-control2" type="text" id="hp3" name="hp3" value="${member.hp3}"/>
					</div>
				 </div>	
				<hr class="hr2">
				<div class="form-group has-feedback">
					<div class="little-button">
					<button class="btn btn-success" type="submit" id="submit">수정완료</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
					</div>
				</div>
			</form>
		</section>
 </body>
</html>
