package handus.model;

import java.util.Date;

public class Auction {
	
	private int a_pk;
	private int m_pk_writer;
	private String a_title;
	private int a_startPrice;
	private int a_endPrice;
	private String c_category;
	private Date a_regDate;
	private Date a_startTime;
	private Date a_endTime;
	private int a_readCount;
	private String a_comment;
	private long a_remain;
	private String a_remainText;
	private int a_currentPrice;
	private Date ag_regDate;
	
	
	public Date getAg_regDate() {
		return ag_regDate;
	}
	public void setAg_regDate(Date ag_regDate) {
		this.ag_regDate = ag_regDate;
	}
	public int getA_currentPrice() {
		return a_currentPrice;
	}
	public void setA_currentPrice(int a_currentPrice) {
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
	public int getA_readCount() {
		return a_readCount;
	}
	public void setA_readCount(int a_readCount) {
		this.a_readCount = a_readCount;
	}
	public int getA_pk() {
		return a_pk;
	}
	public int getM_pk_writer() {
		return m_pk_writer;
	}
	public String getA_title() {
		return a_title;
	}
	public int getA_startPrice() {
		return a_startPrice;
	}
	public int getA_endPrice() {
		return a_endPrice;
	}
	public String getC_category() {
		return c_category;
	}
	public Date getA_regDate() {
		return a_regDate;
	}

	public void setA_pk(int a_pk) {
		this.a_pk = a_pk;
	}
	public void setM_pk_writer(int m_pk_writer) {
		this.m_pk_writer = m_pk_writer;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public void setA_startPrice(int a_startPrice) {
		this.a_startPrice = a_startPrice;
	}
	public void setA_endPrice(int a_endPrice) {
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
				+ a_startPrice + ", a_endPrice=" + a_endPrice + ", c_category=" + c_category + ", a_regDate="
				+ a_regDate + ", a_startTime=" + a_startTime + ", a_endTime=" + a_endTime + ", a_readCount="
				+ a_readCount + ", a_comment=" + a_comment + ", a_remain=" + a_remain + ", a_remainText=" + a_remainText
				+ ", a_currentPrice=" + a_currentPrice + "]";
	}
	
}
