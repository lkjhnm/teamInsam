package handus.alarm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.dao.AlarmDao;

@Service
public class AlarmService {
	
	@Autowired
	private AlarmDao alarmDao;
	
	public List<Map<String,Object>> getAlarmMessage(int m_pk, int readType){
		return alarmDao.selectAlarmList(m_pk, readType);
	}
}
