package handus.author.service;

import java.io.File;
import java.io.IOException;
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

import handus.dao.AuthorDao;
import handus.dao.MemberDao;
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
	
	@Transactional
	public boolean registerAuction(Auction auction, HandusImgList imgList){
		
		Calendar cal = Calendar.getInstance();
		Date date = auction.getA_startTime();
		cal.setTime(date);
		cal.add(Calendar.DATE, 7);
		auction.setA_endTime(cal.getTime());
		
		authorDao.insertAuction(auction);
		setImgInfo(auction.getA_pk(),AUCTION, imgList);
		authorDao.insertImage(AUCTION ,imgList);
		moveFile(AUCTION,imgList);
		return true;
	}
	
	@Transactional
	public boolean registerItem(Item item, HandusImgList imgList) {
		authorDao.insertImage(ITEM,imgList);
//		setImgInfo(item.getI_pk(),ITEM,imgList);
		return authorDao.insertItem(item);
	}
	
	@Transactional
	public boolean registerStudio(Studio studio, HandusImgList imgList) {
		authorDao.insertImage(STUDIO ,imgList);
		setImgInfo(studio.getS_pk(),STUDIO,imgList);
		return authorDao.insertStudio(studio);
	}
	
	private void setImgInfo(int fk,String type, HandusImgList imgList) {
		for(HandusImage img : imgList.getImgList()) {
			img.setImg_fk(fk);
			img.setImg_savePath("c://handus/"+type+"/"+fk);
		}
	}
	
	private void moveFile(String type, HandusImgList imgList) {
		String tempPath = "c://handus/temp";
		int fk =imgList.getImgList().get(0).getImg_fk();
		String path = "c://handus/"+type+"/"+fk;
		File dir = new File(path);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		for(HandusImage img : imgList.getImgList()) {
			File file = new File(tempPath, img.getImg_fileName());
			file.renameTo(new File(path,img.getImg_fileName()));
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
			auth.setM_pk((int)formData.get("m_pk"));
			auth.setMa_authority("ROLE_AUTHOR");
			memberDao.updateMemberAuth(auth);
			return true;
		}
		return false;
	}
	
	@Transactional
	public String updateAuthor(HashMap<String,Object> formData) {
		final String tempPath = "c://handus/temp";
		final String realPath = "c://handus/member/"+formData.get("m_pk");
		File dir = new File(realPath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File img = new File(tempPath,(String)formData.get("ap_filename"));
		img.renameTo(new File(realPath,(String)formData.get("ap_filename")));
		
		formData.put("ap_pk",null);
		formData.put("ap_savepath",realPath);
		authorDao.insertAuthorImage(formData);
		authorDao.updateAuthorImage(formData);
		
		return "{\"ap_pk\" : \""+formData.get("ap_pk")+"\" }";
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
}
