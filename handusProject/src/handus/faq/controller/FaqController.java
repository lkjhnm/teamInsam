package handus.faq.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
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
		return "faq/FaqMain"; //원래는 main
	}
	
//	@RequestMapping(value = "/slist", method = RequestMethod.GET)
//	public String FAQList(Model model) {
//		
//	}
	
	
	//faqList 정보 불러오기
	@RequestMapping(value = "/faqList", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String FAQListForm(Model model,RedirectAttributes ra,@DateTimeFormat(pattern="yyyy-MM-dd") Date fromDate) {
		List<FAQ> faqList = service.getAllFaq();
//		System.out.println(faqList.toString());
		Gson gson  = new Gson();
		String json = gson.toJson(faqList);
		System.out.println(faqList);
		return json;
	}
		
	
	//등록(입력)요청
	@RequestMapping(value = "/faqWrite", method = RequestMethod.POST)
	public String FAQWriteForm(FAQ faq) {
		service.writeFaq(faq);
		return "redirect:faq/FaqWrite"; //
	}
	
	//수정 요청
	@RequestMapping(value = "/faqModify", method = RequestMethod.POST)
	public String FAQUpdateForm(Model model,int idNum) {
		FAQ faq = service.getFaq(idNum);
		model.addAttribute("faqModify", faq);
		
		return "redirect:faq/FaqMain";
	}
	
	
	
	
	
	
}
