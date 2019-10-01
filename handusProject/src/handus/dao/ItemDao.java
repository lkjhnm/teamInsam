package handus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import handus.model.Item;

public interface ItemDao {
	public int insertItem(Item item);
	public int updateItem(Item item);
	public int updateReadCount(int i_pk);
	public int updateStock(int i_pk, int stock);
	public int deleteItem(int i_pk);
	public Item selectItemByNum(int i_pk);
	// 카테고리, 페이징처리 목록 
	public List<Item> selectItemList(@Param("page")int page, @Param("type") String type);
	public List<Item> selectAllItems();
	public int selectCount(@Param("type") String type);	
	public List<Map<String,Object>>	selectItemImage(int i_pk);
}
