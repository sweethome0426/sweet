package com.sweethome.sweet.goodscontract.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.sweet.goodscontract.vo.GoodsContractVO;

public interface GoodsContractController {
	
	public ModelAndView selectAllGoodsContractList(@RequestParam("member_id")String member_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;

}
