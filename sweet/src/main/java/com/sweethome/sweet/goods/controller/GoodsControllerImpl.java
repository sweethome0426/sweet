package com.sweethome.sweet.goods.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sweethome.sweet.goods.service.GoodsService;
import com.sweethome.sweet.goods.dao.GoodsDAO;
import com.sweethome.sweet.goods.vo.GoodsVO;
import com.sweethome.sweet.memberB.vo.MemberVOB;

import net.sf.json.JSONObject;

@Controller("goodsController")
@RequestMapping(value="/goods")
public class GoodsControllerImpl implements GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	//요청 파라미터로 전달된 goods_id를 사용하여 goodsService에서 상품 정보를 조회하고, 이를 ModelAndView 객체에 담아서 뷰 페이지로 전달합니다.
	@Override
	@RequestMapping(value="/goodsDetail" ,method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goods_id") int goods_id,
	                                 HttpServletRequest request, HttpServletResponse response) throws Exception {
	    System.out.println("Call goodsDetail-method of control");
	    String viewName=(String)request.getAttribute("viewName");
	    
	    HttpSession session=request.getSession();
	    GoodsVO goodsVO = goodsService.goodsDetail(goods_id);
	    ModelAndView mav = new ModelAndView(viewName);
	    mav.addObject("goodsVO", goodsVO);
	    mav.setViewName(viewName);
	    return mav;
	}
	


}

