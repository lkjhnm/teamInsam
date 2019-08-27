package handus.auction.batch;

import java.util.Date;

import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.NonTransientResourceException;
import org.springframework.batch.item.ParseException;
import org.springframework.batch.item.UnexpectedInputException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import handus.dao.AuctionDao;

@Component("itemReader")
@Scope("step")
public class AuctionItemReader implements ItemReader<Date>{

	@Autowired
	private AuctionDao auctionDao;
	
	@Override
	public Date read() throws Exception, UnexpectedInputException, ParseException, NonTransientResourceException {
		
		
		
		return null;
	}
}
