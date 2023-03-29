<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="utf-8" />
   <title>날씨 정보</title>
   
<style>
.btnon1 {
	width: 100px;
	margin-top: 5px;
	background-color: #ffffff;
	color: #112d4e;
	border: 1px #112d4e solid;
}

.btnon1:hover {
	width: 100px;
	height: 35px;
	margin-top: 5px;
	border: none;
	border-radius: 4px;
	font-size: 13px;
	font-weight: bold;
	background-color: #112d4e;
	color: white;
}
</style>   
   
<script>
function getWeather() {
	const dateInput = document.getElementById("date-input").value;
	const year = date.getFullYear();
	const month = date.getMonth() + 1;
	const day = date.getDate();
	const tmFc = `${year}${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}0000`;

	
// API 호출 시 인자로 사용할 쿼리스트링 생성하기
var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'TY0vE9oNTY8ubExip3Tkp2Mntx%2FQlK%2B%2BfhGMqJsNFkWa5cKLUW%2FUig%2FlSEZeH5pcubLlZkNq6gB9rFzsnDEOrg%3D%3D';
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000');
queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON');
queryParams += '&' + encodeURIComponent('stnId') + '=' + encodeURIComponent('108');
queryParams += '&' + encodeURIComponent('tmFc') + '=' + encodeURIComponent(tmFc);

//API 호출하기
var xhr = new XMLHttpRequest();
var url = 'http://apis.data.go.kr/1360000/MidFcstInfoService/getMidFcst';
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    	alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
        const weatherData = JSON.parse(this.responseText);
        // 결과를 화면에 표시
        document.getElementById('weatherData').textContent = weatherData;
        document.getElementById('tmFc').textContent = tmFc;
    }
};
xhr.send('');
}

</script>   
   
</head>
<body>

	<form>
      <label for="date-input">날짜:</label>
      <input type="date" id="date-input" name="date-input">
      <button type="button" class="btnon btnon1" onclick="getWeather()">검색</button>
    </form>
    
    <h2 id="location-display"></h2>
    <p>날씨: <span id="weatherData"></span></p>
    <p>날짜: <span id="tmFc"></span></p>
    <p>강수 확률: <span id="pop-display"></span></p>
    <p>하늘 상태: <span id="sky-display"></span></p>

</body>
</html>