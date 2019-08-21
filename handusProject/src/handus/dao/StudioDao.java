package handus.dao;

import java.util.List;

import handus.model.Studio;


public interface StudioDao {
	public int insertStudio(Studio studio);
	public int updateStudio(Studio studio);
	public int deleteStudio(int S_PK);
	public Studio selectStudioByNum(int S_PK);
	public List<Studio> selectStudioList(int startRow, int endRow);
	public List<Studio> selectAllStudio();
	public int updateReadCount(int S_PK);
	// 검색 메소드 추가 
}
