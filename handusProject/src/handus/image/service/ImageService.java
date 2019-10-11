package handus.image.service;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;

import handus.dao.ImageDao;

@Service
public class ImageService {
	
	private AmazonS3 s3client;
	
	private final String BUCKET = "handusbucket";
	
	@Autowired
	private ImageDao imageDao;
	
	public ImageService() {
		s3client = S3Provider.createConnectionWithCredentials(S3Provider.credentials);
	}
	
	public byte[] getImageData(int hi_pk) throws IOException {
		
		Map<String,Object> imageInfo = imageDao.selectImageByPK(hi_pk);
		
		String bucket_key = imageInfo.get("HI_SAVEPATH")+"/"+imageInfo.get("HI_FILENAME");

		S3Object s3Object = s3client.getObject(BUCKET,bucket_key);
		S3ObjectInputStream inputStream = s3Object.getObjectContent();
		
		return FileCopyUtils.copyToByteArray(inputStream);
	}
}
