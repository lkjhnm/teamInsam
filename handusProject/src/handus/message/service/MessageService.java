package handus.message.service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.dao.MemberDao;
import handus.dao.MessageDao;

@Service
public class MessageService {
	@Autowired
	private MessageDao messageDao;
	@Autowired
	private MemberDao memberDao;
	
	public List<Map<String, Object>> getListList(int m_pk){
		System.out.println("서비스: "+m_pk);
		
		List<Map<String, Object>> list = messageDao.getMessageList(m_pk);
		
		// 현재 회원 번호... 랑 반대되는 회원의 이름 가져와서 같이 저장하기 
		for(int i = 0; i < list.size(); i++) {
			
			int authorPk = ((BigDecimal)(list.get(i).get("ML_A_PK"))).intValue();
			int memPk = ((BigDecimal)(list.get(i).get("ML_M_PK"))).intValue();
			
			if(m_pk == authorPk) {
				String name = memberDao.selectByNum(memPk).getM_name();
				list.get(i).put("your_name", name);
				list.get(i).put("your_id", memPk);
			}else if(m_pk == memPk) {
				String name = memberDao.selectByNum(authorPk).getM_name();
				list.get(i).put("your_name", name);
				list.get(i).put("your_id", authorPk);
			}
			
			Date date = (Date)list.get(i).get("ML_UPDATE_DATE");
			SimpleDateFormat format = new SimpleDateFormat("MM월 dd일");
			String sendTime = format.format(date);
			list.get(i).put("ML_UPDATE_DATE", sendTime);
			
		}
		
		return list;
	}
	
	public boolean writeMsg(Map<String, Object> param) {
		if(messageDao.insertMsgDetail(param)>0) {
			return true;
		}
		return false;
	}
	
	public Map<String, Object> getMsg(int md_pk){
		Map<String, Object> msg = messageDao.getMsg(md_pk);
		// 시간 포맷 변환 
		Date date = (Date)msg.get("MD_WRITEDATE");
		msg.put("MD_WRITEDATE", getTime(date));
		
		System.out.println("서비스: "+msg);
		
		return msg;
	}
	
	public List<Map<String, Object>> getMsgList(String chatNum){
		List<Map<String, Object>> list = messageDao.getMessages(chatNum);
		
		for(int i = 0; i < list.size(); i ++) {
			Date date = (Date)list.get(i).get("MD_WRITEDATE");
			list.get(i).put("MD_WRITEDATE", getTime(date));
		}
		
		return list;
	}
	
	public boolean updateReadList(String chatNum, int m_pk) {
		if(messageDao.updateReadList(chatNum, m_pk)>0) {
			return true;
		}
		return false;
	}
	
	public String isMessageList(int m_pk, int authorNum) {
		return messageDao.isMessageList(m_pk, authorNum);
	}
	
	public String createMessageList(int authorNum, int m_pk) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ml_m_pk", m_pk);
		param.put("ml_a_pk", authorNum);
		int r = messageDao.insertMsgList(param);
		
		System.out.println("서비스: "+(String)param.get("ml_num"));
		
		return null;
		
	}
	
	
	private String getTime(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("MM월 dd일  a HH:mm");
		String sendTime = format.format(date);
		return sendTime;
	}
	
}
