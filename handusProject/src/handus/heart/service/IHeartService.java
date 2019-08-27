package handus.heart.service;

import java.util.List;

import handus.model.HeartStudio;

public interface IHeartService {
	public boolean onHeartStudio(HeartStudio heart);
	public boolean offHeartStudio(HeartStudio heart);
//	public boolean getHSBymNum(int mNum);
	public int getCountHS(int sNum);
	public boolean isHeartStudio(HeartStudio heart);
//	public List<HeartStudio> getHSListBymNum(int mNum);
}
