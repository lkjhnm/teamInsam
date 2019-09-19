package handus.model;

import java.util.Date;

public class Item {
	private int i_pk;
	private int m_pk_writer;
	private String i_title;
	private int i_price;
	private int i_category;
	private Date i_regdate;
	private Date i_updatedate;
	private int i_stock;
	private String i_comment;
	private int i_read_count;
	private String i_content;
	private String i_country;
	private String i_meterial;
	private String i_color;
	private String i_size;
	private String m_name;
	private String c_category;
	private int ri_count;
	private int hi_count;
	
	public int getI_pk() {
		return i_pk;
	}
	public void setI_pk(int i_pk) {
		this.i_pk = i_pk;
	}
	public int getM_pk_writer() {
		return m_pk_writer;
	}
	public void setM_pk_writer(int m_pk_writer) {
		this.m_pk_writer = m_pk_writer;
	}
	public String getI_title() {
		return i_title;
	}
	public void setI_title(String i_title) {
		this.i_title = i_title;
	}
	public int getI_price() {
		return i_price;
	}
	public void setI_price(int i_price) {
		this.i_price = i_price;
	}
	public int getI_category() {
		return i_category;
	}
	public void setI_category(int i_category) {
		this.i_category = i_category;
	}
	public Date getI_regdate() {
		return i_regdate;
	}
	public void setI_regdate(Date i_regdate) {
		this.i_regdate = i_regdate;
	}
	public Date getI_updatedate() {
		return i_updatedate;
	}
	public void setI_updatedate(Date i_updatedate) {
		this.i_updatedate = i_updatedate;
	}
	public int getI_stock() {
		return i_stock;
	}
	public void setI_stock(int i_stock) {
		this.i_stock = i_stock;
	}
	public String getI_comment() {
		return i_comment;
	}
	public void setI_comment(String i_comment) {
		this.i_comment = i_comment;
	}
	public int getI_read_count() {
		return i_read_count;
	}
	public void setI_read_count(int i_read_count) {
		this.i_read_count = i_read_count;
	}
	public String getI_content() {
		return i_content;
	}
	public void setI_content(String i_content) {
		this.i_content = i_content;
	}
	public String getI_country() {
		return i_country;
	}
	public void setI_country(String i_country) {
		this.i_country = i_country;
	}
	public String getI_meterial() {
		return i_meterial;
	}
	public void setI_meterial(String i_meterial) {
		this.i_meterial = i_meterial;
	}
	public String getI_color() {
		return i_color;
	}
	public void setI_color(String i_color) {
		this.i_color = i_color;
	}
	public String getI_size() {
		return i_size;
	}
	public void setI_size(String i_size) {
		this.i_size = i_size;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getC_category() {
		return c_category;
	}
	public void setC_category(String c_category) {
		this.c_category = c_category;
	}
	public int getRi_count() {
		return ri_count;
	}
	public void setRi_count(int ri_count) {
		this.ri_count = ri_count;
	}
	public int getHi_count() {
		return hi_count;
	}
	public void setHi_count(int hi_count) {
		this.hi_count = hi_count;
	}
	@Override
	public String toString() {
		return "Item [i_pk=" + i_pk + ", m_pk_writer=" + m_pk_writer + ", i_title=" + i_title + ", i_price=" + i_price
				+ ", i_category=" + i_category + ", i_regdate=" + i_regdate + ", i_updatedate=" + i_updatedate
				+ ", i_stock=" + i_stock + ", i_comment=" + i_comment + ", i_read_count=" + i_read_count
				+ ", i_content=" + i_content + ", i_country=" + i_country + ", i_meterial=" + i_meterial + ", i_color="
				+ i_color + ", i_size=" + i_size + ", m_name=" + m_name + ", c_category=" + c_category + ", ri_count="
				+ ri_count + ", hi_count=" + hi_count + ", getI_pk()=" + getI_pk() + ", getM_pk_writer()="
				+ getM_pk_writer() + ", getI_title()=" + getI_title() + ", getI_price()=" + getI_price()
				+ ", getI_category()=" + getI_category() + ", getI_regdate()=" + getI_regdate() + ", getI_updatedate()="
				+ getI_updatedate() + ", getI_stock()=" + getI_stock() + ", getI_comment()=" + getI_comment()
				+ ", getI_read_count()=" + getI_read_count() + ", getI_content()=" + getI_content()
				+ ", getI_country()=" + getI_country() + ", getI_meterial()=" + getI_meterial() + ", getI_color()="
				+ getI_color() + ", getI_size()=" + getI_size() + ", getM_name()=" + getM_name() + ", getC_category()="
				+ getC_category() + ", getRi_count()=" + getRi_count() + ", getHi_count()=" + getHi_count() + "]";
	}
	
}
