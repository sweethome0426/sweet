<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>계약 완료</title>
</head>
<body>
    <h1>계약이 완료되었습니다!</h1>
    <table>
        <thead>
            <tr>
                <th>계약자</th>
                <th>가격</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${myOrderList}" var="order">
                <tr>
                    <td>${order.member_id}</td>
                    <td>${order.goods_sales_price}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
