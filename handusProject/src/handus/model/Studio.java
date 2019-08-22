package handus.model;

import java.util.Date;

public class Studio {
	private int s_pk;
	private String s_title;
	private int m_pk_writer;
	private int s_price;
	private String s_location;
	private String s_category;
	private Date s_regdate;
	private Date s_updatedate;
	private int s_maximum;
	private int s_current;
	private Date s_classstart;
	private Date s_classend; 
	private int s_read_count;
	private String s_content;
	
	public int getS_pk() {
		return s_pk;
	}
	public void setS_pk(int s_pk) {
		this.s_pk = s_pk;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public int getM_pk_writer() {
		return m_pk_writer;
	}
	public void setM_pk_writer(int m_pk_writer) {
		this.m_pk_writer = m_pk_writer;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public String getS_location() {
		return s_location;
	}
	public void setS_location(String s_location) {
		this.s_location = s_location;
	}
	public String getS_category() {
		return s_category;
	}
	public void setS_category(String s_category) {
		this.s_category = s_category;
	}
	public Date getS_regdate() {
		return s_regdate;
	}
	public void setS_regdate(Date s_regdate) {
		this.s_regdate = s_regdate;
	}
	public Date getS_updatedate() {
		return s_updatedate;
	}
	public void setS_updatedate(Date s_updatedate) {
		this.s_updatedate = s_updatedate;
	}
	public int getS_maximum() {
		return s_maximum;
	}
	public void setS_maximum(int s_maximum) {
		this.s_maximum = s_maximum;
	}
	public int getS_current() {
		return s_current;
	}
	public void setS_current(int s_current) {
		this.s_current = s_current;
	}
	public Date getS_classstart() {
		return s_classstart;
	}
	public void setS_classstart(Date s_classstart) {
		this.s_classstart = s_classstart;
	}
	public Date getS_classend() {
		return s_classend;
	}
	public void setS_classend(Date s_classend) {
		this.s_classend = s_classend;
	}
	public int getS_read_count() {
		return s_read_count;
	}
	public void setS_read_count(int s_read_count) {
		this.s_read_count = s_read_count;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	@Override
	public String toString() {
		return "Studio [s_pk=" + s_pk + ", s_title=" + s_title + ", m_pk_writer=" + m_pk_writer + ", s_price=" + s_price
				+ ", s_location=" + s_location + ", s_category=" + s_category + ", s_regdate=" + s_regdate
				+ ", s_updatedate=" + s_updatedate + ", s_maximum=" + s_maximum + ", s_current=" + s_current
				+ ", s_classstart=" + s_classstart + ", s_classend=" + s_classend + ", s_read_count=" + s_read_count
				+ ", s_content=" + s_content + ", getS_pk()=" + getS_pk() + ", getS_title()=" + getS_title()
				+ ", getM_pk_writer()=" + getM_pk_writer() + ", getS_price()=" + getS_price() + ", getS_location()="
				+ getS_location() + ", getS_category()=" + getS_category() + ", getS_regdate()=" + getS_regdate()
				+ ", getS_updatedate()=" + getS_updatedate() + ", getS_maximum()=" + getS_maximum()
				+ ", getS_current()=" + getS_current() + ", getS_classstart()=" + getS_classstart()
				+ ", getS_classend()=" + getS_classend() + ", getS_read_count()=" + getS_read_count()
				+ ", getS_content()=" + getS_content() + "]";
	}
	
}
