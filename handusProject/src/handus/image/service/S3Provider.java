package handus.image.service;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

public class S3Provider {
	
	public static final AWSCredentials credentials;
	private static final String KEY_ID="AKIAIVJ3VQ2MRM2W3OZQ";
	
	private static final String SECRET_ACCESS_KEY = "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";
	
	static {
		credentials = new BasicAWSCredentials(KEY_ID, SECRET_ACCESS_KEY);
	}
	
	public static AmazonS3 createConnectionWithCredentials(AWSCredentials credentials) {
		return AmazonS3ClientBuilder
				.standard()
				.withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(Regions.AP_NORTHEAST_2)
				.build();
	}
}
