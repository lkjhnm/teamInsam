package handus.auction.controller;

import java.io.IOException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import handus.auction.service.AuctionService;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	private AuctionService auctionService;
	
	@RequestMapping(value="/list",method= RequestMethod.GET)
	public String auctionList(Model model) {
		model.addAttribute("auctionList",auctionService.getAuctionList());
		
		return "auction/auctionList";
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String auctionDetail(int a_pk,Model model) {
			
		model.addAttribute("auction",auctionService.getAuctionDetail(a_pk));
		
		return "auction/auctionDetail";
	}
	
	@RequestMapping(value="/img", method=RequestMethod.GET)
	public ResponseEntity<byte[]> auctionImage(int a_pk) throws IOException{
		HttpHeaders headers = new HttpHeaders();
		byte[] image = auctionService.getAuctionImages(a_pk);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(image,headers,HttpStatus.OK);
		return responseEntity;
	}
	
	@RequestMapping(value="/graph", method=RequestMethod.GET)
	@ResponseBody
	public String auctionGraph(int a_pk) {
		
		String graphData = auctionService.getAuctionGraphData(a_pk);
		return graphData;
	}
	
}
