package com.sweethome.sweet.memberB.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.sweet.memberB.service.MemberServiceB;
import com.sweethome.sweet.memberB.vo.ContractVO;
import com.sweethome.sweet.memberB.vo.MemberVOB;

@Controller("memberControllerB")
//@EnableAspectJAutoProxy
public class MemberControllerBImpl implements MemberControllerB {
	@Autowired
	private MemberServiceB memberServiceB;
	@Autowired
	private MemberVOB memberVOB ;
	@Autowired
	private ContractVO contractVO ;
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	
	//회원가입
	@Override			
	@RequestMapping(value="/memberB/addMemberB.do" ,method = RequestMethod.POST)
	public ResponseEntity addMemberB(@ModelAttribute("memberB") MemberVOB memberVOB,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			memberServiceB.addMemberB(memberVOB);
			message = "<script>";
			message +=" alert('회원가입을 마쳤습니다. 로그인창으로 이동합니다.');";
			message += "location.href='"+request.getContextPath()+"/memberB/loginFormB.do';";
			message += "</script>";
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류 발생 다시 시도해 주세요');";
			message += "location.href='" + request.getContextPath()+"/memberB/memberFormB.do';";
			message += "</script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//회원가입시 아이디 중복체크
	@Override				
	@RequestMapping(value="/memberB/overlappedB.do" ,method = RequestMethod.POST)
	public ResponseEntity overlappedB(@RequestParam("bp_id") String bp_id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberServiceB.overlappedB(bp_id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	//로그인
	@Override
	@RequestMapping(value = "/memberB/loginB.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView loginB(@ModelAttribute("memberB") MemberVOB memberB,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
	memberVOB = memberServiceB.loginB(memberB);
	if(memberVOB != null) {
	    HttpSession session = request.getSession();
	    session.setAttribute("memberB", memberVOB);
	    session.setAttribute("isLogOn", true);
	    //mav.setViewName("redirect:/memberB/listMembersB.do");
	    String action = (String)session.getAttribute("action");
	    session.removeAttribute("action");
	    if(action!= null) {
	       mav.setViewName("redirect:"+action);
	    }else {
	       mav.setViewName("redirect:/main.do");	
	    }

	}else {
	   rAttr.addAttribute("result","loginFailedB");
	   mav.setViewName("redirect:/memberB/loginFormB.do");
	}
	return mav;
	}
	
	//로그아웃
	@Override
	@RequestMapping(value = "/memberB/logoutB.do", method =  RequestMethod.GET)
	public ModelAndView logoutB(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("memberB");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/mainB.do");
		return mav;
	}	

	//로그인폼
	@RequestMapping(value = "/memberB/*FormB.do", method =  RequestMethod.GET)
	private ModelAndView formB(@RequestParam(value= "result", required=false) String result,
							  @RequestParam(value= "action", required=false) String action,
						       HttpServletRequest request, 
						       HttpServletResponse response) throws Exception {
		String viewNameB = (String)request.getAttribute("viewNameB");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);  
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewNameB);
		return mav;
	}
	
	//회원 정보 수정
	@Override
	@RequestMapping(value="/memberB/modMemberB", method=RequestMethod.GET)
	public ModelAndView modMemberB(@RequestParam("bp_id") String bp_id, HttpServletRequest request, HttpServletResponse response)
	        throws Exception {
	    System.out.println("Call modMember-method of control");
	    request.setCharacterEncoding("utf-8");
	    String viewName = "/memberB/modMemberB";
	    System.out.println("viewName : "+viewName);

	    // 1. 세션에서 로그인한 회원 정보를 불러옵니다.
	    HttpSession session = request.getSession();
	    MemberVOB memberB = (MemberVOB) session.getAttribute("memberB");
	    if (memberB == null) { // 로그인한 회원 정보가 없는 경우
	        return new ModelAndView("redirect:/memberB/loginB.do"); // 로그인 페이지로 이동합니다.
	    }

	    // 2. 로그인한 회원 정보를 사용해 회원 정보 수정을 진행합니다.
	    MemberVOB memberVOB = memberServiceB.modMemberB(memberB.getBp_id());
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("memberB",memberVOB);
	    mav.setViewName(viewName);
	    return mav;    
	}

	//수정한 회원 정보 업데이트
	@Override
	@RequestMapping(value="/memberB/updateMemberB", method = RequestMethod.POST)
	public ModelAndView updateMemberB(@ModelAttribute("memberB") MemberVOB memberB, HttpServletRequest request, HttpServletResponse response)throws Exception{
	    System.out.println("Call updateMemberB-method of control");
	    request.setCharacterEncoding("utf-8");
	    int resultB = 0;
	    resultB = memberServiceB.updateMemberB(memberB);
	    ModelAndView mav = new ModelAndView("redirect:/memberB/modMemberB");
	    mav.addObject("bp_id", memberB.getBp_id()); // 수정된 회원의 ID를 전달
	    return mav;
	}
	
	@Override
	@RequestMapping(value="/memberB/listContractB" ,method = RequestMethod.GET)
	public ModelAndView listContractB(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("html/text;charset=utf-8");
	    String viewName = "/memberB/listContractB"; // View의 이름 설정
	    List contractListB = memberServiceB.listContractB();
	    ModelAndView mav = new ModelAndView(viewName);
	    mav.addObject("contractListB", contractListB);
	    return mav;
	}
	
	//회원탈퇴페이지 get
	@RequestMapping(value="/memberB/memberDeleteViewB.do", method = RequestMethod.GET)
	public String deleteUserB() throws Exception{
	return "/memberB/memberDeleteViewB";
	}
			
					
	//회원탈퇴 post
	@RequestMapping(value="/memberB/memberDeleteB.do", method = RequestMethod.POST)
	public String memberDeleteB(MemberVOB memberVOB, HttpSession session, RedirectAttributes rttr) throws Exception{
					
		MemberVOB memberB = (MemberVOB) session.getAttribute("memberB");
					
		// 실제 비밀번호
		String currentPw = memberB.getBp_pw();
		// 입력한 비밀번호
		String userInputPw = memberVOB.getBp_pw();
					
		if(!(currentPw.equals(userInputPw))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/memberB/memberDeleteViewB.do";
			}
				memberServiceB.memberDeleteB(memberVOB);
				session.invalidate();
				return "redirect:/main.do";
			}
	
	//비밀번호 찾기 form
		@RequestMapping(value = "/find/pwFindB")
		public String pwFindB() throws Exception{
			return "/find/pwFindB";
		}
	
	//이메일로 인증번호 보내기
		@RequestMapping(value = "/find/sendMailB", method = RequestMethod.POST)
		public ModelAndView sendMailB(HttpSession session, 
		        @RequestParam("bp_id") String bp_id, // 요청 파라미터 "bp_id"를 받아옴
		        @ModelAttribute("email") String email, // 모델 속성 "email"을 받아옴
		        HttpServletRequest request, 
		        HttpServletResponse response) throws IOException {
		        
		    // 입력된 이메일 주소가 있는지 확인하고 MemberVOB 객체로 반환
		    MemberVOB vo = memberServiceB.selectMemberB(email);
		            
		    if(vo != null) { // 입력된 이메일 주소에 해당하는 회원 정보가 있을 경우
		        Random r = new Random(); // 랜덤한 숫자를 생성하기 위해 Random 객체 생성
		        int num = r.nextInt(999999); // 0부터 999999 사이의 랜덤한 숫자 생성
		            
		        if (vo.getBp_id().equals(bp_id)) { // 입력된 아이디가 해당하는 회원 정보의 아이디와 일치하는 경우
		            session.setAttribute("email", vo.getEmail1() + '@' + vo.getEmail2()); // 세션에 이메일 주소를 저장

		            String setfrom = "bomi258@naver.com"; // 보내는 사람 이메일 주소
		            String tomail = email; // 받는 사람 이메일 주소
		            String title = "[스윗홈] 비밀번호변경 인증 이메일 입니다"; // 이메일 제목
		            String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
		                    + "비밀번호변경 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 이메일 내용
		            try {
		                // MimeMessage 객체와 MimeMessageHelper 객체를 생성하여 이메일을 보냄
		                MimeMessage message = mailSender.createMimeMessage();
		                MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

		                messageHelper.setFrom(setfrom); 
		                messageHelper.setTo(tomail); 
		                messageHelper.setSubject(title);
		                messageHelper.setText(content); 

		                mailSender.send(message); // 메일 보내기
		            } catch (Exception e) {
		                System.out.println(e.getMessage());
		            }

		            ModelAndView mv = new ModelAndView();
		            mv.setViewName("/find/checkEmailB"); // 뷰 이름 설정
		            mv.addObject("num", num); // 모델에 "num" 속성 추가
		            return mv; // 모델과 뷰를 반환하여 응답 생성
		        } else { // 입력된 아이디가 해당하는 회원 정보의 아이디와 일치하지 않는 경우
		            ModelAndView mv = new ModelAndView();
		            mv.setViewName("/find/pwFindB"); // 뷰 이름 설정
		            return mv; // 모델과 뷰를 반환하여 응답 생성
		        }
		    } else { // 입력된 이메일 주소에 해당하는 회원 정보가 없는 경우
		        ModelAndView mv = new ModelAndView();
		        mv.setViewName("/find/pwFindB"); // 뷰 이름
				return mv;
			}
		}
		
		//이메일 인증번호 확인
		@RequestMapping(value = "/find/checkEmailB", method = RequestMethod.POST)
		public String checkEmailB(@RequestParam(value="email_injeung") String email_injeung, @RequestParam(value = "num") String num) throws IOException{
			if(email_injeung.equals(num)) {
				return "/find/pwNewB";
			}
			else {
				return "/find/pwFindB";
			}
		} 
		
		//새 비밀번호 없데이트
		@RequestMapping(value = "/find/pwNewB", method = RequestMethod.POST)
		public String pwNewB(MemberVOB vo, HttpSession session) throws IOException{
			int result = memberServiceB.pwUpdate(vo);
			if(result == 1) {
				return "/memberB/loginFormB.do";
			}
			else {
				System.out.println("pw_update"+ result);
				return "/find/pwNewB";
			}
		}
	
}
