package handus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MessageDao {
	// 채팅방 등록, 삭제(방번호), 리스트가져오기(회원번호) 
	public int insertMsgList(Map<String, Object> param);
	public int deleteMsgList(int ml_pk);
	public List<Map<String, Object>> getMessageList(@Param("m_pk")int m_pk, @Param("ml_num")String ml_num);
	
	
	
	// 메세지 등록, 삭제(채팅방삭제 시 방번호), 메세지 리스트(방번호) 
	public int insertMsgDetail(Map<String, Object> param);
	public int deleteMsgDetails(int md_ml_num);
	public List<Map<String, Object>> getMessages(int md_ml_num);
}
