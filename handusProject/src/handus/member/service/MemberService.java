package handus.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.dao.MemberDao;
import handus.model.Member;

@Service
public class MemberService implements IMemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public boolean signUpMember(Member member) {
		if(memberDao.insertMember(member)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean modifyMember(Member member) {
		if(memberDao.updateMember(member)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean withdrawalMember(int num) {
		if(memberDao.deleteMember(num)>0) {
			return true;
		}
		return false;
	}

	@Override
	public Member getMemberByNum(int num) {
		return memberDao.selectByNum(num);
	}

	@Override
	public Member getMemberById(String id) {
		return memberDao.selectByID(id);
	}

	@Override
	public List<Member> getMemberList() {
		return memberDao.selectAllMember();
	}

}
