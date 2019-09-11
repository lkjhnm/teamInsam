package handus.author.controller;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import handus.author.service.AuthorService;
import handus.model.Auction;
import handus.model.HandusImage;
import handus.model.HandusImgList;
import handus.model.Item;
import handus.model.Studio;


@RequestMapping("/author")
@Controller
public class AuthorController {
	
	@Autowired
	private AuthorService authorService;
	@Autowired
	private SimpMessagingTemplate simpMessageTemplate;
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String regsiterPage() {		
		
		return "author/register";
	}
	@RequestMapping(value="/register/{type}",method=RequestMethod.POST)
	public String regsiterPages(@PathVariable(value="type") String type 
			,Auction auction
			,Item item
			,Studio studio
			,HandusImgList imgList
			) {			// item 추가 요망		

		switch(type) {
		case "auction":
			authorService.registerAuction(auction, imgList);
			break;
		case "item":
			authorService.registerItem(item,imgList);
			break;
		case "studio":
			authorService.registerStudio(studio, imgList);
			break;
		}
		
		return null; // 작가 마이페이지로 리다이렉트
	}
	
	
	
	@RequestMapping(value="/imgUpload",method=RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String uploadImg(MultipartFile[] uploadFiles) {
		
		List<String> nameList = new ArrayList<>();

		for(MultipartFile f : uploadFiles) {
			String saveName = authorService.saveFile(f);
			nameList.add(saveName);
		}
		Gson gson = new Gson();
		
		return gson.toJson(nameList);
	}
	
	static final String TEMP_PATH = "c://handus/temp"; 
	
	@RequestMapping(value="/getTempImg", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> getTempImage(String fileName) throws IOException {
		
		File file = new File(TEMP_PATH,fileName);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders header = new HttpHeaders();
		
		header.add("Content-Type", Files.probeContentType(file.toPath()));
		result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping(value="/deleteTempImg", method= RequestMethod.POST)
	@ResponseBody
	public boolean deleteTempImage(String fileName) {
		File file = new File(TEMP_PATH,fileName);
		
		if(file.exists()) {
			return file.delete();
		}
		return false;
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public boolean modifyAuthorInfo() {
		return false;
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String authorSignUp() {
		return "author/signUp";
	}
	
	@RequestMapping(value="/signUp",method=RequestMethod.POST)
	public String authorSignUpPost(@RequestParam Map<String,Object> formData) {
		
		authorService.registerAuthor(formData);
		
		return "redirect:/author/privatePage?m_pk="+formData.get("m_pk"); 
	}
	
	@RequestMapping(value="/publicPage", method=RequestMethod.GET)
	public String showPublicAuthorPage(int m_pk, Model model) {
		
		model.addAllAttributes(authorService.getAuthorInfo(m_pk));
		
		return "author/publicAuthor";
	}
	
	@RequestMapping(value="/privatePage", method=RequestMethod.GET)
	public String showPrivateAuthorPage(int m_pk, Model model) {
		
		model.addAllAttributes(authorService.getAuthorInfo(m_pk));
		
		return "author/privateAuthor";
	}
	
	@RequestMapping(value="/getList/{type}", method=RequestMethod.POST)				// type :  1 - item, 2 - auction, 3 - studio
	@ResponseBody
	public List<Map<String,Object>> getAuthorRegistList(@PathVariable(value="type") int type ,int m_pk){
		
		return authorService.getRegisterList(type, m_pk);
	}
	
	@RequestMapping(value="/updateAuthor", method=RequestMethod.POST)
	@ResponseBody
	public String updateAuthorInfo(@RequestParam() HashMap<String,Object> formData) {
		
		String result = authorService.updateAuthor(formData);
		
		return result;
	}
	
	@RequestMapping(value="/authorImg", method=RequestMethod.GET)
	public ResponseEntity<byte[]> auctionImage(int ap_pk) throws IOException{
		HttpHeaders headers = new HttpHeaders();
		byte[] image = authorService.getAuthorImages(ap_pk);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(image,headers,HttpStatus.OK);
		return responseEntity;
	}
}

