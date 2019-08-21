package handus.model;

import java.util.Date;

public class Auction {
	
	private int a_pk;
	private int m_pk_writer;
	private String a_title;
	private int a_startPrice;
	private int a_endPrice;
	private String a_category;
	private Date a_regDate;
	private Date a_startDate;
	private Date a_endDate;
	private int a_readCount;
	
	
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
	public String getA_category() {
		return a_category;
	}
	public Date getA_regDate() {
		return a_regDate;
	}
	public Date getA_startDate() {
		return a_startDate;
	}
	public Date getA_endDate() {
		return a_endDate;
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
	public void setA_category(String a_category) {
		this.a_category = a_category;
	}
	public void setA_regDate(Date a_regDate) {
		this.a_regDate = a_regDate;
	}
	public void setA_startDate(Date a_startDate) {
		this.a_startDate = a_startDate;
	}
	public void setA_endDate(Date a_endDate) {
		this.a_endDate = a_endDate;
	}
	@Override
	public String toString() {
		return "Auction [a_pk=" + a_pk + ", m_pk_writer=" + m_pk_writer + ", a_title=" + a_title + ", a_startPrice="
				+ a_startPrice + ", a_endPrice=" + a_endPrice + ", a_category=" + a_category + ", a_regDate="
				+ a_regDate + ", a_startDate=" + a_startDate + ", a_endDate=" + a_endDate + ", a_readCount="
				+ a_readCount + "]";
	}
	
}
