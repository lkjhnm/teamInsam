package handus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import handus.model.Auth;
import handus.model.Member;
import handus.model.MemberVerify;

public interface MemberDao {
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(int m_pk);
	public Member selectByID(String id);
	public Member selectByNum(int m_pk);
	public List<Member> selectAllMember();
	public int insertMemberVerify(MemberVerify mv);
	public MemberVerify selectMemberVerify(int m_pk);
	public boolean updateMemberVerify(@Param("m_pk") int m_pk, @Param("m_eval") boolean m_eval);
	public boolean insertMemberAuth(List<Auth> list);
	public boolean updateMemberAuth(Auth auth);
	public boolean updateMailUUID(MemberVerify mv);
}
