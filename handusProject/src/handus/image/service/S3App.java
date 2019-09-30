package handus.image.service;

import java.io.File;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;



public class S3App {
	
	public static final AWSCredentials credentials;
	private static final String KEY_ID="AKIAIXZPLZE2IACKQ5AQ";
	
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
	
	public static void main(String[] args) {
		AmazonS3 amazone = S3App.createConnectionWithCredentials(credentials);
	}
}
