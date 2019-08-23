package handus.auction.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import handus.dao.AuctionDao;
import handus.model.Auction;

@Service
public class AuctionService {
	
	@Autowired
	private AuctionDao auctionDao;
	
	public List<Auction> getAuctionList(){
		return auctionDao.selectAuctionList();
	}
	
	public Auction getAuctionDetail(int a_pk) {
		Auction auction = auctionDao.selectAuction(a_pk);
		auction.setA_remain(auction.getA_endTime().getTime() - new Date().getTime());
		auction.setA_remainText(getRemainTime(auction.getA_remain()));
		
		return auction;
	}
	
	private String getRemainTime(long remain){	
		long second = (remain/1000)%60;
		long minute = (remain/(1000*60))%60;
		long hour = (remain/(1000*60*60))%24;
		long days = (remain/(1000*60*60*24))%30;
		
        String hours = (hour < 10) ? "0" + hour : hour+"";
        String minutes = (minute < 10) ? "0" + minute : minute+"";
        String seconds = (second < 10) ? "0" + second : second+"";
		
		return days +"일 "+ hours + ":" + minutes + ":" + seconds;
	}
	
	public byte[] getAuctionImages(int a_pk) throws IOException {		//예외발생시 예외 이미지 주기
		Map<String, Object> imageMap = auctionDao.selectAuctionImagePath(1);
		String savePath = (String)imageMap.get("AI_SAVEPATH");
		String fileName = (String)imageMap.get("AI_FILENAME");
		byte[] bytes = FileUtils.readFileToByteArray(new File("c:/"+savePath,fileName));
		
		return bytes;
	}
	
	public String getAuctionGraphData(int a_pk) {
		List<Integer> graphData = auctionDao.selectAuctionGraphData(a_pk);
		
		Gson gson = new Gson();
		List<JsonObject> objectList = new ArrayList<>();
		
		for(int i=0; i<graphData.size(); i++) {
			JsonObject object = new JsonObject();
			if(i == 0) {
				object.addProperty("markerType","cross");
			}else if(i == graphData.size()-1) {
				object.addProperty("markerType", "triangle");
			}else {
				object.addProperty("markerType", "none");
			}
			object.addProperty("x", i+1);
			object.addProperty("y", graphData.get(i));
			objectList.add(object);
		}
		return gson.toJson(objectList);
	}
}
