package handus.dao;

import java.util.List;

import handus.model.Auction;

public interface AuctionDao {
	
	public List<Auction> selectAuctionList();
	
}
