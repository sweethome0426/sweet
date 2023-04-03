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
	// 어제 날짜 정보 가져오기
    var yesterday = new Date();
    yesterday.setDate(yesterday.getDate() - 1);
    // 어제 날짜를 YYYYMMDD 형식으로 변환
    var baseDate = formatDate(yesterday);
    
    // 오늘 날짜 정보 가져오기
    var today = new Date();
    // 오늘 날짜를 YYYYMMDD 형식으로 변환
    var todayDate = formatDate(today);
    
 	// 내일 날짜 정보 가져오기
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    // 내일 날짜를 YYYYMMDD 형식으로 변환
    var tomorrowDate = formatDate(tomorrow);
    
 	// 모레 날짜 정보 가져오기
    var dayAfterTomorrow = new Date();
    dayAfterTomorrow.setDate(dayAfterTomorrow.getDate() + 2);
    // 모레 날짜를 YYYYMMDD 형식으로 변환
    var dayAfterTomorrowDate = formatDate(dayAfterTomorrow);
    
	
    
// API 호출 시 인자로 사용할 쿼리스트링 생성하기
var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'TY0vE9oNTY8ubExip3Tkp2Mntx%2FQlK%2B%2BfhGMqJsNFkWa5cKLUW%2FUig%2FlSEZeH5pcubLlZkNq6gB9rFzsnDEOrg%3D%3D';
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000');
queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON');
queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent(todayDate);
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
        
        let maxTemp1 = ''; // 일 최고기온
        let minTemp1 = ''; // 일 최저기온
        let pop1 = '';
        let sky1 = '';
        let maxTemp2 = ''; // 일 최고기온
        let minTemp2 = ''; // 일 최저기온
        let pop2 = '';
        let sky2 = '';
        let maxTemp3 = ''; // 일 최고기온
        let minTemp3 = ''; // 일 최저기온
        let pop3 = '';
        let sky3 = '';
        
        for (let i = 0; i < weatherData.response.body.items.item.length; i++) {
        	const fcstDate = weatherData.response.body.items.item[i].fcstDate;
        	const fcstTime = weatherData.response.body.items.item[i].fcstTime;
            const fcstValue = weatherData.response.body.items.item[i].fcstValue;
            const category = weatherData.response.body.items.item[i].category;
            
            if (fcstDate === todayDate && (fcstTime === '0600' || fcstTime === '1500')) {
            if (category === 'TMN') {
                minTemp1 = fcstValue;
            }
            else if (category === 'TMX') {
                    maxTemp1 = fcstValue;
                } else if (category === 'POP') {
                	pop1 = fcstValue + '%'; // 강수확률
                } else if (category === 'SKY') {
                    switch (fcstValue) {
                        case '1':
                        	sky1 = '맑음';
                            break;
                        case '3':
                        	sky1 = '구름많음';
                            break;
                        case '4':
                        	sky1 = '흐림';
                            break;
                        default:
                        	sky1 = '알 수 없음';
                            break;
                    }
                }
            }
            else if (fcstDate === tomorrowDate && (fcstTime === '0600' || fcstTime === '1500')) {
                if (category === 'TMN') {
                    minTemp2 = fcstValue;
                }
                else if (category === 'TMX') {
                        maxTemp2 = fcstValue;
                    } else if (category === 'POP') {
                    	pop2 = fcstValue + '%'; // 강수확률
                    } else if (category === 'SKY') {
                        switch (fcstValue) {
                            case '1':
                            	sky2 = '맑음';
                                break;
                            case '3':
                            	sky2 = '구름많음';
                                break;
                            case '4':
                            	sky2 = '흐림';
                                break;
                            default:
                            	sky2 = '알 수 없음';
                                break;
                        }
                    }
                }
            else if (fcstDate === dayAfterTomorrowDate && (fcstTime === '0600' || fcstTime === '1500')) {
                if (category === 'TMN') {
                    minTemp3 = fcstValue;
                }
                else if (category === 'TMX') {
                        maxTemp3 = fcstValue;
                    } else if (category === 'POP') {
                    	pop3 = fcstValue + '%'; // 강수확률
                    } else if (category === 'SKY') {
                        switch (fcstValue) {
                            case '1':
                            	sky3 = '맑음';
                                break;
                            case '3':
                            	sky3 = '구름많음';
                                break;
                            case '4':
                            	sky3 = '흐림';
                                break;
                            default:
                            	sky3 = '알 수 없음';
                                break;
                        }
                    }
                }
        }
        // 결과를 화면에 표시
        document.getElementById("maxTemp1").innerHTML = maxTemp1;
        document.getElementById("minTemp1").innerHTML = minTemp1;
        document.getElementById('pop1').textContent = pop1;
        document.getElementById('sky1').textContent = sky1;
        document.getElementById("todayDate").innerHTML = todayDate;
        document.getElementById("maxTemp2").innerHTML = maxTemp2;
        document.getElementById("minTemp2").innerHTML = minTemp2;
        document.getElementById('pop2').textContent = pop2;
        document.getElementById('sky2').textContent = sky2;
        document.getElementById("tomorrowDate").innerHTML = tomorrowDate;
        document.getElementById("maxTemp3").innerHTML = maxTemp3;
        document.getElementById("minTemp3").innerHTML = minTemp3;
        document.getElementById('pop3').textContent = pop3;
        document.getElementById('sky3').textContent = sky3;
        document.getElementById("dayAfterTomorrowDate").innerHTML = dayAfterTomorrowDate;

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

    <p>날짜: <span id="todayDate"></span></p>
    <p>최고기온: <span id="maxTemp1"></span></p>
    <p>최저기온: <span id="minTemp1"></span></p>
    <p>강수 확률: <span id="pop1"></span></p>
    <p>하늘 상태: <span id="sky1"></span></p>
    
    <p>날짜: <span id="tomorrowDate"></span></p>
    <p>최고기온: <span id="maxTemp2"></span></p>
    <p>최저기온: <span id="minTemp2"></span></p>
    <p>강수 확률: <span id="pop2"></span></p>
    <p>하늘 상태: <span id="sky2"></span></p>
    
    <p>날짜: <span id="dayAfterTomorrowDate"></span></p>
    <p>최고기온: <span id="maxTemp3"></span></p>
    <p>최저기온: <span id="minTemp3"></span></p>
    <p>강수 확률: <span id="pop3"></span></p>
    <p>하늘 상태: <span id="sky3"></span></p>
    <button type="button" class="btnon btnon1" onclick="getWeather()">검색</button>

</body>
</html>