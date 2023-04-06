package com.sweethome.sweet.goodscontract.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.sweet.goodscontract.service.GoodsContractService;
import com.sweethome.sweet.goodscontract.vo.GoodsContractVO;

import com.sweethome.sweet.member.vo.MemberVO;
import com.sweethome.sweet.message.vo.MessageVO;


@Controller("goodsContractController")
@RequestMapping(value="/contract")
public class GoodsContractControllerImpl implements GoodsContractController {
	
	@Autowired
	private GoodsContractService goodsContractService;
	@Autowired
	private GoodsContractVO goodsContractVO;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value = "/userContract.do", method = RequestMethod.GET)
	public ModelAndView selectAllGoodsContractList(@RequestParam(value = "member_id", required = false) String member_id,
	                                          HttpServletRequest request, HttpServletResponse response) throws Exception {
	    String viewName = (String) request.getAttribute("viewName");
	    ModelAndView mav = new ModelAndView(viewName);
	    HttpSession session = request.getSession();
	    MemberVO memberVO = (MemberVO)session.getAttribute("member");
	    String loggedInMemberId = memberVO.getMember_id();
	    
	    List<GoodsContractVO> userContract = null;
	    if (member_id != null && !member_id.equals("")) {
	    	userContract = goodsContractService.selectAllGoodsContractList(member_id);
	    } else {
	        userContract = goodsContractService.selectAllGoodsContractList(loggedInMemberId);
	    }
	    mav.setViewName("/contract/userContract");
	    mav.addObject("userContract", userContract);
	    return mav;
	}
}
