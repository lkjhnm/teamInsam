package handus.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import handus.model.Auction;
import handus.model.HandusImgList;
import handus.model.Item;
import handus.model.Studio;

public interface AuthorDao {

	public boolean insertAuction(Map<String,Object> auction);
	public boolean insertStudio(Map<String,Object> studio);
	public boolean insertItem(Map<String,Object> item);
	public boolean insertImage(@Param("type") String type,@Param("hi_fk") int hi_fk, @Param("imgList") HandusImgList imgList);
	public List<Map<String, Object>> getListOfAuthor(@Param("type") int type, @Param("m_pk_writer")int m_pk);
	public boolean insertAuthor(Map<String,Object> formData);
	public boolean insertAuthorImage(Map<String,Object> formData);
	public boolean updateAuthorImage(Map<String,Object> formData);
	public boolean updateAuthor(Map<String,Object> formData);
	public Map<String,Object> selectAuthorImage(int ap_pk);
	public Map<String,Object> selectAuthorInfo(int m_pk);
}
