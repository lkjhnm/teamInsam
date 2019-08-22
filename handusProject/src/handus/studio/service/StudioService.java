package handus.studio.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.dao.StudioDao;
import handus.model.Studio;

@Service
public class StudioService implements IStudioService {
	public static int NUM_OF_STUDIO_PER_PAGE = 6;
	public static int NUM_OF_NAV_PAGE =5;
	@Autowired
	private StudioDao studioDao;
	
	@Override
	public boolean writeStudio(Studio studio) {
		if(studioDao.insertStudio(studio)>0) {
			return true;
		}
		return false;
	}
	@Override
	public boolean updateStudio(Studio studio) {
		if(studioDao.updateStudio(studio)>0) {
			return true;
		}
		return false;
	}
	@Override
	public boolean deleteStudio(int stuNum) {
		if(studioDao.deleteStudio(stuNum)>0) {
			return true;
		}
		return false;
	}
	@Override
	public Studio getStudioByNum(int stuNum) {
		return studioDao.selectStudioByNum(stuNum);
	}
	@Override
	public List<Studio> getStudioList(int pageNum) {
		List<Studio> studioList = new ArrayList<Studio>();
		studioList = studioDao.selectStudioList(getStartRow(pageNum), getEndRow(pageNum));		
		return studioList;
	} 
	@Override
	public List<Studio> getAllStudio() {
		return studioDao.selectAllStudio();
	}
	@Override
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
		return (int)Math.ceil(studioDao.selectCount()/(double)NUM_OF_STUDIO_PER_PAGE);
	}
}
