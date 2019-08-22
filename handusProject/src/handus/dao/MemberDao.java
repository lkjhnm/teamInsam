package handus.dao;

import java.util.List;

import handus.model.Member;

public interface MemberDao {
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(int m_pk);
	public Member selectByID(String id);
	public Member selectByNum(int m_pk);
	public List<Member> selectAllMember();
}
