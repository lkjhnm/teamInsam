package handus.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import handus.member.service.MemberService;
import handus.model.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String handusLogin() {
		return "member/login";
	}
	//로그인 포스트 작업 아직안함
	
	@RequestMapping(value="/signUp",method=RequestMethod.GET)
	public String handusSignUp() {
		
		return "member/signUp";
	}
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String handusSignUp(Member mem , @RequestParam(value="c_pk", required = false) ArrayList<Integer> interList,RedirectAttributes ra){
		
		memberService.signUpMember(mem,interList);
		ra.addFlashAttribute("m_id", mem.getM_id());
		
		return "redirect:signUpComplete";
	}
	
	@RequestMapping(value="/signUpComplete",method=RequestMethod.GET)
	public String handusSignUpCompl() {
		return "member/signUpComplete";
	}
	
	final String ROLE_MEMBER = "ROLE_MEMBER";		// ROLE_MEMBER_NV --> ROLE_MEMBER 로 변환할때
	final String ROLE_AUTHOR = "ROLE_AUTHOR";		// ROLE_AUTHOR_NV --> ROLE_AUTHOR 로 변환할때
	
	@RequestMapping(value="/mailValidate", method=RequestMethod.GET)
	public String handusMailValidate(String mv_ecode,int m_pk,Model model,RedirectAttributes ra) {			//인증 후 권한 부여
		
		boolean result = memberService.evalidateUpdate(mv_ecode, m_pk,ROLE_MEMBER);
		ra.addFlashAttribute("result", result);
		ra.addFlashAttribute("m_pk", m_pk);
		
		return "redirect:signUpComplete";
	}
	
	@ResponseBody
	@RequestMapping(value="/reSendMail",method=RequestMethod.POST)
	public String remailValidate(@RequestParam(value="m_pk",required=false) Integer m_pk,
								 @RequestParam(value="m_id",required=false) String m_id){
		
		if(m_id != null) {
			Member mem = memberService.getMemberById(m_id);
			m_pk = mem.getM_pk();
		}
		memberService.reSendMail(m_pk);
		
		return "{\"msg\": \"이메일 전송이 완료되었습니다.\"}";
	}
	
	@RequestMapping(value="/idCheck",method=RequestMethod.POST)
	@ResponseBody
	public boolean idCheck(String m_id) {
		
		boolean result = memberService.checkDuplicatedId(m_id);
		
		return result;
	}
}
