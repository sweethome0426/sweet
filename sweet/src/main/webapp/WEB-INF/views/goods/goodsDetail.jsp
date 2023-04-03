<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="goodsVO" value="${goodsMap['goodsVO']}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<h1>부동산 정보 상세페이지</h1>
		<div class="goodsVO-info">
			<div class="goodsVO-img">
				<img src="${goodsVO.img1}" alt="${goodsVO.name}">
			</div>
			<div class="goodsVO-details">
				<h2>${goodsVO.name}</h2>
				<input type="hidden" name="goods_bp_id" value="${goodsVO.goods_bp_id}">

				<p><strong>종류:</strong> ${goodsVO.type}</p>
				<p><strong>층:</strong> ${goodsVO.floor}</p>
				<p><strong>면적:</strong> ${goodsVO.area}㎡</p>
				<p><strong>방 개수:</strong> ${goodsVO.room_num}</p>
				<p><strong>화장실 개수:</strong> ${goodsVO.bthroom_num}</p>
				<p><strong>방향:</strong> ${goodsVO.homeDrctn}</p>
				<p><strong>주차:</strong> ${goodsVO.parking === 1 ? "가능" : "불가능"}</p>
				<p><strong>주차비:</strong> ${goodsVO.parking_pay}원/월</p>
				<p><strong>엘리베이터:</strong> ${goodsVO.elevator === 1 ? "있음" : "없음"}</p>
				<p><strong>베란다:</strong> ${goodsVO.veranda === 1 ? "있음" : "없음"}</p>
				<p><strong>주용도:</strong> ${goodsVO.mainUse}</p>
				<p><strong>입주 가능일:</strong> ${goodsVO.move_in_date}</p>
				<p><strong>사용일:</strong> ${goodsVO.using_date}</p>
				<p><strong>등록일:</strong> ${goodsVO.make_date}</p>
				<p><strong>삭제일:</strong> ${goodsVO.remove_date}</p>
				<p><strong>보증금:</strong> ${goodsVO.daposit}만원</p>
				<p><strong>전세금:</strong> ${goodsVO.jeonse}만원</p>
				<p><strong>월세:</strong> ${goodsVO.payment}만원</p>
				<p><strong>관리비:</strong> ${goodsVO.m_payment}만원</p>
				<p><strong>보험비:</strong> ${goodsVO.b_payment}만원</p>
				<p><strong>관리비 포함 여부:</strong> ${goodsVO.main_cost === 1 ? "포함" : "미포함"}</p>
				<p><strong>부동산 설명:</strong> ${goodsVO.content}</p>
				<p><strong>위치:</strong> ${goodsVO.addr1} ${goodsVO.addr2} ${goodsVO.region}</p>
				<p><strong>상태:</strong> ${goodsVO.status}</p>
				<p><strong>좋아요:</strong> ${goodsVO.like}</p>
			</div>
		</div>
	</div>
</body>
</html>