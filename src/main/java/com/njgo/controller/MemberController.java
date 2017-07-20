package com.njgo.controller;



import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.MemberDTO;
import com.njgo.service.MemberService;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="provision",method= RequestMethod.GET)
	public void test(@RequestParam String mode,@RequestParam String access_token, Model model){
		System.out.println("mode : "+mode);
		model.addAttribute("mode", mode);
		model.addAttribute("access_token", access_token);
		
	}
	@RequestMapping(value="login")
	public void login(){
		
	}
	@RequestMapping(value="info_check" ,method=RequestMethod.GET)
	public void info_check(){
		
	}
	@RequestMapping(value="info_correct" ,method=RequestMethod.GET)
	public void info_correct(){
	
	}
	@RequestMapping(value="memberDelete" ,method=RequestMethod.GET)
	public void memberDelete(){
	
	}
	@RequestMapping(value="test" ,method=RequestMethod.GET)
	public void testKakao(){
	
	}
	
	//=================================== 로그인 , 회원정보 수정, 탈퇴 관련 ==========================================
	
	@RequestMapping(value="memberDelete" ,method=RequestMethod.POST)
	public String memberDelete(@RequestParam String email,@RequestParam String pw,HttpSession session,RedirectAttributes rd){
		
		int result = memberService.memberDelete(email,pw);
		String message ="이용해주셔서 감사합니다!";
		if(result>0){
			System.out.println("탈퇴 성공!!");
			session.invalidate();
			rd.addFlashAttribute("message", message);
		}
		return "redirect:../";
	}
	
	//회원 정보 수정
	@RequestMapping(value="infoCorrectSend",method=RequestMethod.POST)
	public String infoCorrectSend(@RequestParam String data,@RequestParam String type,@RequestParam String email,HttpSession session){
		/*System.out.println("data : "+data);
		System.out.println("type : "+type);
		System.out.println("email :"+email);*/
		int result = memberService.memberUpdate(data, type, email);
		MemberDTO memberDTO =null;
		
		if(result >0){
			memberDTO = memberService.emailCheck(email);
			session.setAttribute("memberDTO", memberDTO);
		}
		return "redirect:info_correct";
	}
	
	
	//회원정보 비밀번호 재확인
	@RequestMapping(value="info_check" ,method=RequestMethod.POST)
	public String info_check(@RequestParam String email,@RequestParam String pw, RedirectAttributes rd){
		
		MemberDTO memberDTO = memberService.memberLogin(email, pw);
		Boolean check =false;
		if(memberDTO !=null){
			check =true;
			rd.addFlashAttribute("check", check);
			return "redirect:info_correct";
		}
		return "redirect:info_check";
	}
	
	
	
	// 로그인
	@RequestMapping(value="memberLogin",method=RequestMethod.POST)
	public String memberLogin(HttpSession session ,@RequestParam String email,@RequestParam String pw,Model model){
		MemberDTO memberDTO = memberService.memberLogin(email, pw);
		String message= "아이디 또는 비밀번호를 다시 확인해주세요.";
		if(memberDTO !=null){
			message = "로그인 성공!!";
			session.setAttribute("memberDTO",memberDTO);
		}
		model.addAttribute("message", message);
		return "home"; 
	}
	// 로그아웃 
	@RequestMapping(value="logout")
	public String memberLogout(HttpSession session){
	
		session.invalidate();
		return "home";
	}
	
	
	
	//=============================  Member Join START=====================================
	
	//약관 확인 누른다음 joinCode 생성해서 joinForm.jsp에 넣어줌
	@RequestMapping(value="joinForm",method= RequestMethod.POST)
	public void join(Model model, @RequestParam String mode, @RequestParam String access_token){
		System.out.println("access_token : "+access_token);
		
		 int ran = new Random().nextInt(1000000) + 100000; // 100000 ~ 999999
	     String joinCode = String.valueOf(ran);
	     model.addAttribute("joinCode", joinCode);
	     model.addAttribute("access_token", access_token);	
	}
	
	// 가입
	@RequestMapping(value="memberJoin", method = RequestMethod.POST)
	public String memberJoin(MemberDTO memberDTO,Model model)throws Exception{
		
		int result = memberService.memberJoin(memberDTO);
		String path ="member/sendEmail";
		if(result>0){
				
			model.addAttribute("email", memberDTO.getEmail());
			model.addAttribute("joinCode", memberDTO.getJoinCode());
			model.addAttribute("path", "sendEmail");
			
			return path;
		}else{
		
			return "/";
		}
	}
	// 이메일 중복 체크 
	@RequestMapping(value="emailCheck", method = RequestMethod.POST)
	public ModelAndView emailCheck(String email){
		
		MemberDTO memberDTO = memberService.emailCheck(email);
		ModelAndView mv = new ModelAndView();
		int code = 1; // 사용가능한 email
		if(memberDTO!=null){
			code = 0; // 중복된 email 
		}
		mv.addObject("code", code);
		mv.setViewName("./member/commons/result");
		
		return mv;
	}
	// kakaoID 중복 체크 
		@RequestMapping(value="kakaoIDCheck", method = RequestMethod.POST)
		public ModelAndView kakaoIDCheck(String kakaoID){
			
			MemberDTO memberDTO = memberService.kakaoIDCheck(kakaoID);
			ModelAndView mv = new ModelAndView();
			int code = 1; // 사용가능한 kakaoID
			if(memberDTO!=null){
				code = 0; // 중복된 kakaoID 
			}
			mv.addObject("code", code);
			mv.setViewName("./member/commons/result");
			
			return mv;
		}

	// 닉네임 중복체크
	@RequestMapping(value="nickNameCheck", method = RequestMethod.POST)
	public ModelAndView nickNameCheck(String nickName){

		MemberDTO memberDTO = memberService.nickNameCheck(nickName);
		ModelAndView mv = new ModelAndView();
		int code = 1; // 사용가능한 nickName
		if(memberDTO!=null){
			code = 0; // 중복된 nickName 
		}
		mv.addObject("code", code);
		mv.setViewName("./member/commons/result");
		
		return mv;
	}
	// ======================================= Kakao Join ===========================================
	@RequestMapping(value="/kakaoLogin" ,produces="application/json", method={RequestMethod.GET,RequestMethod.POST})
	public void kakaoTest(@RequestParam("code") String code, HttpServletRequest request){
			System.out.println("code : "+code);
	}
	
	
}