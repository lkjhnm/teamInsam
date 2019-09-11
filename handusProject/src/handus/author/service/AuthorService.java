package handus.author.service;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import handus.dao.AuthorDao;
import handus.model.Auction;
import handus.model.HandusImage;
import handus.model.HandusImgList;
import handus.model.Item;
import handus.model.Studio;

@Service
public class AuthorService {

	static final String TEMP_UPLOAD_PATH = "C://handus/temp";
	final String AUCTION = "auction";
	final String ITEM = "item";
	final String STUDIO = "studio";
	
	@Autowired
	private AuthorDao authorDao;
	
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
}
