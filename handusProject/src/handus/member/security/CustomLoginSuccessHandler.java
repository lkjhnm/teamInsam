package handus.member.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import handus.member.service.MemberService;
import handus.model.Member;

@Component
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Autowired
	MemberService memberService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		boolean validate = authentication.getAuthorities().stream()
				.map(auth -> auth.getAuthority())
				.anyMatch(auth -> auth.equals("ROLE_MEMBER_NV"));
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		if(!validate) {
			String userid = authentication.getName();
			Member mem = memberService.getMemberById(userid);
			HttpSession session = request.getSession();
			session.setAttribute("m_pk", mem.getM_pk());
			
			if(savedRequest != null) {
				String targetUrl = savedRequest.getRedirectUrl();
				System.out.println(targetUrl);
				redirectStrategy.sendRedirect(request, response, targetUrl);
			}else {
				redirectStrategy.sendRedirect(request, response, "/auction/list");				
			}
		}else {
			redirectStrategy.sendRedirect(request, response, "/member/signUpComplete");
		}
	}	//세션에 m_pk를 저장한다.
	
	
}
