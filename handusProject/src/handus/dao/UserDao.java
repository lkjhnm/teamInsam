package handus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface UserDao {
	
	public boolean insertSubscribe(Map<String,Object> subsInfo);
	public Map<String,Object> selectSubscribe(Map<String,Object> subsInfo);
	public int deleteSubscribe(Map<String,Object> subsInfo);
	public List<Map<String,Object>> selectSubsListData(@Param("type") int type, @Param("m_pk_user") int m_pk_user);
	public Map<String,Object> selectUserByPk(int m_pk);
	public boolean updateUserInfo(Map<String,Object> userInfo);
}
