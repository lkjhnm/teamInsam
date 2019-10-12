package handus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MessageDao {
	// 채팅방 등록, 삭제(방번호), 리스트가져오기(회원번호) 
	public int insertMsgList(Map<String, Object> param);
	public int deleteMsgList(int ml_pk);
	public List<Map<String, Object>> getMessageList(int m_pk);
	public int updateReadList(String ml_num);
	public String isMessageList(int m_pk, int authorNum);
	
	
	// 메세지 등록, 삭제(채팅방삭제 시 방번호), 메세지 리스트(방번호) 
	public int insertMsgDetail(Map<String, Object> param);
	public int deleteMsgDetails(int md_ml_num);
	public List<Map<String, Object>> getMessages(String md_ml_num);
	public Map<String, Object> getMsg(int md_pk);
	

}
