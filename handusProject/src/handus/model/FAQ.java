package handus.model;

import java.util.Date;

public class FAQ {
	
	public int faq_idNum;
	public String faq_title;
	public String faq_content;
	public Date faq_regDate;
	public String faq_category;
	public int faq_code;
	public int getFaq_idNum() {
		return faq_idNum;
	}
	public void setFaq_idNum(int faq_idNum) {
		this.faq_idNum = faq_idNum;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public Date getFaq_regDate() {
		return faq_regDate;
	}
	public void setFaq_regDate(Date faq_regDate) {
		this.faq_regDate = faq_regDate;
	}
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}
	public int getFaq_code() {
		return faq_code;
	}
	public void setFaq_code(int faq_code) {
		this.faq_code = faq_code;
	}
	@Override
	public String toString() {
		return "FAQ [faq_idNum=" + faq_idNum + ", faq_title=" + faq_title + ", faq_content=" + faq_content
				+ ", faq_regDate=" + faq_regDate + ", faq_category=" + faq_category + ", faq_code=" + faq_code + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
