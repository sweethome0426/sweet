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
<title>modMember.jsp</title>
<style type="text/css">
	.cls1{
		font-size:40px;
		text-align:center;
	}
	.cls2{
		text-align:center;
	}
	table tr td:nth-child(odd){
		width:200;
	}
	table tr td:nth-child(even){
		width:400;
	}
	table tr td p{
		text-align:right;
	}
	.text_center{
		text-align:center;
		width: 1180px;
	}
	
	
	
	table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  margin: 20px 10px;
}
table.type11 th {
  width: 155px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: black;
  background: #F7D5AD ;
}
table.type11 td {
  width: 155px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
}
	

.d1 {
	justify-content: center;
	display: flex;
	align-items: center;
}
.submit:hover {
	color:white;
}

.i1 {
	cursor: pointer;
}
	
</style>
 
<script type="text/javascript">
function fn_sub(obj){
	document.getElementById("i_id").disabled=false;
	obj.submit();
}
</script>

</head>
<body>


<form name="frm" method="post" action="${contextPath }/admin/updateMember.do">

<h1 class="text_center">회원 정보 수정</h1><br>

<div>
	<h2 style="color: #495295;">&nbsp;<b>${member.name } 님의 회원정보 수정</b></h2>
</div>
	
<table class="type11">
	
	<c:if test="${member != null }">
	
  <thead>
	  <tr>
	    <th scope="cols">회원번호</th>
	    <th scope="cols">회원아이디</th>
	    <th scope="cols">비밀번호</th>
	    <th scope="cols">이름</th>
	    <th scope="cols">생년월일</th>
	    <th scope="cols">이메일1</th>
	    <th scope="cols">휴대전화</th>
	   
	   </tr>
   
	    <tr>
	    <td><input type="text" name="id" value="${member.member_join }" readonly></td>
	    <td><input type="text" name="id" id="i_id" value="${member.member_id }" readonly></td>
	    <td><input type="text" name="name" value="${member.member_pw }"></td>
	    <td><input type="text" name="name" value="${member.name }"></td>
	    <td><input type="text" name="name" value="${member.member_birth }"></td>
	    <td><input type="text" name="name" value="${member.email1 }@${member.email2 }"></td>
	    <td><input type="text" name="name" value="${member.hp1 }-${member.hp2 }-${member.hp3 }"></td>
	    
	  </tr>
	  
	   <tr>
	    <th scope="cols">전화번호1</th>
	    <th scope="cols">회원상태</th>
	    <th scope="cols">거래금액</th>
	    <th scope="cols">우편주소</th>
	    <th scope="cols">주소</th>
	    <th scope="cols">상세주소</th>
	    <th scope="cols">가입일자</th>
	  </tr>
  
	  <tr>
	   
	    <td><input type="text" name="name" value="${member.tel1 }-${member.tel2 }-${member.tel3 }"></td>
	    
	    <td><input type="text" name="name" value="${member.status }"></td>
	    <td><input type="text" name="name" value="0원"></td>
	    <td><input type="text" name="name" value="${member.addr1 }"></td>
	    <td><input type="text" name="name" value="${member.addr2 }"></td>
	    <td><input type="text" name="name" value="${member.addr3 }"></td>
	    <td><input type="text" name="name" value="${member.join_date }"></td>
	  
	  </tr>
  
  </thead>

	</c:if>
	
</table>

 <div class="d1">
	<input class="i1" style="border: 3px solid #F37171; font-size: 15px;"
	 type="button" onClick="fn_sub(this.form)" value="수정하기">&nbsp;&nbsp;
	<input class="i1" style="border: 3px solid #F37171; font-size: 15px;" type="reset">
	
	
 </div>

	
</form>
</body>
</html>