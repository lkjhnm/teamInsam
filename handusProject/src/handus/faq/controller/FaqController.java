package handus.faq.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import handus.faq.service.FaqService;
import handus.model.FAQ;

@Controller
@RequestMapping("faq")
public class FaqController {
	
	
	//화면 url, 맵핑하는 컨트롤러
	
	@Autowired
	private FaqService service;
	
	//faqMain 화면요청
	@RequestMapping(value = "/faqShow")
	public String FAQShowForm() {
		System.out.println("123");
		return "faq/FaqWrite"; //원래는 main
	}
	
	//faqList 정보 불러오기
	@RequestMapping(value = "/faqList", method = RequestMethod.POST)
	@ResponseBody
	public String FAQListForm(Model model,RedirectAttributes ra) {
		List<FAQ> faqList = service.getAllFaq();
		
		Gson gson  = new Gson();
		gson.toJson(faqList);
		return gson.toString();
	}
	
	//faq 리스트 목록 요청 : category에 해당하는 글 목록 가져오기
	@RequestMapping(value = "/all/{category}", method = RequestMethod.GET)
	public List<FAQ> getFAQList(@RequestParam("category")int category){
			System.out.println("456");
			return service.getListByFaq(category);
		}
	
	
	//등록(입력)요청
	@RequestMapping(value = "/faqWrite", method = RequestMethod.POST)
	public String FAQWriteForm(FAQ faq) {
		service.writeFaq(faq);
		return "redirect:faq/FaqWr"; //
	}
	
	//수정 요청
	@RequestMapping(value = "/faqModify", method = RequestMethod.POST)
	public String FAQUpdateForm(Model model,int idNum) {
		FAQ faq = service.getFaq(idNum);
		model.addAttribute("faqModify", faq);
		
		return "redirect:faq/FaqMain";
	}
	
	
	
	
	
	
}
