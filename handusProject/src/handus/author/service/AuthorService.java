package handus.author.service;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;

import handus.dao.AuthorDao;
import handus.dao.ImageDao;
import handus.dao.MemberDao;
import handus.image.service.S3Provider;
import handus.model.Auction;
import handus.model.Auth;
import handus.model.HandusImage;
import handus.model.HandusImgList;
import handus.model.Item;
import handus.model.Member;
import handus.model.Studio;

@Service
public class AuthorService {

	static final String TEMP_UPLOAD_PATH = "C://handus/temp";
	final String AUCTION = "auction";
	final String ITEM = "item";
	final String STUDIO = "studio";
	
	@Autowired
	private AuthorDao authorDao;
	
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private ImageDao imageDao;
	
	@Transactional
	public boolean registerAuction(Map<String,Object> auction, HandusImgList imgList){
		
		Calendar cal = Calendar.getInstance();
		
		Date date;
		try {
			date = new SimpleDateFormat("MM/dd/yyyy").parse((String)auction.get("a_startTime"));
			cal.setTime(date);
			auction.put("a_startTime",date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cal.add(Calendar.DATE, 7);
		auction.put("a_endTime", cal.getTime());
		auction.put("a_pk",0);
		
		boolean result = authorDao.insertAuction(auction);
		setImgInfo((int)auction.get("a_pk"),AUCTION, imgList);
		result = authorDao.insertImage(AUCTION,(int)auction.get("a_pk"),imgList);
		moveFile(AUCTION,imgList);
		return result;
	}
	
	@Transactional
	public boolean registerItem(Map<String,Object> item, HandusImgList imgList) {
		item.put("i_pk",0);
		boolean result = authorDao.insertItem(item);
		setImgInfo((int)item.get("i_pk"),ITEM,imgList);
		result = authorDao.insertImage(ITEM, (int)item.get("i_pk"), imgList);
		moveFile(ITEM,imgList);
		return result;
	}
	
	@Transactional
	public boolean registerStudio(Map<String,Object> studio, HandusImgList imgList) {
		System.out.println(studio + "////" + imgList);
		studio.put("s_pk",0);
		try {
			Date start = new SimpleDateFormat("MM/dd/yyyy").parse((String)studio.get("s_classstart"));
			Date end = new SimpleDateFormat("MM/dd/yyyy").parse((String)studio.get("s_classend"));
			studio.put("s_classstart",start);
			studio.put("s_classend",end);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		boolean result = authorDao.insertStudio(studio);
		setImgInfo((int)studio.get("s_pk"),STUDIO,imgList);
		result = authorDao.insertImage(STUDIO,(int)studio.get("s_pk") ,imgList);
		moveFile(STUDIO,imgList);
		return result;
	}
	
	private void setImgInfo(int fk,String type, HandusImgList imgList) {
		for(HandusImage img : imgList.getImgList()) {
			img.setImg_fk(fk);
			img.setImg_savePath(type+"/"+fk);
		}
	}
	
	private void moveFile(String type, HandusImgList imgList) {
		String tempPath = "c://handus/temp";
		int fk =imgList.getImgList().get(0).getImg_fk();
		String path = type+"/"+fk;
		
		AmazonS3 s3client = S3Provider.createConnectionWithCredentials(S3Provider.credentials);
		
		for(HandusImage img : imgList.getImgList()) {
			File file = new File(tempPath, img.getImg_fileName());
			s3client.putObject("handusbucket",path+"/"+img.getImg_fileName(), file);
		}
	}
	
	public String saveFile(MultipartFile file) {
		
		UUID uuid = UUID.randomUUID();
		String saveName = uuid.toString() + "_"+file.getOriginalFilename();
		
		File saveFile = new File(TEMP_UPLOAD_PATH, saveName);
		
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return saveName;
	}
	
	public Map<String,Object> getAuthorInfo(int m_pk) {		
		return authorDao.selectAuthorInfo(m_pk);
	}
	
	public List<Map<String,Object>> getRegisterList(int type, int m_pk){
		return authorDao.getListOfAuthor(type, m_pk);
	}
	
	public boolean registerAuthor(Map<String,Object> formData) {
		
		boolean result = authorDao.insertAuthor(formData);
		if(result) {
			Auth auth = new Auth();
			auth.setM_pk(Integer.parseInt((String)formData.get("m_pk")));
			auth.setMa_authority("ROLE_AUTHOR");
			memberDao.updateMemberAuth(auth);
			return true;
		}
		return false;
	}
	
	@Transactional
	public String updateAuthor(HashMap<String,Object> formData) {
		final String tempPath = "c://handus/temp/";
		final String realPath = "member/"+formData.get("m_pk");
		
		AmazonS3 s3client = S3Provider.createConnectionWithCredentials(S3Provider.credentials);
		
		s3client.putObject("handusbucket",realPath+"/"+formData.get("hi_filename"), new File(tempPath+formData.get("hi_filename")));
		
		formData.put("hi_pk",null);
		formData.put("hi_savepath",realPath);
		authorDao.insertAuthorImage(formData);
		authorDao.updateAuthorImage(formData);
		authorDao.updateAuthor(formData);
		
		return "{\"hi_pk\" : \""+formData.get("hi_pk")+"\" }";
	}
	
	public byte[] getAuthorImages(int ap_pk) throws IOException {	
		Map<String,Object> image = authorDao.selectAuthorImage(ap_pk);
		String savePath = (String)image.get("AP_SAVEPATH");
		String fileName = (String)image.get("AP_FILENAME");
		
		if(fileName == null) {
			return null;
		}
		byte[] bytes = FileUtils.readFileToByteArray(new File(savePath,fileName));
		
		return bytes;
	}
	
	public int getImagePk(int pk, int type) {
		return (int)imageDao.selectImageListByFK(pk, type).get(0).get("HI_PK");
	}
}
