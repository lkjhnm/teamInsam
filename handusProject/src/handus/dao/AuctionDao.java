package handus.dao;

import java.util.List;
import java.util.Map;

import handus.model.Auction;

public interface AuctionDao {
	
	public List<Auction> selectAuctionList();
	public Auction selectAuction(int a_pk);
	public Map<String,Object> selectAuctionImagePath(int a_pk);
	public List<Integer> selectAuctionGraphData(int a_pk);
}
