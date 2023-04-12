package com.sweethome.sweet.order.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sweethome.sweet.goods.vo.GoodsVO;
import com.sweethome.sweet.member.vo.MemberVO;
import com.sweethome.sweet.memberB.vo.MemberVOB;
import com.sweethome.sweet.order.service.OrderService;
import com.sweethome.sweet.order.vo.OrderVO;

@Controller("orderController")
@RequestMapping(value="/order")
public class OrderControllerImpl implements OrderController {
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping(value = "/orderEachGoods.do", method = RequestMethod.POST)
	public ModelAndView orderEachGoods(@ModelAttribute("orderVO") OrderVO _orderVO, Integer goods_id,
	                                    HttpServletRequest request, HttpServletResponse response) throws Exception {

	    request.setCharacterEncoding("utf-8");
	    HttpSession session = request.getSession();
	    session = request.getSession();

	    Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
	    String action = (String) session.getAttribute("action");

	    if (isLogOn == null || !isLogOn) {
	        session.setAttribute("orderInfo", _orderVO);
	        session.setAttribute("action", "/order/orderEachGoods.do");
	        return new ModelAndView("redirect:/member/loginForm.do");
	    } else {
	        if (action != null && action.equals("/order/orderEachGoods.do")) {
	            _orderVO = (OrderVO) session.getAttribute("orderInfo");
	            session.removeAttribute("action");
	        }
	    }

	    // 현재 날짜를 계약 날짜(sale_date)로 설정
	    _orderVO.setSale_date(new Date(System.currentTimeMillis()));

	    String viewName = (String) request.getAttribute("viewName");
	    ModelAndView mav = new ModelAndView(viewName);

	    // 현재 로그인한 회원의 정보를 가져옴
	    MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

	    // 계약 정보에 필요한 정보들을 설정
	    OrderVO orderVO = orderService.getGoodsById(goods_id);
	    MemberVOB memberVOB = (MemberVOB) session.getAttribute("memberVOB");

	    _orderVO.setGoods_id(orderVO.getGoods_id());
	    _orderVO.setMember_id(memberVO.getMember_id());
	    _orderVO.setBp_id(memberVOB.getBp_id());
	    _orderVO.setPrice(orderVO.getPrice());

	    List<OrderVO> myOrderList = new ArrayList<OrderVO>();
	    myOrderList.add(_orderVO);

	    session.setAttribute("orderVO", orderVO);
	    session.setAttribute("myOrderList", myOrderList);
	    session.setAttribute("memberVO", memberVO);
	    return mav;
	}


	
}

