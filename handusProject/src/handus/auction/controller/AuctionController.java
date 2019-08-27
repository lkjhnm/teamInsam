package handus.auction.controller;

import org.springframework.http.MediaType;
import java.io.IOException;

import org.springframework.batch.core.JobParametersInvalidException;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import handus.auction.service.AuctionService;
import handus.model.AuctionGraph;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	private AuctionService auctionService;
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
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
	public String auctionGraph(AuctionGraph ag) {
		
		String graphData = auctionService.getAuctionGraphData(ag);
		return graphData;
	}
	
	@RequestMapping(value="/bidding",method=RequestMethod.POST
					,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String auctionBidding(AuctionGraph ag) {
		
		String dataAfterBid = auctionService.biddingAuction(ag);
		simpMessagingTemplate.convertAndSend("/subscribe/bidding/"+ag.getA_pk(), dataAfterBid);
		System.out.println(simpMessagingTemplate);
		return dataAfterBid;
	}
	
	@RequestMapping(value="/alarm", method=RequestMethod.GET)
	public String auctionAlarm(int a_pk,boolean a_end) {
		if(a_end) {
			simpMessagingTemplate.convertAndSend("/subscribe/alarm/"+a_pk, "경매종료");
		}else {
			simpMessagingTemplate.convertAndSend("/subscribe/alarm/"+a_pk, "1시간 남았습니다.");
		}
		return null;
	}
}
