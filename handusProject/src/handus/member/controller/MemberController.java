package handus.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import handus.dao.MemberDao;
import handus.member.service.IMemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String handusLogin() {
		return "login";
	}
	//로그인 포스트 작업 아직안함
	
	@RequestMapping(value="/signUp",method=RequestMethod.GET)
	public String handusSignUp() {
		
		return "signUp";
	}
}
