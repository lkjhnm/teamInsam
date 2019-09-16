package handus.model;

public class HandusImage {
	
	private int img_pk;
	private String img_fileName;
	private String img_savePath;
	private int img_fk;
	private boolean img_main;
	
	
	public boolean isImg_main() {
		return img_main;
	}
	public void setImg_main(boolean img_main) {
		this.img_main = img_main;
	}
	public int getImg_pk() {
		return img_pk;
	}
	public String getImg_fileName() {
		return img_fileName;
	}
	public String getImg_savePath() {
		return img_savePath;
	}
	public void setImg_pk(int img_pk) {
		this.img_pk = img_pk;
	}
	public void setImg_fileName(String img_fileName) {
		this.img_fileName = img_fileName;
	}
	public void setImg_savePath(String img_savePath) {
		this.img_savePath = img_savePath;
	}
	public int getImg_fk() {
		return img_fk;
	}
	public void setImg_fk(int img_fk) {
		this.img_fk = img_fk;
	}
	@Override
	public String toString() {
		return "HandusImage [img_pk=" + img_pk + ", img_fileName=" + img_fileName + ", img_savePath=" + img_savePath
				+ ", img_fk=" + img_fk + ", img_main=" + img_main + "]";
	}
}
