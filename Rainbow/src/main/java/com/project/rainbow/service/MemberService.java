package com.project.rainbow.service;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.rainbow.dao.MemberDAO;
import com.project.rainbow.vo.MemberVO;

@Service
public class MemberService {
	
	ModelAndView mv;
	
	@Autowired
	private MemberDAO mDao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	// 회원 가입
	public int sign_up(MemberVO vo) throws Exception {

		 int result = 0;
		 int idCheck = mDao.idCheck(vo.getUserId());	// 아이디 중복 체크. 
				 
		 if(idCheck == 0) {
			 int phoneCheck = mDao.phoneCheck(vo.getUserPhone());	// 연락처 중복 체크. 
			 if(phoneCheck == 0) {	
				 String inputPass = vo.getUserPass();
				 String pass = passEncoder.encode(inputPass);	// 패스워드 암호화.
				 vo.setUserPass(pass);
				 mDao.signup(vo);
			 }else {
				 result = 1;
			 }
		 }else {
			 result = 2;
		 }
		 
		 return result;
	}	
	
	// 로그인
	public ModelAndView login(MemberVO vo, HttpServletRequest req) throws Exception{
		mv = new ModelAndView();
		MemberVO login = mDao.login(vo);
		HttpSession session = req.getSession();
		
		if(login != null) {
			// 입력한 패스워드와 암호화되어 저장된 패스워드를 비교한다. 
			boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
			
			if(login != null && passMatch) {	// 아이디와 패스워드가 일치하면 로그인. 
				session.setAttribute("member", login);
				mv.setViewName("home");
			}else {	// 입력한 아이디와 패스워드가 일치하지 않을시
				session.setAttribute("member", null);
				String id = "아이디가 존재하지 않습니다";
				mv.addObject("msg", id);
				mv.setViewName("redirect:/member/login");
			}
		}else {	// 입력한 아이디가 DB에 존재하지 않을시
			String pass = "비밀번호가 존재하지 않습니다";
			mv.addObject("msg", pass);
			mv.setViewName("redirect:/member/login");
		}
		return mv;
	}

	// 아이디 찾기
	public ModelAndView find_id(MemberVO vo) throws Exception{
		mv = new ModelAndView();
		MemberVO find = mDao.findId(vo);
		int check = 0;

		if(find != null) {
			check = 1;
			String id = find.getUserId();
			
			// @를 기준으로 문자열 추출 
			int ind = id.indexOf("@");
			String word = id.substring(0, ind-3) + "***";
			String mail = id.substring(ind + 1);
			String userId = word + "@" + mail;
			mv.addObject("userId", userId);
			mv.addObject("check", check);
		}
		mv.setViewName("/member/findIdPro");
		return mv;
		
	}
	
	// 비밀번호 찾기
	public ModelAndView mailSending(MemberVO vo, HttpServletRequest req) throws Exception {
		mv = new ModelAndView();
		int result;
		result = mDao.findPass(vo);
		
		if(result != 0) {
			String setfrom = "heemerci@gmail.com";	// 보내는 사람 
			String tomail = req.getParameter("userId"); // 받는 사람 이메일
			String title = "비밀번호 변경"; // 메일 제목
			String content = "http://localhost:9000/rainbow/member/findPassForm?userId=" + tomail; 

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는 사람 생략하면 정상작동 X
				messageHelper.setTo(tomail); // 받는 사람 이메일
				messageHelper.setSubject(title); // 메일 제목은 생략이 가능
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
				System.out.println("메일 보냄");
			} catch (Exception e) {
				System.out.println(e);
			}
			String text ="이메일을 확인해주시기 바랍니다.";
			mv.addObject("text", text);
		}else {
			String text = "존재하지 않는 이메일입니다.";
			mv.addObject("text", text);
		}
		mv.setViewName("/member/findPass");
		return mv;
	}
	
	// 비밀번호 변경 폼 
	@RequestMapping(value = "/findPassForm")
	public ModelAndView resetMyPwForm(HttpServletRequest req) {

		mv = new ModelAndView();
		String id = req.getParameter("userId");
		int ind = id.indexOf("@");
		String userId = id.substring(0, ind);
		
		mv.addObject("userId", userId);
		return mv;
	}
	
	public ModelAndView updatePass(MemberVO vo) throws Exception {
		mv = new ModelAndView();
		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		vo.setUserPass(pass);
		mDao.updatePass(vo);
		mv.setViewName("redirect:/member/login");
		return mv;
	}
}
