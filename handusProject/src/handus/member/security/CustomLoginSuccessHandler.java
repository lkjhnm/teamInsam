package handus.member.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import handus.member.service.MemberService;
import handus.model.Member;

@Component
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	MemberService memberService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		boolean validate = authentication.getAuthorities().stream()
				.map(auth -> auth.getAuthority())
				.anyMatch(auth -> auth.equals("ROLE_MEMBER_NV"));
		
		if(!validate) {
			String userid = authentication.getName();
			Member mem = memberService.getMemberById(userid);
			HttpSession session = request.getSession();
			session.setAttribute("m_pk", mem.getM_pk());

			response.sendRedirect("/handusProject/auction/list");
		}else {
			response.sendRedirect("signUpComplete");
		}
	}	//세션에 m_pk를 저장한다.
}
