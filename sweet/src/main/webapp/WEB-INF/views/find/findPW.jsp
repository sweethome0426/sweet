<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
.mybtn{
  width:150px;
  height:40px;
  padding:0;
  display:inline; 
  border-radius: 4px; 
  background: #212529;
  color: #fff;
  margin-top: 20px;
  border: solid 2px #212529; 
  transition: all 0.5s ease-in-out 0s;
}
.mybtn:hover .mybtn:focus {
  background: white;
  color: #212529;
  text-decoration: none;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>
	<form id="findPWForm" action="/sweet/find/findPW" method="post">
	  <div>
	    <p>
	      <label for="id">아이디</label>
	      <input type="text" id="id" name="bp_id" placeholder="회원가입한 아이디를 입력하세요" required>
	    </p>
	    <p>
	      <label for="email">이메일</label>
	      <input type="text" id="email" name="email" placeholder="회원가입한 이메일주소를 입력하세요" required>
	    </p>
	    <p>
	      <button type="submit" id="findBtn">찾기</button>
	      <button type="button" onclick="history.go(-1);">로그인으로</button>
	    </p>
	  </div>
	</form>
</body>
</html>