package handus.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.dao.AuctionDao;
import handus.model.Auction;

@Service
public class AuctionService {
	
	@Autowired
	private AuctionDao auctionDao;
	
	public List<Auction> getAuctionList(){
		return auctionDao.selectAuctionList();
	}
}
