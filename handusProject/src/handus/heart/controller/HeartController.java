package handus.heart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import handus.heart.service.IHeartService;
import handus.model.HeartStudio;

@Controller
@RequestMapping("/heart")
public class HeartController {
	@Autowired
	private IHeartService heartService;
	
	@ResponseBody
	@RequestMapping(value = "/onHeart", method = RequestMethod.POST)
	public boolean onHeart(HeartStudio hs) {
//		System.out.println("구독하기"+hs);
		if(heartService.onHeartStudio(hs)) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping(value = "/offHeart", method = RequestMethod.POST)
	public boolean offHeart(HeartStudio hs) {
//		System.out.println("구독취소"+hs);
		if(heartService.offHeartStudio(hs)) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping(value = "/chekHeart", method = RequestMethod.POST)
	public boolean checkHeart(HeartStudio hs) {
		// 회원번호 받아와서 해당 회원의 HS 리스트 반환 
		return heartService.isHeartStudio(hs);
	}
	
	@ResponseBody
	@RequestMapping("/countHeart")
	public int heartCount(int sNum) {
		return heartService.getCountHS(sNum);
	}
	
}
