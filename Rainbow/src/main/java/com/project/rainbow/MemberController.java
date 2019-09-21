package com.project.rainbow;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.project.rainbow.service.MemberService;
import com.project.rainbow.vo.MemberVO;

@Controller
public class MemberController {
	
	ModelAndView mv;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	  
	// 회원 가입 get
	@RequestMapping(value = "/member/signup")
	public ModelAndView sign_up() throws Exception {
		mv = new ModelAndView();
		mv.setViewName("/member/singup");
		return mv;
	}

	// 회원 가입
	@ResponseBody
	@RequestMapping(value = "/member/signup", method = RequestMethod.POST)
	public int sign_up(MemberVO vo) throws Exception {
		 int result = ms.sign_up(vo);
		 return result;
	}
		 
	// 로그인
	@RequestMapping(value="/member/login")
	public ModelAndView login() throws Exception{
		mv = new ModelAndView();
		mv.setViewName("/member/login");
		return mv;
	}

	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public ModelAndView postLogin(MemberVO vo, HttpServletRequest req) throws Exception {
		mv = new ModelAndView();
		mv = ms.login(vo, req);
		return mv;
	}
	
	// 로그아웃 
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();;
		return "redirect:/";
	}
	
	// 아이디 찾기 get
	@RequestMapping(value="/member/findId")
	public ModelAndView find_id() throws Exception{
		mv = new ModelAndView();
		mv.setViewName("/member/findId");
		return mv;
	}

	@RequestMapping(value="/member/findIdPro", method=RequestMethod.POST)
	public ModelAndView find_id(MemberVO vo) throws Exception{
		mv = new ModelAndView();
		mv = ms.find_id(vo);
		return mv;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="/member/findPass")
	public ModelAndView getPass() throws Exception{
		mv = new ModelAndView();
		mv.setViewName("/member/findPass");
		return mv;
	}
	
	@RequestMapping(value="/member/findPass", method=RequestMethod.POST)
	public ModelAndView mailSending(MemberVO vo, HttpServletRequest req) throws Exception {
		mv = new ModelAndView();
		mv = ms.mailSending(vo, req);
		return mv;
	}
	
	// 비밀번호 변경 폼 
	@RequestMapping(value = "/member/findPassForm")
	public ModelAndView resetMyPwForm(HttpServletRequest req) {
		mv = new ModelAndView();
		mv = ms.resetMyPwForm(req);
		return mv;
	}
	
	@RequestMapping(value = "/findPassPro", method=RequestMethod.POST)
	public ModelAndView updatePass(MemberVO vo) throws Exception {
		mv = new ModelAndView();
		mv = ms.updatePass(vo);
		return mv;
	}
	
	
	
}
