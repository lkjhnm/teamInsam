package handus.heart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.dao.HeartDao;
import handus.model.HeartItem;
import handus.model.HeartStudio;

@Service
public class HeartService {
	@Autowired
	private HeartDao heartDao;

	public boolean onHeartStudio(HeartStudio heart) {
		if(heartDao.insertHS(heart)>0) {
			return true;
		}
		return false;
	}
	public boolean offHeartStudio(HeartStudio heart) {
		if(heartDao.deleteHS(heart)>0) {
			return true;
		}
		return false;
	}
	public int getCountHS(int sNum) {
		return heartDao.selectHSCount(sNum);
	}
	public boolean isHeartStudio(HeartStudio heart) {
		if(heartDao.isHeartStudio(heart)>0) {
			return true;
		}
		return false;
	}
// ----------------------------------------------------------------------
	public boolean onHeartItem(HeartItem heart) {
		if(heartDao.insertHI(heart)>0) {
			return true;
		}
		return false;
	}
	public boolean offHeartItem(HeartItem heart) {
		if(heartDao.deleteHI(heart)>0) {
			return true;
		}
		return false;
	}
	public int getCountHI(int iNum) {
		return heartDao.selectHICount(iNum);
	}
	public boolean isHeartItem(HeartItem heart) {
		if(heartDao.isHeartItem(heart)>0) {
			return true;
		}
		return false;
	}
}
