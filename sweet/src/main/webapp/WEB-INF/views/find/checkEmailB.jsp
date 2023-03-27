<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${contextPath }/sweet/find/pwNewB" method="post">
		<input type="hidden" name ="num" value="${num }">
		<input type="text" name="email_injeung" placeholder="인증번호를 입력하세요"><label>인증번호 </label>
		<br><br>
		<input type="submit" id="check" value="확인">
	</form>
</body>
</html>