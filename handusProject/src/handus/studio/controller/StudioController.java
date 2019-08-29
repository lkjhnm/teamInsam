package handus.studio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import handus.member.service.MemberService;
import handus.studio.service.IStudioService;

@Controller
@RequestMapping("/studio")
public class StudioController {
	@Autowired
	private IStudioService studioService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String studioList(Model model) {
		model.addAttribute("studioList",studioService.getAllStudio());
		// 대표 이미지 가져오기 
		
		return "studio/studioList";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String studioView(int num, Model model) {
		// 조회수 증가 
		if(studioService.updateReadCount(num)) {
			model.addAttribute("studio", studioService.getStudioByNum(num));
		}
		return "studio/studioView";
	}
}
