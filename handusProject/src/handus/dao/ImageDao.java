package handus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ImageDao {
	
	public List<Map<String,Object>> selectImageListByFK(@Param("hi_fk") int hi_fk, @Param("hi_type") int hi_type);
	public Map<String,Object> selectImageByPK(int hi_pk);
}
