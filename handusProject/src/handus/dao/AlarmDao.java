package handus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AlarmDao {

	public List<Map<String,Object>> selectAlarmList(@Param("m_pk")int m_pk, @Param("readType")int readType);
	public boolean updateAlarm(int ua_pk);
	public Map<String,Object> selectAlarmInfo(@Param("pk") int pk,@Param("m_pk_writer") int m_pk_writer ,@Param("type") String type);
}
