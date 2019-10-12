package handus.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import handus.model.Criteria;
import handus.model.Member;

@Repository
public class ManagerImp implements ManagerDao{
	
	private SqlSession session;

	
	@Override
	public void create(Member member) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Member read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void update(Member member) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delete(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<Member> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Member> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Member> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
