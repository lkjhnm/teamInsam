package handus.member.security;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import handus.dao.MemberDao;
import handus.model.Member;

@Component
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		Member mem;
		if(username.contains("Kakao")) {
			mem = memberDao.selectByApiId(username.substring(6),1);
			mem.setM_id(username);
			mem.setM_password(encoder.encode(username));
		}else if(username.contains("Naver")){
			mem = memberDao.selectByApiId(username.substring(6), 2);
			mem.setM_id(username);
			mem.setM_password(encoder.encode(username));
		}
		else {
			mem = memberDao.selectByID(username);
		}		
		
		if(mem == null) { 
			throw new UsernameNotFoundException("아이디가 존재하지 않습니다.");
		}
		return new CustomUser(mem);
	}

}
