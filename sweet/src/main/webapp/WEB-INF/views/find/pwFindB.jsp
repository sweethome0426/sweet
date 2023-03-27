<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

</head>
<body>
    <form class="login" action="${contextPath}/sweet/find/sendMailB" method="post">
        <div>
            <input type="text" name="bp_id" placeholder="아이디" required>
        </div>
		<div>
			<input type="text" id="email" name="email" placeholder="이메일">
		</div>
		<input type="hidden" id="email" name="email">
		<div>
            <div></div>
            <input type="submit" value="비밀번호 찾기">
        </div>
    </form>
</body>
</html>
