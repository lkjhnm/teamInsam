package handus.member.security;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import handus.dao.MemberDao;
import handus.model.Member;

@Component
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member mem = memberDao.selectByID(username);
		
		return mem == null? new CustomUser() : new CustomUser(mem);
	}
}
