<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!-- fmt를 사용하기위한 태그 라이브러리 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>listMessage</title>
<link rel="stylesheet" href="${contextPath}/resources/css/noticeBoard.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

   <%-- 페이지 넘김 --%>
    <script>
        $('.check.all').on('change', function() {
            $('.check').prop('checked', $(this).prop('checked'));
        });

        $(document).on('click', '.page-box .btn.number', function() {
            $('.page-box .btn.number').removeClass('on');
            $(this).addClass('on');
            return false;
        })
    </script>

</head>
<body>
    <h1>쪽지함</h1>
    <br>
      <section class="article-list table-common con">
        <table border="1">
    		<thead>
		        <tr>
		            <th>번호</th>
		            <th>작성자</th>
		            <th>제목</th>
		            <th>작성일자</th>
		        </tr>
        	</thead>
			<tbody>
	        <c:forEach var="message" items="${listMessage}">
		        <tr>
		            <td>${message.no}</td>
		            <td>${message.send_id}</td>
		            <!-- 상세 페이지 추가 -->
		            <td><a href="${contextPath}/message/read.do?no=${message.no}">${message.title}</a></td>
					<td>${message.writeDate}</td>
		        </tr>
	        </c:forEach>
	        </tbody>
    	</table>
      </section>
      
        <%-- 검색 창 --%>

    <br>
    
    <div class="sub_sps_sch">
        <form action="">
            <fieldset>
                <legend>검색창</legend>
                <div class="select-box">
                    <label for="">제목</label>
                    <select name="key" class="select-cus">
                        <option value="wr_subject">제목</option>
                        <option value="wr_content">내용</option>
                    </select>
                </div>
                <div class="search_box">
                    <input type="text" name="search_name" value="" required="" id="stx" class="search_name frm_input" size="15" maxlength="20" placeholder="검색어를 입력하세요" title="검색어를 입력하는 요소">
                    <input type="button" value="검색" class="btn_submit btn_submit_" title="검색을 누르는 버튼">
                    <input type="button" value="쪽지 쓰기" class="btn_submit btn_submit_" title="쪽지 쓰기" onclick="location.href = '${contextPath}/message/messageForm.do'">
              
                </div>

            </fieldset>
        </form>
    </div>

    <%-- 페이지 넘김 --%>
    <div class="page-box">
        <a class="btn" href="#">&lt;</a>

        <!--  숫자 버튼  -->
        <a class="btn number" href="#">1</a>
        <a class="btn number" href="#">2</a>
        <a class="btn number on" href="#">3</a>
        <a class="btn number" href="#">4</a>
        <a class="btn number" href="#">5</a>

        <a class="btn" href="#">&gt;</a>
    </div>
      
</body>
</html>