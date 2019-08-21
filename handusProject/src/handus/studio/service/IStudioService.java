package handus.studio.service;

import java.util.List;

import handus.model.Studio;


public interface IStudioService {
	public boolean writeStudio(Studio studio);
	public boolean updateStudio(Studio studio);
	public boolean deleteStudio(int stuNum);
	public Studio getStudioByNum(int stuNum);
	public List<Studio> getStudioList(int pageNum);
}
