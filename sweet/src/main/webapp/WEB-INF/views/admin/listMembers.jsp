<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    


<html>
<head>
<meta charset="UTF-8">
<style>
 hr {
 	border: 1px black solid;
 	width: 1300px;
 }
 
table {
	width: 1300px;
	font-size: 14px;
	border-spacing: 2 3px;
}
	
table td{
	background-color: #E6F6E8;
	border: 1px solid black;
	width: 100px;
	height: 30px;
	margin: 10px;
}

.a1 {
	margin-bottom: 2px;
}


.t1 {
	background-color: #91E89E;
}

</style>
<title>회원 정보 출력창</title>

</head>
<body>

	<h2>회원목록</h2><hr><br>
	
	
<table border="1"  align="center">
    <tr align="center"   bgcolor="#A7ECB1">
      <td class="t1"><b>회원번호</b></td>
      <td class="t1"><b>아이디</b></td>
      <td class="t1"><b>비밀번호</b></td>
      <td class="t1"><b>이름</b></td>
      <td class="t1"><b>이메일1</b></td>
      <td class="t1"><b>이메일2</b></td>
      <td class="t1"><b>주소</b></td>
      <td class="t1"><b>지역번호</b></td>      
      <td class="t1"><b>핸드폰번호</b></td>         
      <td class="t1"><b>생년월일</b></td>
      <td class="t1"><b>가입일</b></td>
      <td class="t1"><b>활동상태</b></td>
      <td class="t1"><b>설정</b></td>
      
   </tr>
   
   
   
   
   
   
 <c:forEach var="member" items="${membersList}" >     
   <tr align="center">
      <td>${member.member_join}</td>
      <td>${member.member_id}</td>
      <td>${member.member_pw}</td>
      <td>${member.name}</td>
      <td>${member.email1}</td>
      <td>${member.email2}</td>
      <td>${member.addr1}${member.addr2}${member.addr3}</td>
      <td>${member.tel1}-${member.tel2}-${member.tel3}</td>
      <td>${member.hp1}-${member.hp2}-${member.hp3}</td>
      <td>${member.member_birth}</td>
      <td>${member.join_date}</td>
      <td>활동중</td>  
      <td><a class="a1" style="border:2px solid #6981ED; text-decoration: none; color: black; background-color: #B6B7F8;" href="${contextPath }/admin/modMember.do?id=${member.member_id}">수정
	  </a><br>
	  <a style="border:2px solid #6981ED; text-decoration: none; color: black; background-color: #F8AAAF;" href="${contextPath}/admin/removeMember.do?id=${member.member_id }">정지</a>
	  <br>
      </td>
      
    </tr>
  </c:forEach>   
</table>
<%-- <a  href="${contextPath}/member/memberForm.do"><h1 style="text-align:center">회원가입</h1></a> --%>

	<!-- 페이지 번호 작성칸  -->
	<br><br><br><br><br><hr>

	
	
	

</body>
</html>
