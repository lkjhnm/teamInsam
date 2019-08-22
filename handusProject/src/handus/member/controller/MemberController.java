package handus.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import handus.dao.MemberDao;
import handus.member.service.IMemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private IMemberService memberService;
	
	
	
}
