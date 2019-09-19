package handus.item.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.dao.ItemDao;
import handus.model.Item;
import handus.model.Studio;

@Service
public class ItemService {
	private static int NUM_OF_STUDIO_PER_PAGE = 6;
	private static int NUM_OF_NAV_PAGE =5;
	@Autowired
	private ItemDao itemDao;
	
	public boolean writeStudio(Item item) {
		if(itemDao.insertItem(item)>0) {
			return true;
		}
		return false;
	}
	public boolean updateStudio(Item item) {
		if(itemDao.updateItem(item)>0) {
			return true;
		}
		return false;
	}
	public boolean updateReadCount(int itemNum) {
		if(itemDao.updateReadCount(itemNum)>0) {
			return true;
		}
		return false;
	}
	public boolean updateStock(int stock, int itemNum) {
		if(itemDao.updateStock(stock, itemNum)>0) {
			return true;
		}
		return false;
	}
	public boolean deleteStudio(int itemNum) {
		if(itemDao.deleteItem(itemNum)>0) {
			return true;
		}
		return false;
	}
	public Item getItemByNum(int itemNum) {
		return itemDao.selectItemByNum(itemNum);
	}
	public List<Item> getItemList(int pageNum) {
		List<Item> studioList = new ArrayList<Item>();
		studioList = itemDao.selectItemList(getStartRow(pageNum), getEndRow(pageNum));		
		return studioList;
	} 
	public List<Item> getAllItem() {
		return itemDao.selectAllItems();
	}
	public Map<String, Object> getPages(int pageNum){
		Map<String, Object> pages = new HashMap<String, Object>();
		pages.put("firstPage", getFirstPage(pageNum));
		pages.put("lastPage", getLastPage(pageNum));
		pages.put("totalPage", getTotalPage());
		return pages;
	}
	// 페이징 처리 메소드 
		private int getStartRow(int pageNum) {
			return (pageNum*NUM_OF_STUDIO_PER_PAGE)-(NUM_OF_STUDIO_PER_PAGE-1);
		}
		private int getEndRow(int pageNum) {
			return pageNum*NUM_OF_STUDIO_PER_PAGE;
		}
		private int getFirstPage(int pageNum) {
			return ((pageNum-1)/ NUM_OF_NAV_PAGE)*NUM_OF_NAV_PAGE +1 ;
		}
		private int getLastPage(int pageNum) {
			return getFirstPage(pageNum) + (NUM_OF_NAV_PAGE-1);
		}
		private int getTotalPage() {
			return (int)Math.ceil(itemDao.selectCount()/(double)NUM_OF_STUDIO_PER_PAGE);
		}

}
