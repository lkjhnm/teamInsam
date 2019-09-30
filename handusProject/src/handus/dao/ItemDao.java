package handus.dao;

import java.util.List;
import java.util.Map;

import handus.model.Item;

public interface ItemDao {
	public int insertItem(Item item);
	public int updateItem(Item item);
	public int updateReadCount(int i_pk);
	public int updateStock(int i_pk, int stock);
	public int deleteItem(int i_pk);
	public Item selectItemByNum(int i_pk);
	// 검색 메소드 추가 
	public List<Item> selectItemList(int startRow, int endRow);
	public List<Item> selectAllItems();
	public int selectCount();	// 총 갯수 구하는 메소드 
	public List<Map<String,Object>>	selectItemImage(int i_pk);
}
