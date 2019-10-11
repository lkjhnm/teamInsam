package handus.auction.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import handus.dao.AuctionDao;
import handus.model.Auction;
import handus.model.AuctionGraph;
import handus.model.HandusImage;

@Service
public class AuctionService {
	
	@Autowired
	private AuctionDao auctionDao;
	
		
	public List<Auction> getAuctionList(int page,String type){
		return auctionDao.selectAuctionList(page,type);
	}
	
	public Map<String,Object> getPageInfo(int page,String type){
		int count = auctionDao.selectAuctionCount(type);
		return calPageInfo(count, page,type);
	}
	
	private Map<String,Object> calPageInfo(int count, int page,String type){
		int totalPage = (int)Math.ceil(count/6.0);
		int startPage = 0;
		int endPage = 0;
		Map<String,Object> pageInfo = new HashMap<>();
		
		
		if(page < 4) {
			startPage = 1;
			if(totalPage < 6) {
				endPage = totalPage;
			}else {
				endPage = 5;
			}
		}else if(page >= 4 && page < totalPage - 2) {
			startPage = page - 2;
			endPage = page + 2;
		}else {
			startPage = totalPage-4;
			endPage = totalPage;
		}
		
		pageInfo.put("startPage",startPage);
		pageInfo.put("endPage",endPage);
		pageInfo.put("total",totalPage);
		pageInfo.put("curPage",page);
		pageInfo.put("type",type);
		
		return pageInfo;
	}
	
	public Auction getAuctionDetail(int a_pk) {
		Auction auction = auctionDao.selectAuction(a_pk);
		auction.setA_remain(auction.getA_endTime().getTime() - new Date().getTime());
		auction.setA_remainText(getRemainTime(auction.getA_remain()));
		
		return auction;
	}
	
	public List<HandusImage> getAuctionImg(int a_pk) {
		return auctionDao.selectImgListByA_pk(a_pk);
	}
	
	private String getRemainTime(long remain){	
		long second = (remain/1000)%60;
		long minute = (remain/(1000*60))%60;
		long hour = (remain/(1000*60*60))%24;
		long days = (remain/(1000*60*60*24))%30;
		
        String hours = (hour < 10) ? "0" + hour : hour+"";
        String minutes = (minute < 10) ? "0" + minute : minute+"";
        String seconds = (second < 10) ? "0" + second : second+"";
		String day  = (days  < 1 ) ? "" : days+"일 ";
        
		return day + hours + ":" + minutes + ":" + seconds;
	}
	
	public byte[] getAuctionImages(int ai_pk) throws IOException {		//예외발생시 예외 이미지 주기
		HandusImage image = auctionDao.selectAuctionImagePath(ai_pk);
		String savePath = image.getImg_savePath();
		String fileName = image.getImg_fileName();
		
		if(fileName == null) {
			return null;
		}
		byte[] bytes = FileUtils.readFileToByteArray(new File(savePath,fileName));
		
		return bytes;
	}
	
	public String getAuctionGraphData(AuctionGraph ag) {
		Gson gson = new Gson();
		List<JsonObject> objectList = new ArrayList<>();
		
		makeGraphData(objectList,ag.getA_pk());
		
		return gson.toJson(objectList);
	}
	
	
	public String biddingAuction(AuctionGraph ag) {
		
		List<Integer> graphData = auctionDao.selectAuctionGraphData(ag.getA_pk());
		int lastData = graphData.get(graphData.size()-1);
		
		Gson gson = new Gson();
		List<JsonObject> objectList = new ArrayList<>();
		
		if(ag.getAg_bidding() > lastData) {
			boolean result = auctionDao.insertBidding(ag);
			Date regDate =  auctionDao.selectAuctionRegDate(ag.getAg_pk());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm 입찰");
			
			JsonObject object = new JsonObject();
			object.addProperty("result", result);
			object.addProperty("regDate", sdf.format(regDate));
			objectList.add(object);
			
			if(result) {
				makeGraphData(objectList,ag.getA_pk());
			}else {
				object.addProperty("msg", "서버상의 오류로 입찰에 실패했습니다.");
			}
		}else {
			JsonObject object = new JsonObject();
			object.addProperty("result", false);
			object.addProperty("msg", "최고가 보다 낮은 금액은 입찰이 불가능합니다.");
			objectList.add(object);
		}
		
		return gson.toJson(objectList);
	}
	
	public int getAuctionEndPrice(int a_pk){
		List<Integer> graphData = auctionDao.selectAuctionGraphData(a_pk);
		return graphData.get(graphData.size() - 1);
	}
	
	private void makeGraphData(List<JsonObject> objectList, int a_pk){
		
		List<Integer> graphData = auctionDao.selectAuctionGraphData(a_pk);
		for(int i=0; i<graphData.size(); i++) {
			JsonObject object = new JsonObject();
			if(i == 0) {
				object.addProperty("markerType","triangle");
			}else if(i == graphData.size()-1) {
				object.addProperty("markerType", "cross");
			}else {
				object.addProperty("markerType", "none");
			}
			object.addProperty("x", i+1);
			object.addProperty("y", graphData.get(i));
			objectList.add(object);
		}
	}
	
	public boolean modifyAuction(Auction auction) {
		if(auctionDao.updateAuction(auction)>0) {
			return true;
		}
		return false;
	}
	
	
}
