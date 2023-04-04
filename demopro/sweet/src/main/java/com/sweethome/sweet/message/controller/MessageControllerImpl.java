package com.sweethome.sweet.message.controller;

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

import com.sweethome.sweet.message.service.MessageService;
import com.sweethome.sweet.message.vo.MessageVO;
import com.sweethome.sweet.member.vo.MemberVO;

@Controller("messageController")
@RequestMapping(value="/message")
public class MessageControllerImpl implements MessageController {
	
	@Autowired
	private MessageService messageService;
	@Autowired
	private MessageVO messageVO;

	
	@Override
	@RequestMapping(value = "/listMessage.do")
	public ModelAndView selectAllMessageList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<MessageVO> listMessage = messageService.selectAllMessageList();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/message/listMessage");
		mav.addObject("listMessage",listMessage);
		return mav;
		//추가 중
		
	}
		
	
	@RequestMapping(value="/messageForm.do", method=RequestMethod.GET)
	public String messageForm() throws Exception{
	return "/message/messageForm";
	}

	 @RequestMapping(value="/insert.do", method=RequestMethod.POST)
	 public String insertMessage(MessageVO messageVO) throws Exception {
	     messageService.insertMessage(messageVO);
	     return "redirect:/message/listMessage.do";
	}
	 
	 //상세보기 추가 
	 @RequestMapping(value="/read.do", method=RequestMethod.GET)
	 public String noteRead(@RequestParam int no,Model model) throws Exception {
	     MessageVO data = messageService.noteRead(no); // no값을 넘김
	     model.addAttribute("data", data); // model에 데이터 값을 담는다
	     return "/message/viewMessage"; // board/board_list.jsp로 이동
	}
	    
	//삭제
	 @RequestMapping(value="/delete.do", method=RequestMethod.GET)
	 public String noteDelete(@RequestParam int no)throws Exception {
		 messageService.deleteNote(no);
		 return "redirect:/message/listMessage.do";
	 }
	 
	 
	
	    
}
