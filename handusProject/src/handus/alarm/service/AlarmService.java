package handus.alarm.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import handus.dao.AlarmDao;

@EnableAsync
@Service
public class AlarmService {
	
	@Autowired
	private AlarmDao alarmDao;
	
	public boolean readAlarm(int ua_pk) {
		return alarmDao.updateAlarm(ua_pk);
	}
	
	@Async
	public void alarmToUser(int m_pk_writer,int pk ,String type, SimpMessagingTemplate simp) {
		
		JsonObject object = new JsonObject();
		Map<String,Object> alarmInfo = alarmDao.selectAlarmInfo(pk, m_pk_writer, type);
		String name = (String)alarmInfo.get("AT_NAME");
		int hi_pk =((BigDecimal)alarmInfo.get("HI_PK")).intValue();
		switch(type) {
		case "auction":
			object.addProperty("title", "경매 알람");
			object.addProperty("type", 1);
			object.addProperty("content",name + "님 경매가 등록 되었습니다.");
			break;
		case "item":
			object.addProperty("title", "물품 알람");
			object.addProperty("type", 2);
			object.addProperty("content",name + "님 물품이 등록 되었습니다.");
			break;
		case "studio":
			object.addProperty("title", "수업 알람");
			object.addProperty("type", 3);
			object.addProperty("content",name + "님 수업이 등록 되었습니다.");
			break;
		}
		object.addProperty("pk", pk);
		object.addProperty("img",hi_pk);
		
		simp.convertAndSend("/subscribe/alarm/1/"+m_pk_writer,object.toString());
	}
	
	public List<Map<String,Object>> getAlarmMessage(int m_pk, int readType){
		List<Map<String,Object>> alarmList =alarmDao.selectAlarmList(m_pk, readType);
		makeMessage(alarmList);
		return alarmList;
	}
	
	private void makeMessage(List<Map<String,Object>> alarmList) {

		for(Map<String,Object> alarm : alarmList) {
			String name = (String)alarm.get("AT_NAME");
			int msg = ((BigDecimal)alarm.get("UA_MESSAGE")).intValue();
			
			switch(msg) {
			case 1:
				alarm.put("UA_MESSAGE", name+"님 물품이 등록되었습니다.");
				break;
			case 2:
				alarm.put("UA_MESSAGE", name+"님 경매가 등록되었습니다.");
				break;
			case 3:
				alarm.put("UA_MESSAGE", name+"님 수업이 등록되었습니다.");
				break;
			case 4:
				alarm.put("UA_MESSAGE", "구독한 경매가 시작되었습니다.");
				break;
			case 5:
				alarm.put("UA_MESSAGE", "구독한 경매가 종료되었습니다.");
				break;
			}
		}
	}
}
