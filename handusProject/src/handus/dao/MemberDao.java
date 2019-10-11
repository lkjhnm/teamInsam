package handus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import handus.model.Auth;
import handus.model.Criteria;
import handus.model.Member;
import handus.model.MemberVerify;

public interface MemberDao {
	public int insertMember(Member member);
	public boolean insertApiMember(Member member);
	public boolean insertMemberAuth(List<Auth> list);
	public int insertMemberVerify(MemberVerify mv);
	
	public Member selectByID(String id);
	public Member selectByApiId(String m_apiid);
	public Member selectByNum(int m_pk);
	public MemberVerify selectMemberVerify(int m_pk);
	public List<Member> selectAllMember();
	
	public boolean updateMemberVerify(@Param("m_pk") int m_pk, @Param("m_eval") boolean m_eval);
	public boolean updateMemberAuth(Auth auth);
	public boolean updateMailUUID(MemberVerify mv);
	
	public Member selectMember(int m_pk);
	public int updateMember(Member member);
	public int deleteMember(int m_pk);
	//게시판 페이징
	List<Member> listPage(Criteria cri);
	//게시판 페이징용 Criteria
	public List<Member> listCriteria(Criteria cri);
	//토탈카운트를 반환
	public int getTotalCount(Criteria cri);
	public Member read(Integer bno);
	
	
	
}
