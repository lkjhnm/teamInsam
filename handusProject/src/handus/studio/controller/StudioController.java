package handus.studio.controller;

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

import handus.member.service.MemberService;
import handus.heart.service.IHeartService;
import handus.model.HeartStudio;
import handus.model.Studio;
import handus.studio.service.IStudioService;

@Controller
@RequestMapping("/studio")
public class StudioController {
	@Autowired
	private IStudioService studioService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private IHeartService heartService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String studioList(Model model, HttpSession session) {
		// 필요 정보 : 이미지, 게시글 이름, 게시글 번호, 해당 게시글 구독 여부 
		List<Studio> list = studioService.getAllStudio();
		List<Map<String, Object>> studioList = new ArrayList<Map<String,Object>>();
		for(int i = 0; i < list.size(); i++) {
			Map<String, Object> studioInfo = new HashMap<String, Object>();
			studioInfo.put("image", "");
			studioInfo.put("title", list.get(i).getS_title());
			studioInfo.put("num", list.get(i).getS_pk());
			HeartStudio heart = new HeartStudio();
			heart.setHs_m_pk(1);	// 세션에서 로그인 회원 번호 받아오기 
			heart.setHs_s_pk(list.get(i).getS_pk());
			studioInfo.put("isHeart", heartService.isHeartStudio(heart));
			studioList.add(studioInfo);
		}
		model.addAttribute("studioList", studioList);
		return "studio/studioList";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String studioView(int num, Model model) {
		// 조회수 증가 
		// 조회수 증복 증가 방지 (쿠키) 
		if(studioService.updateReadCount(num)) {
			model.addAttribute("studio", studioService.getStudioByNum(num));
		}
		return "studio/studioView";
	}
}
