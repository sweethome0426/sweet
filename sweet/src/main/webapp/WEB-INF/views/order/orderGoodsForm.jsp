<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>계약 정보</title>
</head>
<body>
	<h1>계약 정보</h1>
	<form method="post" action="/sweet/order/payToOrderGoods.do">
	<table>
		<tr>
			<th>상품명</th>
			<th>판매자</th>
			<th>계약 금액</th>
			<th>구매 일시</th>
			<th>배송지역</th>
			<th>배송 상태</th>
		</tr>
		<c:forEach var="order" items="${myOrderList}">
			<tr>
				<td>${order.goodsVO.goods_name}</td>
				<td>${order.memberVOB.name}</td>
				<td>${order.price}</td>
				<td>${fn:substring(order.sale_date, 0, 10)}</td>
				<td>${order.region} ${order.state}</td>
				<td>${order.delivery_status}</td>
			</tr>
		</c:forEach>
	</table>
	<input type="submit" value="계약하기">
	</form>
</body>
</html>
