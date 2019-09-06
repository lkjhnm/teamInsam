package handus.member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import handus.member.security.CustomUser;
import handus.member.service.MemberService;
import handus.model.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	@Qualifier("authenticationManager")
	private AuthenticationManager manager;
	
	@Autowired
	private SessionRegistry sessionRegistry;
	
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String handusLogin() {
		return "member/login";
	}
	
	@RequestMapping(value="/signUp",method=RequestMethod.GET)
	public String handusSignUp() {
		
		return "member/signUp";
	}
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String handusSignUp(Member mem , @RequestParam(value="c_pk", required = false) ArrayList<Integer> interList,RedirectAttributes ra){
		
		memberService.signUpMember(mem,interList);
		ra.addFlashAttribute("m_pk", mem.getM_pk());
		
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
			Member mem;
			if(m_id.contains("kakao_")) {
				mem = memberService.getMemberById(m_id.substring(6));
			}else {
				mem = memberService.getMemberById(m_id);				
			}
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
	
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public String myPage() {
		
		return "member/myPage";
	}
	@RequestMapping(value="/subscribe",method=RequestMethod.GET)
	public String alarm() {
		return "member/subscribe";
	}
	
	//------------SNS 로그인
	
	@RequestMapping(value="/oauth")
	@ResponseBody
	public String kakaoLogin(String code,HttpSession session,HttpServletRequest req){
		
		UsernamePasswordAuthenticationToken token = memberService.kakaoLogin(code);
		if(token.getCredentials() != null) {
			token.setDetails(new WebAuthenticationDetails(req));
			Authentication authentication = manager.authenticate(token);
			
			List<SessionInformation> sessionInfo = sessionRegistry.getAllSessions(authentication.getPrincipal(), false);	
			
			for(SessionInformation ssInfo : sessionInfo) {
				Object p = authentication.getPrincipal();
				if(p.equals(ssInfo.getPrincipal())) {
					ssInfo.expireNow();
				}
			}
			CustomUser user = (CustomUser)authentication.getPrincipal();
			int m_pk = user.getMember().getM_pk();
			session.setAttribute("m_pk", m_pk);
			sessionRegistry.registerNewSession(session.getId(), authentication.getPrincipal());
			SecurityContextHolder.getContext().setAuthentication(authentication);
			
			return "<script> window.close(); opener.location.href='/handusProject/auction/list';</script>";
		}else {
			session.setAttribute("apiId", token.getName());
			session.setAttribute("apiType", 1);
			return "<script> window.close(); opener.location.href='additionalSignUp';</script>";
		}
	}
	
	@RequestMapping(value="/cid")
	@ResponseBody
	public String getClientId() {	//카카오 clientid 반환 메서드
		
		return "7085b4545de8b2f34a25a4248fcdbce0";
	}
	
	// API 로그인 회원가입
	
	@RequestMapping(value="/additionalSignUp", method=RequestMethod.GET)
	public String getAdditionalPage() {
		
		return "member/additionalSignUp";
	}
	
	@RequestMapping(value="/additionalSignUp", method=RequestMethod.POST)
	public String apiSignUp(Member member,
			@RequestParam(value="c_pk", required = false) ArrayList<Integer> interList, HttpSession session, RedirectAttributes ra) {
		
		String apiId = (String)session.getAttribute("apiId");
		int apiType = (int)session.getAttribute("apiType");
		member.setM_apiId(apiId);
		member.setM_apiType(apiType);
		
		session.removeAttribute("apiId");
		session.removeAttribute("apiType");
		
		memberService.additionalSignUp(member, interList);
		ra.addFlashAttribute("m_pk", member.getM_pk());
		
		return "redirect:signUpComplete";
	}
}
