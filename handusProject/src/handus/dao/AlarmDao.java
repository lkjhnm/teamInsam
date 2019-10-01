package handus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AlarmDao {

	public List<Map<String,Object>> getAlarmList(@Param("ua_fk") int ua_fk,@Param("ua_type")int type);
}
