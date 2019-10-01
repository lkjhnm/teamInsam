package handus.studio.controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import handus.member.service.MemberService;
import handus.heart.service.HeartService;
import handus.model.HeartStudio;
import handus.model.Studio;
import handus.studio.service.StudioService;

@Controller
@RequestMapping("/studio")
public class StudioController {
	@Autowired
	private StudioService studioService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private HeartService heartService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String studioList(Model model, HttpSession session, 
			@RequestParam(defaultValue = "all") String type,
			@RequestParam(defaultValue = "1")int page ) {
		
		// 필요 정보 : 이미지, 게시글 이름, 게시글 번호, 해당 게시글 구독 여부 
		List<Studio> studioList = studioService.getStudioList(page, type);
		Map<String, Object> pageInfo = studioService.getPageInfo(page, type);
		
		model.addAttribute("studioList", studioList);
		model.addAllAttributes(pageInfo);
		return "studio/studioList";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String studioView(int num, Model model, HttpSession session) {
		// 조회수 증가 
		// 조회수 증복 증가 방지 (쿠키) 
		if(studioService.updateReadCount(num)) {
			model.addAttribute("studio", studioService.getStudioByNum(num));
			int m_pk = 222; //(int)session.getAttribute("m_pk");
			model.addAttribute("m_pk", m_pk);
		}
		return "studio/studioView";
	}
	
	@ResponseBody
	@RequestMapping(value = "/weather", method = RequestMethod.POST)
	public String getWeather(String cityName) {
		System.out.println("컨트롤러>날씨조회");
		return studioService.getWeather(cityName);
	}
}
