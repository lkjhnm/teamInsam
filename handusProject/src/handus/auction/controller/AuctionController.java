package handus.auction.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import handus.auction.service.AuctionService;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	private AuctionService auctionService;
	
	@RequestMapping(value="/list",method= RequestMethod.GET)
	public String showAuctionList(Model model) {
		model.addAttribute("auctionList",auctionService.getAuctionList());
		
		return "auction/auctionList";
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String showAuctionDetail(int a_pk,Model model) {
		
		long endDate = new Date(1566874800000l).getTime();
		long nowDate = new Date().getTime();
		
		model.addAttribute("remainTime",endDate-nowDate);
		model.addAttribute("remainTimeText", getRemainTime(endDate-nowDate));
		
		return "auction/auctionDetail";
	}
	
	private String getRemainTime(long remain){	
		long second = (remain/1000)%60;
		long minute = (remain/(1000*60))%60;
		long hour = (remain/(1000*60*60))%24;
		long days = (remain/(1000*60*60*24))%30;
		
        String hours = (hour < 10) ? "0" + hour : hour+"";
        String minutes = (minute < 10) ? "0" + minute : minute+"";
        String seconds = (second < 10) ? "0" + second : second+"";
		
		return days +"일 "+ hours + ":" + minutes + ":" + seconds;
	}
}
