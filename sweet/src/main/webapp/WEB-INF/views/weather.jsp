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
  p {
    margin: 10px 0;
  }
  p span {
    font-weight: bold;
  }
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
	// 오늘 날짜 정보 가져오기
    var dateObj = new Date();
    // YYYYMMDD 형식으로 변환
    var baseDate = formatDate(dateObj);

// API 호출 시 인자로 사용할 쿼리스트링 생성하기
var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'TY0vE9oNTY8ubExip3Tkp2Mntx%2FQlK%2B%2BfhGMqJsNFkWa5cKLUW%2FUig%2FlSEZeH5pcubLlZkNq6gB9rFzsnDEOrg%3D%3D';
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000');
queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON');
queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent(baseDate);
queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('0500');
queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55');
queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('127');

//API 호출하기
var xhr = new XMLHttpRequest();
var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst';
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    	alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
        const weatherData = JSON.parse(this.responseText);
        
        let fcstDate = baseDate;
        let maxTemp = ''; // 일 최고기온
        let minTemp = ''; // 일 최저기온
        let pop = '';
        let sky = '';
        
        for (let i = 0; i < weatherData.response.body.items.item.length; i++) {
        	const fcstDate = weatherData.response.body.items.item[i].fcstDate;
        	const fcstTime = weatherData.response.body.items.item[i].fcstTime;
            const fcstValue = weatherData.response.body.items.item[i].fcstValue;
            const category = weatherData.response.body.items.item[i].category;
            
            if (fcstDate === baseDate && (fcstTime === '0600' || fcstTime === '1500')) {
            if (category === 'TMN') {
                minTemp = fcstValue;
            }
            else if (category === 'TMX') {
                    maxTemp = fcstValue;
                } else if (category === 'POP') {
                	pop = fcstValue + '%'; // 강수확률
                } else if (category === 'SKY') {
                    switch (fcstValue) {
                        case '1':
                        	sky = '맑음';
                            break;
                        case '3':
                        	sky = '구름많음';
                            break;
                        case '4':
                        	sky = '흐림';
                            break;
                        default:
                        	sky = '알 수 없음';
                            break;
                    }
                }
            }
        }
        // 결과를 화면에 표시
        document.getElementById("maxTemp").innerHTML = maxTemp;
        document.getElementById("minTemp").innerHTML = minTemp;
        document.getElementById('pop').textContent = pop;
        document.getElementById('sky').textContent = sky;
        document.getElementById("fcstDate").innerHTML = fcstDate;
    }
};
xhr.send('');
}

function formatDate(date) {
	  var year = date.getFullYear();
	  var month = date.getMonth() + 1;
	  var day = date.getDate();

	  // 월과 일이 10보다 작을 경우, 앞에 0을 붙여줌
	  if (month < 10) {
	    month = '0' + month;
	  }
	  if (day < 10) {
	    day = '0' + day;
	  }

	  return year + '' + month + '' + day; // YYYYMMDD 형식으로 반환
	}
</script>   
   
</head>
<body>

    <p>날짜: <span id="fcstDate"></span></p>
    <p>최고기온: <span id="maxTemp"></span></p>
    <p>최저기온: <span id="minTemp"></span></p>
    <p>강수 확률: <span id="pop"></span></p>
    <p>하늘 상태: <span id="sky"></span></p>
    <button type="button" class="btnon btnon1" onclick="getWeather()">검색</button>

</body>
</html>