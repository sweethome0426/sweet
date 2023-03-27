<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호</title>
</head>
<body>
	<form action="${contextPath}/sweet/find/pwNewB" method="POST" class="content">
	<div class="textbox">
		<input id="bp_pw" name="bp_pw" type="password"><label>새비밀번호</label>
		<div class="error">
 				Invalid password
		</div> 
	</div>
	<div class="textbox">
		<input id="bp_pw2" type="password" onchange="isSame();"><label>새비밀번호 확인</label>
		<div class="error">
				Invalid password
		</div>
	</div>
	<span id=same></span>
	<br><br>
	<input type="submit" id="check" value="비밀번호변경">
	<input type="hidden" name="email" value="${email }">
</form>
</body>
</html>