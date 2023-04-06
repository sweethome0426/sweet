<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>aboutUs</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.7.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/aboutUs.css">

    <script>
        $(function() {
            var container = $(".slide_wrap");
            var slideShow = container.find(".slide_show");
            var slideImg = slideShow.find(".slide_img");
            var slides = slideImg.find(">div"); //슬라이드 이미지   
            var slideBtn = container.find(".slide_btn") //슬라이드 버튼

            var slideCount = slides.length; //슬라이드 개수
            var slideWidth = slides.innerWidth(); //슬라이드 이미지의 가로 값
            var show_num = 3;
            var num = 0;

            var slideCopy = $(".slide:lt(" + show_num + ")").clone();
            slideImg.append(slideCopy);

            //이미지 움직이기
            function back() {
                if (num == 0) {
                    num == slideCount;
                    slideImg.css("margin-left", -num * slideWidth + "px")
                }
                num--;
                slideImg.animate({
                    "margin-left": -slideWidth * num + "px"
                }, 500);
            };

            function next() {
                if (num == slideCount) {
                    num == 0;
                    slideImg.css("margin-left", -num * slideWidth + "px");
                }
                num++;
                slideImg.animate({
                    "margin-left": -slideWidth * num + "px"
                }, 500);
            };

            //버튼 클릭하기
            slideBtn.on("click", "a", function() {
                if ($(this).hasClass("prev")) {
                    back();
                } else {
                    next();
                }
            });

        });
    </script>

    <style>
        @import url {
            link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900"rel="stylesheet"
        }
        .slide img {
        	width:100%;
        	height:250px;
        }
    </style>

</head>

<body>
    <h1>회사 소개</h1>

    <div class="slide_wrap">
        <div class="slide_show">
            <div class="slide_img">
                <div class="slide"><img src="${contextPath}/resources/image/home001.png" alt="이미지1"></div>
                <div class="slide"><img src="https://tistory4.daumcdn.net/tistory/2980705/skin/images/hover02.jpg" alt="이미지2"></div>
                <div class="slide"><img src="https://tistory4.daumcdn.net/tistory/2980705/skin/images/hover03.jpg" alt="이미지3"></div>
                <div class="slide"><img src="https://tistory4.daumcdn.net/tistory/2980705/skin/images/hover04.jpg" alt="이미지4"></div>
                <div class="slide"><img src="https://tistory4.daumcdn.net/tistory/2980705/skin/images/hover05.jpg" alt="이미지5"></div>
            </div>
        </div>
        <%-- 수정하기 --%>
        <div class="slide_btn">
            <a href="#" class="prev"><i class="fas fa-angle-left"></i></a>
            <a href="#" class="next"><i class="fas fa-angle-right"></i></a>
        </div>
    </div>

</body>

</html>