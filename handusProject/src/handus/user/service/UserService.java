package handus.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	public boolean userSubscribeSomething(int type, int ms_fk,int m_pk_user){		//구독자 수 증가 추가요망
		Map<String,Object> subsInfo = new HashMap<>();
		subsInfo.put("ms_type",type);
		subsInfo.put("ms_fk",ms_fk);
		subsInfo.put("m_pk_user",m_pk_user);
		
		return userDao.insertSubscribe(subsInfo);
	}
	
	public boolean userSubscribeCheck(int type, int ms_fk, int m_pk_user) {
		Map<String,Object> subsInfo = new HashMap<>();
		subsInfo.put("ms_type",type);
		subsInfo.put("ms_fk",ms_fk);
		subsInfo.put("m_pk_user",m_pk_user);
		
		return userDao.selectSubscribe(subsInfo) != null ? true : false;
	}
	
	public boolean userSubscribeCancel(int type,int ms_fk, int m_pk_user) {
		Map<String,Object> subsInfo = new HashMap<>();
		subsInfo.put("ms_type",type);
		subsInfo.put("ms_fk",ms_fk);
		subsInfo.put("m_pk_user",m_pk_user);
		
		return userDao.deleteSubscribe(subsInfo) == 1 ? true :false;
	}
	
	public List<Map<String,Object>> userSubscribeList(int type,int m_pk_user){
		return userDao.selectSubsListData(type, m_pk_user);
	}
	public List<Map<String,Object>> userSubscribeListAll(int m_pk_user){
		return userDao.selectSubsListAll(m_pk_user);
	}
	
	public Map<String,Object> getUserInfo(int m_pk){
		return userDao.selectUserByPk(m_pk);
	}
	
	public boolean updateUserInfo(Map<String,Object> userInfo) {
		return userDao.updateUserInfo(userInfo);
	}
	
	public List<Map<String,Object>> getWinningBid(int m_pk){
		return userDao.selectWinningBid(m_pk);
	}
	public List<Map<String,Object>> getPayedItemList(int m_pk){
		return userDao.selectPayedItem(m_pk);
	}
	public List<Map<String,Object>> getPayedStudioList(int m_pk){
		return userDao.selectPayedStudio(m_pk);
	}
}
