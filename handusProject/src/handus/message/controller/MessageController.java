package handus.message.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import handus.member.service.MemberService;
import handus.message.service.MessageService;

@Component
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageService messageService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/message")
	public String message(int authorNum, HttpSession session) {
		// 회원번호, 작가 번호 받아와서 해당 채팅 목록이 있는지 확인 
		int m_pk = (int)session.getAttribute("m_pk");
		
		String chatNum = messageService.isMessageList(m_pk, authorNum);
		
		System.out.println("컨트롤러 작가번호: "+authorNum);
		System.out.println("컨트롤러 방있음? "+chatNum);
		
		if(chatNum == null) {
			// 목록이 없으면 생성 후 보내줌 
			chatNum = messageService.createMessageList(authorNum, m_pk);
			System.out.println("컨트롤러 채팅방생성: "+chatNum);
		}
		
		return "redirect:chat?chatNum="+chatNum+"&yourId="+authorNum;
		
	}
	
	@RequestMapping("/list")
	public String messageList(Model model, HttpSession session) {
		int m_pk = (int)session.getAttribute("m_pk");
		model.addAttribute("myId", m_pk);
		return "message/messageList";
	}
	
	@RequestMapping("/drawList")
	@ResponseBody
	public List<Map<String, Object>> drawList(Model model, HttpSession session){
		int m_pk = (int)session.getAttribute("m_pk");
		
		List<Map<String, Object>> list = messageService.getListList(m_pk);
		System.out.println("컨트롤러:" +list);
		
		return list;
	}
	
	@RequestMapping("/chat")
	public String messageView(Model model, HttpSession session, String chatNum, String yourId) {
		// 필요한것 : 본인 pk, 상대 pk, 해당 방번호의 메세지 리스트 
		int m_pk = (int)session.getAttribute("m_pk");
		
		messageService.updateReadList(chatNum);
		
		model.addAttribute("myId", m_pk);
		model.addAttribute("yourID", yourId);
		int yourNum = Integer.parseInt(yourId);
		String yourName = memberService.getMemberByNum(yourNum).getM_name();
		model.addAttribute("yourName", yourName);
		model.addAttribute("chatNum", chatNum);
		
		// 해당 채팅방 번호에 해당하는 채팅 목록 리스트 
		List<Map<String, Object>> msgList = messageService.getMsgList(chatNum);
		model.addAttribute("msgList", msgList);
		
		return "message/messageView";
	}
	
	@RequestMapping("/read")
	@ResponseBody
	public boolean updateRead(String chatNum) {
		return messageService.updateReadList(chatNum);
	}
	
	@RequestMapping("/sendMsg")
	@ResponseBody
	public Map<String, Object> sendMsg(String m_pk, String msg, String chat_num) {
		
		// DB에 저장 
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("writer_pk", m_pk);
		param.put("content", msg);
		param.put("ml_num", chat_num);
		
		System.out.println("컨트롤러: "+param);
		
		if(messageService.writeMsg(param)) {
			SimpleDateFormat format = new SimpleDateFormat("MM월 dd일  a HH:mm");
			String sendTime = format.format(new Date());
			param.put("time", sendTime);
		}
		
		return param;
	}
	
	@Autowired
	private SimpMessagingTemplate template;
	
	@MessageMapping("/send{yourId}")
	@SendTo("/subscribe/send{yourId}")
	public Map<String, Object> sendMsg(String msg, 
			@DestinationVariable(value = "yourId")String yourId) {
		System.out.println("메세지 컨트롤러1: "+msg+", 수신인: "+yourId);
		
		// 시간, 메세지 담은 Map 생성 
		Map<String, Object> message = new HashMap<String, Object>();
		message.put("msg", msg);
		// 시간 생성 
		SimpleDateFormat format = new SimpleDateFormat("MM월 dd일  a HH:mm");
		String sendTime = format.format(new Date());
		message.put("time", sendTime);
		
		// 채팅방 리스트 재정렬 신호 
		template.convertAndSend("/subscribe/chatList{yourId}", true);
		
		System.out.println("메세지 컨트롤러2: "+message);
		
		return message;
	}
	
}
