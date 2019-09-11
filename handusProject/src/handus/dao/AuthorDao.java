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

	public boolean insertAuction(Auction auction);
	public boolean insertStudio(Studio studio);
	public boolean insertItem(Item item);
	public boolean insertImage(@Param("type") String type, @Param("imgList") HandusImgList imgList);
	public List<Map<String, Object>> getListOfAuthor(@Param("type") int type, @Param("m_pk_writer")int m_pk);
	public boolean insertAuthor(Map<String,Object> formData);
	public boolean insertAuthorImage(Map<String,Object> formData);
	public boolean updateAuthorImage(Map<String,Object> formData);
	public boolean updateAuthor(Map<String,Object> formData);
	public Map<String,Object> selectAuthorImage(int ap_pk);
	public Map<String,Object> selectAuthorInfo(int m_pk);
}
