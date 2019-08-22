package handus.model;

import java.util.Date;

public class Member {
	private int m_pk;
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_email;
	private String m_phonenum;
	private int m_enabled;
	private Date m_regdate;
	private String m_address;
	
	public int getM_pk() {
		return m_pk;
	}
	public void setM_pk(int m_pk) {
		this.m_pk = m_pk;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_phonenum() {
		return m_phonenum;
	}
	public void setM_phonenum(String m_phonenum) {
		this.m_phonenum = m_phonenum;
	}
	public int getM_enabled() {
		return m_enabled;
	}
	public void setM_enabled(int m_enabled) {
		this.m_enabled = m_enabled;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	@Override
	public String toString() {
		return "Member [m_pk=" + m_pk + ", m_id=" + m_id + ", m_password=" + m_password + ", m_name=" + m_name
				+ ", m_email=" + m_email + ", m_phonenum=" + m_phonenum + ", m_enabled=" + m_enabled + ", m_regdate="
				+ m_regdate + ", m_address=" + m_address + ", getM_pk()=" + getM_pk() + ", getM_id()=" + getM_id()
				+ ", getM_password()=" + getM_password() + ", getM_name()=" + getM_name() + ", getM_email()="
				+ getM_email() + ", getM_phonenum()=" + getM_phonenum() + ", getM_enabled()=" + getM_enabled()
				+ ", getM_regdate()=" + getM_regdate() + ", getM_address()=" + getM_address() + "]";
	}
	
}
