package handus.dao;

import java.util.List;
import java.util.Map;

import handus.model.Studio;


public interface StudioDao {
	public int insertStudio(Studio studio);
	public int updateStudio(Studio studio);
	public int deleteStudio(int s_pk);
	public Studio selectStudioByNum(int s_pk);
	public List<Studio> selectStudioList(int startRow, int endRow);
	public List<Studio> selectAllStudio();
	public int updateReadCount(int s_pk);
	public int selectCount();
//	public int minusHeart(int s_pk);
//	public int plusHeart(int s_pk);
	
	// 검색 메소드 추가 
}
