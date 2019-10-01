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
		
		
		return "message/messageList";
	}
	
}
