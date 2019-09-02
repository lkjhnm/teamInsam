package handus.faq.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import handus.faq.service.FaqService;
import handus.model.FAQ;


public class FaqDataController {
	
	//디비에서 데이터 가져와야하는거면 데이터만 끌어오는 컨트롤러
	//json 형식으로 데이터 끌어오는 클래스 컨트롤러
	
	
	@Autowired
	private FaqService service;
	
	@ResponseBody
	@RequestMapping("/allFaq")
	public List<FAQ> allFaq(Model model) {
		List<FAQ> allFaq = service.getAllFaq();
		model.addAttribute("allFaq", allFaq);
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/faqWrite", method = RequestMethod.POST)
	public boolean writeFaq(FAQ faq) {
		
		return service.writeFaq(faq);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/faqModify", method = RequestMethod.POST)
	public boolean modifyFaq(Model model, FAQ faq) {
		System.out.println(faq);
		return service.modifyFaq(faq);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/faqDelete", method = RequestMethod.POST)
	public ResponseEntity<Boolean> deleteFaq(FAQ faq, int idNum) {
		ResponseEntity<Boolean> entity = null;
		boolean result = service.removeFaq(idNum);
		if(result) {
			//요청성공 응답
			entity = new ResponseEntity<Boolean>(result, HttpStatus.OK);
		}else {
			//요청실패 응답
			entity = new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
