package handus.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import handus.model.Auction;
import handus.model.AuctionGraph;
import handus.model.HandusImage;

public interface AuctionDao {
	
	public List<Auction> selectAuctionList(@Param("page")int page,@Param("type") String type);
	public Map<String,Object> selectAuction(int a_pk);
	public HandusImage selectAuctionImagePath(int ai_pk);
	public List<Integer> selectAuctionGraphData(int a_pk);
	public boolean insertBidding(AuctionGraph ag);
	public Date selectAuctionRegDate(int ag_pk);
	public List<HandusImage> selectImgListByA_pk(int a_pk);
	public int selectAuctionCount(@Param("type") String type);
	public int updateAuction(Auction auction);
}
