package handus.studio.service;

import java.util.List;
import java.util.Map;

import handus.model.Studio;


public interface IStudioService {
	public boolean writeStudio(Studio studio);
	public boolean updateStudio(Studio studio);
	public boolean deleteStudio(int stuNum);
	public Studio getStudioByNum(int stuNum);
	public List<Studio> getStudioList(int pageNum);
	public List<Studio> getAllStudio();
	public Map<String, Object> getPages(int pageNum);
}
