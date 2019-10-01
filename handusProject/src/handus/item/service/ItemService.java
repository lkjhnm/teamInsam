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
//	private static int NUM_OF_STUDIO_PER_PAGE = 6;
//	private static int NUM_OF_NAV_PAGE =5;
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
	
	
	// 리스트 
		public List<Item> getStudioList(int page, String type) {
			List<Item> itemList = itemDao.selectItemList(page, type);		
			return itemList;
		} 
		
	// 페이지 정보 
	public Map<String, Object> getPageInfo(int page, String type){
		// count = 검색결과(카테고리)에 맞는 총 게시글 갯수 
		int count = itemDao.selectCount(type);
		return calPageInfo(count, page, type);
	}
	private Map<String, Object> calPageInfo(int count, int page, String type){
		int totalPage = (int)Math.ceil(count/6.0);
		int startPage = 0;
		int endPage = 0;
		
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		// 한 페이지에 표시할 리스트 갯수, 네비게이션 바 표시 갯수를 따로 저장하지 않고 
		// 현재 페이지가 가운데에 오도록 설정 (
		// 현재 5개 = 현재 페이지 앞 뒤로 2개씩 보여줌 
		if(page < 4) {
			// 1, 2 일 때는 가운데 올 수 없음 
			startPage = 1;
			if(totalPage < 6) {
				endPage = totalPage;
			}else {
				endPage = 5;
			}
		}else if (page >= 4 && page < totalPage - 2) {
			// 3부터 가운데에 오도록 표시, 총 페이지의 2번째 전까지 
			// (앞 뒤로 2개씩만 보여줌) 
			startPage = page - 2;
			endPage = page + 2;
		}else {
			// 끝에서 1,2 번째 페이지는 가운데 올 수 없음 
			startPage = totalPage - 4;
			endPage = totalPage;
		}
		
		pageInfo.put("startPage", startPage);
		pageInfo.put("endPage", endPage);
		pageInfo.put("totalPage", totalPage);
		pageInfo.put("curPage", page);
		pageInfo.put("type", type);
		
		return pageInfo;
	}
	
	
	// 페이징 처리 메소드 
//		private int getStartRow(int pageNum) {
//			return (pageNum*NUM_OF_STUDIO_PER_PAGE)-(NUM_OF_STUDIO_PER_PAGE-1);
//		}
//		private int getEndRow(int pageNum) {
//			return pageNum*NUM_OF_STUDIO_PER_PAGE;
//		}
//		private int getFirstPage(int pageNum) {
//			return ((pageNum-1)/ NUM_OF_NAV_PAGE)*NUM_OF_NAV_PAGE +1 ;
//		}
//		private int getLastPage(int pageNum) {
//			return getFirstPage(pageNum) + (NUM_OF_NAV_PAGE-1);
//		}
//		private int getTotalPage() {
//			return (int)Math.ceil(itemDao.selectCount()/(double)NUM_OF_STUDIO_PER_PAGE);
//		}

}
