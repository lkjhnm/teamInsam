package handus.model;

import java.util.Date;

public class Auction {
	
	private Integer a_pk;
	private Integer m_pk_writer;
	private String a_title;
	private Integer a_startPrice;
	private Integer a_endPrice;
	private String c_category;
	private Integer c_pk;
	private Date a_regDate;
	private Date a_startTime;
	private Date a_endTime;
	private Integer a_readCount;
	private String a_comment;
	private long a_remain;
	private String a_remainText;
	private Integer a_currentPrice;
	private Date ag_regDate;
	private boolean a_end;
	private boolean a_alarm;
	private boolean a_start; 
	private String a_country;
	private String a_material;
	private String a_color;
	private String a_size;
	private String a_details;
	private int ai_pk;
	
	public int getAi_pk() {
		return ai_pk;
	}
	public void setAi_pk(int ai_pk) {
		this.ai_pk = ai_pk;
	}
	public boolean isA_start() {
		return a_start;
	}
	public void setA_start(boolean a_start) {
		this.a_start = a_start;
	}
	public Integer getC_pk() {
		return c_pk;
	}
	public void setC_pk(Integer c_pk) {
		this.c_pk = c_pk;
	}
	public String getA_country() {
		return a_country;
	}
	public String getA_material() {
		return a_material;
	}
	public String getA_color() {
		return a_color;
	}
	public String getA_size() {
		return a_size;
	}
	public String getA_details() {
		return a_details;
	}
	public void setA_country(String a_country) {
		this.a_country = a_country;
	}
	public void setA_material(String a_material) {
		this.a_material = a_material;
	}
	public void setA_color(String a_color) {
		this.a_color = a_color;
	}
	public void setA_size(String a_size) {
		this.a_size = a_size;
	}
	public void setA_details(String a_details) {
		this.a_details = a_details;
	}
	public boolean isA_end() {
		return a_end;
	}
	public void setA_end(boolean a_end) {
		this.a_end = a_end;
	}
	public boolean isA_alarm() {
		return a_alarm;
	}
	public void setA_alarm(boolean a_alarm) {
		this.a_alarm = a_alarm;
	}
	public Date getAg_regDate() {
		return ag_regDate;
	}
	public void setAg_regDate(Date ag_regDate) {
		this.ag_regDate = ag_regDate;
	}
	public Integer getA_currentPrice() {
		return a_currentPrice;
	}
	public void setA_currentPrice(Integer a_currentPrice) {
		this.a_currentPrice = a_currentPrice;
	}
	public Date getA_startTime() {
		return a_startTime;
	}
	public Date getA_endTime() {
		return a_endTime;
	}
	public void setA_startTime(Date a_startTime) {
		this.a_startTime = a_startTime;
	}
	public void setA_endTime(Date a_endTime) {
		this.a_endTime = a_endTime;
	}
	public long getA_remain() {
		return a_remain;
	}
	public String getA_remainText() {
		return a_remainText;
	}
	public void setA_remain(long a_remain) {
		this.a_remain = a_remain;
	}
	public void setA_remainText(String a_remainText) {
		this.a_remainText = a_remainText;
	}
	public String getA_comment() {
		return a_comment;
	}
	public void setA_comment(String a_comment) {
		this.a_comment = a_comment;
	}
	public Integer getA_readCount() {
		return a_readCount;
	}
	public void setA_readCount(Integer a_readCount) {
		this.a_readCount = a_readCount;
	}
	public Integer getA_pk() {
		return a_pk;
	}
	public Integer getM_pk_writer() {
		return m_pk_writer;
	}
	public String getA_title() {
		return a_title;
	}
	public Integer getA_startPrice() {
		return a_startPrice;
	}
	public Integer getA_endPrice() {
		return a_endPrice;
	}
	public String getC_category() {
		return c_category;
	}
	public Date getA_regDate() {
		return a_regDate;
	}

	public void setA_pk(Integer a_pk) {
		this.a_pk = a_pk;
	}
	public void setM_pk_writer(Integer m_pk_writer) {
		this.m_pk_writer = m_pk_writer;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public void setA_startPrice(Integer a_startPrice) {
		this.a_startPrice = a_startPrice;
	}
	public void setA_endPrice(Integer a_endPrice) {
		this.a_endPrice = a_endPrice;
	}
	public void setC_category(String c_category) {
		this.c_category = c_category;
	}
	public void setA_regDate(Date a_regDate) {
		this.a_regDate = a_regDate;
	}
	@Override
	public String toString() {
		return "Auction [a_pk=" + a_pk + ", m_pk_writer=" + m_pk_writer + ", a_title=" + a_title + ", a_startPrice="
				+ a_startPrice + ", a_endPrice=" + a_endPrice + ", c_category=" + c_category + ", c_pk=" + c_pk
				+ ", a_regDate=" + a_regDate + ", a_startTime=" + a_startTime + ", a_endTime=" + a_endTime
				+ ", a_readCount=" + a_readCount + ", a_comment=" + a_comment + ", a_remain=" + a_remain
				+ ", a_remainText=" + a_remainText + ", a_currentPrice=" + a_currentPrice + ", ag_regDate=" + ag_regDate
				+ ", a_end=" + a_end + ", a_alarm=" + a_alarm + ", a_start=" + a_start + ", a_country=" + a_country
				+ ", a_material=" + a_material + ", a_color=" + a_color + ", a_size=" + a_size + ", a_details="
				+ a_details + ", ai_pk=" + ai_pk + "]";
	}
	
	
}
