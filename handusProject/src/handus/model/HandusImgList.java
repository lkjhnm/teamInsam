package handus.model;

import java.util.ArrayList;
import java.util.List;

public class HandusImgList {
	
	public HandusImgList() {
		imgList = new ArrayList<>();
	}
	
	private List<HandusImage> imgList;

	public List<HandusImage> getImgList() {
		return imgList;
	}

	public void setImgList(List<HandusImage> imgList) {
		this.imgList = imgList;
	}

	@Override
	public String toString() {
		return "HandusImgList [imgList=" + imgList + "]";
	}
}
