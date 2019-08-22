package handus.studio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import handus.member.service.IMemberService;
import handus.studio.service.IStudioService;

@Controller
@RequestMapping("/studio")
public class StudioController {
	@Autowired
	private IStudioService studioService;
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String studioList(Model model) {
		model.addAttribute("studioList",studioService.getAllStudio());
		// 대표 이미지 가져오기 
		
		return "studio/studioList";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String studioView(int num, Model model) {
		model.addAttribute("studio", studioService.getStudioByNum(num));
		// 작가 정보 가져오기 
		int writerNum = studioService.getStudioByNum(num).getM_pk_writer();
		model.addAttribute("member", memberService.getMemberByNum(writerNum));
		return "studio/studioView";
	}
}
