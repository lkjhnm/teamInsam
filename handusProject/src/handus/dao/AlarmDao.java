package handus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AlarmDao {

	public List<Map<String,Object>> selectAlarmList(@Param("m_pk")int m_pk, @Param("readType")int readType);
}
