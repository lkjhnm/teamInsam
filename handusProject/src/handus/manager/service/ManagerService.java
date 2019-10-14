package handus.manager.service;

import java.util.Date;
import java.util.List;

import handus.model.Criteria;
import handus.model.Member;

public interface ManagerService {
	
	// 글 목록 조회
	List<Member> getBoardList(Criteria cri);
	
	//listPage 메소드 추가
	List<Member> listPage(Criteria cri) throws Exception;
	
	// 글 상세 조회
	Member getContent(int m_pk);
	
	// 글 등록
	int insertManagerMember(Member member);

	// 글 수정
	int updateManagerMember(Member member);

	// 글 삭제
	int deleteManagerMember(int m_pk);
	
	//글 갯수
	int totalCnt();

}
