package handus.heart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import handus.heart.service.HeartService;
import handus.model.HeartItem;
import handus.model.HeartStudio;

@Controller
@RequestMapping("/heart")
public class HeartController {
	@Autowired
	private HeartService heartService;
	
	@ResponseBody
	@RequestMapping(value = "/onHeartS", method = RequestMethod.POST)
	public boolean onHeart(HeartStudio hs) {
		if(heartService.onHeartStudio(hs)) {
			return true;
		}
		return false;
	}
	@ResponseBody
	@RequestMapping(value = "/offHeartS", method = RequestMethod.POST)
	public boolean offHeart(HeartStudio hs) {
		if(heartService.offHeartStudio(hs)) {
			return true;
		}
		return false;
	}
	@ResponseBody
	@RequestMapping(value = "/chekHeartS", method = RequestMethod.POST)
	public boolean checkHeart(HeartStudio hs) {
		return heartService.isHeartStudio(hs);
	}
	@ResponseBody
	@RequestMapping("/countHeartS")
	public int heartCount(int sNum) {
		return heartService.getCountHS(sNum);
	}
	// --------------------------------------------------------
	@ResponseBody
	@RequestMapping(value = "/onHeartI", method = RequestMethod.POST)
	public boolean onHeart(HeartItem hi) {
		if(heartService.onHeartItem(hi)) {
			return true;
		}
		return false;
	}
	@ResponseBody
	@RequestMapping(value = "/offHeartI", method = RequestMethod.POST)
	public boolean offHeart(HeartItem hi) {
		if(heartService.offHeartItem(hi)) {
			return true;
		}
		return false;
	}
	@ResponseBody
	@RequestMapping(value = "/chekHeartI", method = RequestMethod.POST)
	public boolean checkHeart(HeartItem hi) {
		return heartService.isHeartItem(hi);
	}
	@ResponseBody
	@RequestMapping("/countHeartI")
	public int heartCountI(int iNum) {
		return heartService.getCountHI(iNum);
	}
}
