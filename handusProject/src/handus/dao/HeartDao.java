package handus.dao;

import java.util.List;

import handus.model.HeartStudio;

public interface HeartDao {
	public int insertHS(HeartStudio heart);
//	public int updatdHS(HeartStudio heart);
	public int deleteHS(HeartStudio heart);
//	public HeartStudio selectByMemberNum(int mNum);
	public int selectHSCount(int sNum);
	public int isHeartStudio(HeartStudio heart);
//	public List<HeartStudio> selectAllHsBymNum(int mNum);
}
