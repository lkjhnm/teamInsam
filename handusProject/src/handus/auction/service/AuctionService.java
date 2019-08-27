package handus.auction.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersInvalidException;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import handus.dao.AuctionDao;
import handus.model.Auction;
import handus.model.AuctionGraph;

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
		String day  = (days  < 1 ) ? "" : days+"일 ";
        
		return day + hours + ":" + minutes + ":" + seconds;
	}
	
	public byte[] getAuctionImages(int a_pk) throws IOException {		//예외발생시 예외 이미지 주기
		Map<String, Object> imageMap = auctionDao.selectAuctionImagePath(1);
		String savePath = (String)imageMap.get("AI_SAVEPATH");
		String fileName = (String)imageMap.get("AI_FILENAME");
		byte[] bytes = FileUtils.readFileToByteArray(new File("c:/"+savePath,fileName));
		
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
	
	
}
