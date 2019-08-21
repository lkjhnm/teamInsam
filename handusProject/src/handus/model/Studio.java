package handus.model;

import java.util.Date;

public class Studio {
	private int S_PK;
	private String S_TITLE;
	private int M_PK_WRITER;
	private int S_PRICE;
	private int S_LOCATION;
	private int S_CATEGORY;
	private Date S_REGDATE;
	private Date S_UPDATEDATE;
	private int S_MAXIMUM;
	private int S_CURRENT;
	private Date S_CLASSSTART;
	private Date S_CLASSEND; 
	private int S_READ_COUNT;
	private String S_CONTENT;
	
	public String getS_CONTENT() {
		return S_CONTENT;
	}
	public void setS_CONTENT(String s_CONTENT) {
		S_CONTENT = s_CONTENT;
	}
	public int getS_PK() {
		return S_PK;
	}
	public void setS_PK(int s_PK) {
		S_PK = s_PK;
	}
	public String getS_TITLE() {
		return S_TITLE;
	}
	public void setS_TITLE(String s_TITLE) {
		S_TITLE = s_TITLE;
	}
	public int getM_PK_WRITER() {
		return M_PK_WRITER;
	}
	public void setM_PK_WRITER(int m_PK_WRITER) {
		M_PK_WRITER = m_PK_WRITER;
	}
	public int getS_PRICE() {
		return S_PRICE;
	}
	public void setS_PRICE(int s_PRICE) {
		S_PRICE = s_PRICE;
	}
	public int getS_LOCATION() {
		return S_LOCATION;
	}
	public void setS_LOCATION(int s_LOCATION) {
		S_LOCATION = s_LOCATION;
	}
	public int getS_CATEGORY() {
		return S_CATEGORY;
	}
	public void setS_CATEGORY(int s_CATEGORY) {
		S_CATEGORY = s_CATEGORY;
	}
	public Date getS_REGDATE() {
		return S_REGDATE;
	}
	public void setS_REGDATE(Date s_REGDATE) {
		S_REGDATE = s_REGDATE;
	}
	public Date getS_UPDATEDATE() {
		return S_UPDATEDATE;
	}
	public void setS_UPDATEDATE(Date s_UPDATEDATE) {
		S_UPDATEDATE = s_UPDATEDATE;
	}
	public int getS_MAXIMUM() {
		return S_MAXIMUM;
	}
	public void setS_MAXIMUM(int s_MAXIMUM) {
		S_MAXIMUM = s_MAXIMUM;
	}
	public int getS_CURRENT() {
		return S_CURRENT;
	}
	public void setS_CURRENT(int s_CURRENT) {
		S_CURRENT = s_CURRENT;
	}
	public Date getS_CLASSSTART() {
		return S_CLASSSTART;
	}
	public void setS_CLASSSTART(Date s_CLASSSTART) {
		S_CLASSSTART = s_CLASSSTART;
	}
	public Date getS_CLASSEND() {
		return S_CLASSEND;
	}
	public void setS_CLASSEND(Date s_CLASSEND) {
		S_CLASSEND = s_CLASSEND;
	}
	public int getS_READ_COUNT() {
		return S_READ_COUNT;
	}
	public void setS_READ_COUNT(int s_READ_COUNT) {
		S_READ_COUNT = s_READ_COUNT;
	}
	@Override
	public String toString() {
		return "Studio [S_PK=" + S_PK + ", S_TITLE=" + S_TITLE + ", M_PK_WRITER=" + M_PK_WRITER + ", S_PRICE=" + S_PRICE
				+ ", S_LOCATION=" + S_LOCATION + ", S_CATEGORY=" + S_CATEGORY + ", S_REGDATE=" + S_REGDATE
				+ ", S_UPDATEDATE=" + S_UPDATEDATE + ", S_MAXIMUM=" + S_MAXIMUM + ", S_CURRENT=" + S_CURRENT
				+ ", S_CLASSSTART=" + S_CLASSSTART + ", S_CLASSEND=" + S_CLASSEND + ", S_READ_COUNT=" + S_READ_COUNT
				+ ", getS_PK()=" + getS_PK() + ", getS_TITLE()=" + getS_TITLE() + ", getM_PK_WRITER()="
				+ getM_PK_WRITER() + ", getS_PRICE()=" + getS_PRICE() + ", getS_LOCATION()=" + getS_LOCATION()
				+ ", getS_CATEGORY()=" + getS_CATEGORY() + ", getS_REGDATE()=" + getS_REGDATE() + ", getS_UPDATEDATE()="
				+ getS_UPDATEDATE() + ", getS_MAXIMUM()=" + getS_MAXIMUM() + ", getS_CURRENT()=" + getS_CURRENT()
				+ ", getS_CLASSSTART()=" + getS_CLASSSTART() + ", getS_CLASSEND()=" + getS_CLASSEND()
				+ ", getS_READ_COUNT()=" + getS_READ_COUNT() + "]";
	}
}
