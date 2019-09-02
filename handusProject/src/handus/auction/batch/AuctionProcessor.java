package handus.auction.batch;


import java.util.Date;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import handus.auction.service.AuctionService;
import handus.model.Auction;

@Component
@Scope("step")
public class AuctionProcessor implements ItemProcessor<Auction, Auction>{

	final long anHour = 3600000l;	 
	
	@Autowired
	private AuctionService auctionService;
	
	@Override
	public Auction process(Auction item) throws Exception{		//알람 여부를 확인하여 알려줌, 옥션 번호와 경매종료 여부
		HttpClient  httpClient = HttpClients.createDefault();
		
		long remainTime = item.getA_endTime().getTime() - new Date().getTime();
		
		if(remainTime < 0 && !item.isA_end()) {
			item.setA_end(true);
			HttpGet get = new HttpGet("http://localhost:8081/handusProject/auction/alarm?a_pk=" + item.getA_pk()+"&a_end="+item.isA_end());
			httpClient.execute(get);
			int endprice = auctionService.getAuctionEndPrice(item.getA_pk());
			item.setA_endPrice(endprice);
			
			return item;
		}else if((remainTime > 0 && remainTime < anHour) && !item.isA_alarm()) {
			item.setA_alarm(true);
			HttpGet get = new HttpGet("http://localhost:8081/handusProject/auction/alarm?a_pk="+item.getA_pk()+"&a_end="+item.isA_end());
			httpClient.execute(get);
			return item;
		}
		
		return null;
	}
}
