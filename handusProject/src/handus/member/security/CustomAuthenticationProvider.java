package handus.member.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import handus.dao.MemberDao;
import handus.model.Member;

@Component("customProvider")
public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	private UserDetailsService customService;
	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String userid = authentication.getName();
		String password = (String)authentication.getCredentials();
		
		UserDetails member = customService.loadUserByUsername(userid);
		
		if(!encoder.matches(password, member.getPassword())) {	//비밀번호는 숫자를 포함하는 비밀번호라고 가정한다.
			throw new BadCredentialsException("아이디 또는 비밀번호를 확인해주세요.");
		}

		return new UsernamePasswordAuthenticationToken(member, member.getPassword(), member.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}
