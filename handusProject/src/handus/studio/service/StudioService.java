package handus.studio.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

import handus.dao.StudioDao;
import handus.model.Studio;

@Service
public class StudioService {
	private static int NUM_OF_STUDIO_PER_PAGE = 6;
	private static int NUM_OF_NAV_PAGE =5;
	private final String APIKEY = "7e26974c4a4c512ba8e98faf7b1be665";
	private String cityID; 
	private String weatherURL;
	@Autowired
	private StudioDao studioDao;
	
	public boolean writeStudio(Studio studio) {
		if(studioDao.insertStudio(studio)>0) {
			return true;
		}
		return false;
	}
	public boolean updateStudio(Studio studio) {
		if(studioDao.updateStudio(studio)>0) {
			return true;
		}
		return false;
	}
	public boolean deleteStudio(int stuNum) {
		if(studioDao.deleteStudio(stuNum)>0) {
			return true;
		}
		return false;
	}
	public Studio getStudioByNum(int stuNum) {
//		System.out.println(studioDao.selectStudioByNum(stuNum).getC_category());
		return studioDao.selectStudioByNum(stuNum);
	}
	public List<Map<String,Object>> getStudioImage(int s_pk){
		return studioDao.selectStudioImage(s_pk);
	}
	
	public List<Studio> getStudioList(int pageNum) {
		List<Studio> studioList = new ArrayList<Studio>();
		studioList = studioDao.selectStudioList(getStartRow(pageNum), getEndRow(pageNum));		
		return studioList;
	} 
	public List<Studio> getAllStudio() {
		return studioDao.selectAllStudio();
	}
	public Map<String, Object> getPages(int pageNum){
		Map<String, Object> pages = new HashMap<String, Object>();
		pages.put("firstPage", getFirstPage(pageNum));
		pages.put("lastPage", getLastPage(pageNum));
		pages.put("totalPage", getTotalPage());
		return pages;
	}
	
	// 페이징 처리 메소드 
	private int getStartRow(int pageNum) {
		return (pageNum*NUM_OF_STUDIO_PER_PAGE)-(NUM_OF_STUDIO_PER_PAGE-1);
	}
	private int getEndRow(int pageNum) {
		return pageNum*NUM_OF_STUDIO_PER_PAGE;
	}
	private int getFirstPage(int pageNum) {
		return ((pageNum-1)/ NUM_OF_NAV_PAGE)*NUM_OF_NAV_PAGE +1 ;
	}
	private int getLastPage(int pageNum) {
		return getFirstPage(pageNum) + (NUM_OF_NAV_PAGE-1);
	}
	private int getTotalPage() {
		return (int)Math.ceil(studioDao.selectCount()/(double)NUM_OF_STUDIO_PER_PAGE);
	}

	public boolean updateReadCount(int studNum) {
		if(studioDao.updateReadCount(studNum)>0) {
			return true;
		}
		return false;
	}
	
	// 날씨 API 사용하기 
	public String getWeather(String cityName) {
		System.out.println("cityName: "+cityName);
//		weatherURL = "https://api.openweathermap.org/data/2.5/climate/month?";
//		weatherURL += "id=" + this.cityID;
//		weatherURL += "q=" + cityName;
//		weatherURL += "&appid=" + APIKEY;
		weatherURL = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Seoul&mode=json&units=metric&cnt=16&APPID=7e26974c4a4c512ba8e98faf7b1be665";
		System.out.println("요청 url: "+weatherURL);
		String jsonData = null;
		try {
			// url로 요청 보내기 
			URL url = new URL(weatherURL);
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			// 응답 받기 
			BufferedReader reader = null;
			int responseCode = connection.getResponseCode();
			System.out.println("응답코드:"+responseCode);
			if(responseCode==200) {
				reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			}else {
				reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			String readLine = "";
			StringBuilder sb = new StringBuilder();
			while((readLine = reader.readLine())!=null) {
				sb.append(readLine);
			}
			reader.close();
			System.out.println("sb.toString(): "+sb.toString());
			jsonData = sb.toString();
			// json으로 변환하기 
//			XmlMapper xmlMapper = new XmlMapper();
//			JsonNode node = xmlMapper.readTree(sb.toString().getBytes());
//			ObjectMapper jsonMapper = new ObjectMapper();
//			jsonData = jsonMapper.writeValueAsString(node);
//			System.out.println("json: "+jsonData);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonData;
	}
	private String getCityID(String cityName) {
		
		return null;
	}
}
