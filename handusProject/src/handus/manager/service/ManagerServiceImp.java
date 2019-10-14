package handus.manager.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.dao.ManagerDao;
import handus.dao.MemberDao;
import handus.model.Criteria;
import handus.model.Member;

@Service
public class ManagerServiceImp implements ManagerService{
	
	@Autowired
	private ManagerDao managerDao;
	@Autowired
	private MemberDao memberDao;
	

	@Override
	public List<Member> getBoardList(Criteria cri) {
		// TODO Auto-generated method stub
		return memberDao.selectAllMember();
	}

	@Override
	public Member getContent(int m_pk) {
		// TODO Auto-generated method stub
		return memberDao.selectByNum(m_pk);
	}

	@Override
	public int insertManagerMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public int updateManagerMember(Member member) {
		// TODO Auto-generated method stub
		return memberDao.updateMember(member);
	}

	@Override
	public int deleteManagerMember(int m_pk) {
		// TODO Auto-generated method stub
		return memberDao.deleteMember(m_pk);
	}

	@Override
	public List<Member> listPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int totalCnt() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
}
