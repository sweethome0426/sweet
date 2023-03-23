<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<script>
  // 이메일 주소 합치기
  function combineEmail() {
    var email1 = document.getElementById("email1").value;
    var email2 = document.getElementById("email2").value;
    var email = email1 + "@" + email2;
    document.getElementById("email").value = email;
  }
</script>

</head>
<body>
    <form class="login" action="${contextPath}/memberB/sendMail" method="post">
        <div class="field">
            <input type="text" name="name" placeholder="이름" required>
        </div>
		<div class="form-group row">
			<label for="email1" class="col-sm-2 col-form-label">이메일</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="email1" name="email1"
					placeholder="이메일 앞자리">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-10 offset-sm-2">
				<input type="text" class="form-control" id="email2" name="email2"
					placeholder="이메일 뒷자리">
			</div>
		</div>
		<input type="hidden" id="email" name="email">
		<div class="field btn">
            <div class="btn-layer"></div>
            <input type="submit" value="비밀번호 찾기">
        </div>
    </form>
</body>
</html>
