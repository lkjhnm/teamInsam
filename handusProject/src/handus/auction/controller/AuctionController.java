package handus.auction.controller;

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
		
		return "auction/auctionDetail";
	}
}
