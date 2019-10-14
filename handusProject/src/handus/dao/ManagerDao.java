package handus.dao;

import java.util.HashMap;
import java.util.List;

import handus.model.Criteria;
import handus.model.Member;

public interface ManagerDao {
	
//	public int insertMember(Member member);
//	public int updateMember(Member member);
//	public int deleteMember(int m_pk);
//	public Member selectOne(int m_pk);
//	
////  params : 넘길 레코드의 갯수와 조회할 레코드의 갯수
//  public List<Member> selectBoardPage(HashMap<String, Object> paramss);
////  params : 제목, 내용, 넘길 레코드의 갯수, 조회활 레코드의 갯수
//  public List<Member> selectSearchTitle(HashMap<String, Object> params);
////  글쓴이 조회, 넘길 레코드의 갯수, 조회할 레코드의 갯수
//  public List<Member> selectSearchName(HashMap<String, Object> params);
////  params : 시작일, 종료일, 넘길 레코드의 갯수, 조회할 레코드의 갯수
//  public List<Member> selectSearchPeriod(HashMap<String, Object> params);
////  게시물 레코드갯수 조회
//  public int getCount();
	
	public void create(Member member) throws Exception;
	
	public Member read(Integer bno) throws Exception;
	
	public void update(Member member) throws Exception;

	public void delete(Integer bno) throws Exception;

	public List<Member> listAll() throws Exception;
	/*public List<BoardVO> listAll() throws Exception;*/

	//게시판 페이징 
	public List<Member> listPage(int page) throws Exception; 
	/*public List<BoardVO> listPage(int page) throws Exception; */

	//게시판 페이징용 Criteria
	public List<Member> listCriteria(Criteria cri) throws Exception;
	
	//토탈카운트를 반환?
	public int countPaging(Criteria cri) throws Exception;

}
