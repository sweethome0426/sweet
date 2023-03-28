package com.sweethome.sweet.admin.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.sweet.member.vo.MemberVO;


public interface AdminMemberController {
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
                              RedirectAttributes rAttr,
                              HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView updateMember(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView dataview(HttpServletRequest request, HttpServletResponse response) throws Exception;
}