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
import org.springframework.security.access.prepost.PreAuthorize;
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
import com.google.gson.JsonObject;

import handus.alarm.service.AlarmService;
import handus.author.service.AuthorService;
import handus.dao.AlarmDao;
import handus.model.Auction;
import handus.model.HandusImage;
import handus.model.HandusImgList;
import handus.model.Item;
import handus.model.Studio;


@RequestMapping("/author")
@Controller
@PreAuthorize("hasRole('ROLE_AUTHOR')")
public class AuthorController {
	
	@Autowired
	private AuthorService authorService;
	@Autowired
	private SimpMessagingTemplate simpMessageTemplate;
	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String regsiterPage() {		
		
		return "author/register";
	}
	@RequestMapping(value="/register/{type}",method=RequestMethod.POST)
	public String regsiterPages(@PathVariable(value="type") String type 
			,@RequestParam Map<String,Object> itemInfo 
			,HandusImgList imgList
			,Model model
			) {			// item 추가 요망		
		
		int pk = 0;
		int m_pk_writer = Integer.parseInt((String)itemInfo.get("m_pk_writer"));
		
		switch(type) {
		case "auction":
			authorService.registerAuction(itemInfo, imgList);
			pk = (int)itemInfo.get("a_pk");
			break;
		case "item":
			authorService.registerItem(itemInfo,imgList);
			pk = (int)itemInfo.get("i_pk");
			break;
		case "studio":
			authorService.registerStudio(itemInfo, imgList);

			pk = (int)itemInfo.get("s_pk");
			break;
		}
		
		alarmService.alarmToUser(m_pk_writer, pk, type, simpMessageTemplate);
		
		model.addAttribute("m_pk", itemInfo.get("m_pk_writer"));
		
		return "redirect:/author/privatePage"; // 작가 마이페이지로 리다이렉트
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
	
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String authorSignUp() {
		return "author/signUp";
	}
	
	@RequestMapping(value="/signUp",method=RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String authorSignUpPost(@RequestParam Map<String,Object> formData) {
		
		authorService.registerAuthor(formData);
		
		return "redirect:/author/privatePage?m_pk="+formData.get("m_pk"); 
	}
	
	@RequestMapping(value="/publicPage", method=RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
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
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public List<Map<String,Object>> getAuthorRegistList(@PathVariable(value="type") int type ,int m_pk){
		
		return authorService.getRegisterList(type, m_pk);
	}
	
	@RequestMapping(value="/updateAuthor", method=RequestMethod.POST)
	@ResponseBody
	public String updateAuthorInfo(@RequestParam HashMap<String,Object> formData) {
		
		String result = authorService.updateAuthor(formData);
		
		return result;
	}
}

