package handus.member.service;

import java.util.List;

import handus.model.Member;

public interface IMemberService {
	public boolean signUpMember(Member member);
	public boolean modifyMember(Member member);
	public boolean withdrawalMember(int num);
	public Member getMemberByNum(int num);
	public Member getMemberById(String id);
	public List<Member> getMemberList();
}
