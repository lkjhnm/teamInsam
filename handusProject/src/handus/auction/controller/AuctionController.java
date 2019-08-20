package handus.auction.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	@RequestMapping(value="/list",method= RequestMethod.GET)
	public String showAuctionList() {	
		return "auction/auctionList";
	}

}
