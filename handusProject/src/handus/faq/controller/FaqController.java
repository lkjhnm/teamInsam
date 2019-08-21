package handus.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import handus.faq.service.FaqService;

@Controller
@RequestMapping("faq")
public class FaqController {
	
	@Autowired
	private FaqService service;
	
	@RequestMapping(value = "/faqShow", method = RequestMethod.GET)
	public String FAQShowForm() {
		System.out.println("123");
		return "faq/FaqMain";
	}
	
	
}
