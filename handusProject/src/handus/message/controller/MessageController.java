package handus.message.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import handus.message.service.MessageService;

@Component
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/list")
	public String messageList(Model model, HttpSession session) {
		int m_pk = 144; // (int)session.getAttribute("m_pk");
		
		model.addAttribute("mNum", m_pk);
		
		
		return "message/messageList";
	}
	
	@RequestMapping("/chat")
	public String messageView(Model model, HttpSession session, String chatNum) {
		// 해당 채팅방 번호 -> 방번호를 가지고 채팅 내용 불러오기 (최근 시간 순 정렬) 
		int m_pk = 144; // (int)session.getAttribute("m_pk");
		
		model.addAttribute("me", m_pk);
		
		return "message/messageView";
	}
	
}
