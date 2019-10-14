package handus.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import handus.model.Studio;


public interface StudioDao {
	public int insertStudio(Studio studio);
	public int updateStudio(Studio studio);
	public int deleteStudio(int s_pk);
	public Studio selectStudioByNum(int s_pk);
	public int updateReadCount(int s_pk);
	public int isReservation(Date date, int s_pk);
	
	// 카테고리, 페이징처리 목록 
	public List<Map<String,Object>> selectStudioList(@Param("page")int page, @Param("type") String type);
	public List<Studio> selectAllStudio();
	public int selectCount(@Param("type") String type);
	public List<Map<String,Object>> selectStudioImage(int s_pk);
}
