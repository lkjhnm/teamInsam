package handus.heart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.dao.HeartDao;
import handus.model.HeartStudio;

@Service
public class HeartService implements IHeartService {
	@Autowired
	private HeartDao heartDao;

	@Override
	public boolean onHeartStudio(HeartStudio heart) {
		if(heartDao.insertHS(heart)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean offHeartStudio(HeartStudio heart) {
		if(heartDao.deleteHS(heart)>0) {
			return true;
		}
		return false;
	}

//	@Override
//	public boolean getHSBymNum(int mNum) {
//		if(heartDao.selectByMemberNum(mNum)!=null){
//			return true;
//		}
//		return false;
//	}
//
	@Override
	public int getCountHS(int sNum) {
		return heartDao.selectHSCount(sNum);
	}
	
	@Override
	public boolean isHeartStudio(HeartStudio heart) {
		if(heartDao.isHeartStudio(heart)>0) {
			return true;
		}
		return false;
	}

//	@Override
//	public List<HeartStudio> getHSListBymNum(int mNum) {
//		return heartDao.selectAllHsBymNum(mNum);
//	}

}
