package handus.member.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import handus.model.Member;

public class CustomUser extends User{
	
	private Member member;
	
	public CustomUser() {
		super("invalid", "invalid", new ArrayList<SimpleGrantedAuthority>());
	}
	
	public CustomUser(String username, String password,Collection<? extends GrantedAuthority> authorities ) {
		super(username,password,authorities);
	}
	
	public CustomUser(Member member) {
		super(member.getM_id(), member.getM_password(),
				member.getAuthList().stream().map( auth -> new SimpleGrantedAuthority(auth.getMa_authority())).collect(Collectors.toList()));
		this.member = member;
	}

	public Member getMember() {
		return member;
	}

}
