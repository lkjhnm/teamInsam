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
//	private static int NUM_OF_STUDIO_PER_PAGE = 6;
//	private static int NUM_OF_NAV_PAGE =5;
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
		return studioDao.selectStudioByNum(stuNum);
	}
	
	// 리스트 
	public List<Studio> getStudioList(int page, String type) {
		List<Studio> studioList = studioDao.selectStudioList(page, type);		
		return studioList;
	} 
	
	// 페이지 정보 
	public Map<String, Object> getPageInfo(int page, String type){
		// count = 검색결과(카테고리)에 맞는 총 게시글 갯수 
		int count = studioDao.selectCount(type);
		return calPageInfo(count, page, type);
	}
	private Map<String, Object> calPageInfo(int count, int page, String type){
		int totalPage = (int)Math.ceil(count/6.0);
		int startPage = 0;
		int endPage = 0;
		
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		// 한 페이지에 표시할 리스트 갯수, 네비게이션 바 표시 갯수를 따로 저장하지 않고 
		// 현재 페이지가 가운데에 오도록 설정 (
		// 현재 5개 = 현재 페이지 앞 뒤로 2개씩 보여줌 
		if(page < 4) {
			// 1, 2 일 때는 가운데 올 수 없음 
			startPage = 1;
			if(totalPage < 6) {
				endPage = totalPage;
			}else {
				endPage = 5;
			}
		}else if (page >= 4 && page < totalPage - 2) {
			// 3부터 가운데에 오도록 표시, 총 페이지의 2번째 전까지 
			// (앞 뒤로 2개씩만 보여줌) 
			startPage = page - 2;
			endPage = page + 2;
		}else {
			// 끝에서 1,2 번째 페이지는 가운데 올 수 없음 
			startPage = totalPage - 4;
			endPage = totalPage;
		}
		
		pageInfo.put("startPage", startPage);
		pageInfo.put("endPage", endPage);
		pageInfo.put("totalPage", totalPage);
		pageInfo.put("curPage", page);
		pageInfo.put("type", type);
		
		return pageInfo;
	}
	
	public List<Studio> getAllStudio() {
		return studioDao.selectAllStudio();
	}
	// 페이징 처리 메소드 
//	private int getStartRow(int pageNum) {
//		return (pageNum*NUM_OF_STUDIO_PER_PAGE)-(NUM_OF_STUDIO_PER_PAGE-1);
//	}
//	private int getEndRow(int pageNum) {
//		return pageNum*NUM_OF_STUDIO_PER_PAGE;
//	}
//	private int getFirstPage(int pageNum) {
//		return ((pageNum-1)/ NUM_OF_NAV_PAGE)*NUM_OF_NAV_PAGE +1 ;
//	}
//	private int getLastPage(int pageNum) {
//		return getFirstPage(pageNum) + (NUM_OF_NAV_PAGE-1);
//	}
//	private int getTotalPage() {
//		return (int)Math.ceil(studioDao.selectCount()/(double)NUM_OF_STUDIO_PER_PAGE);
//	}

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
