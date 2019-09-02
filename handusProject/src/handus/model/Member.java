package handus.model;

import java.util.Date;
import java.util.List;

public class Member{
	private int m_pk;
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_email;
	private String m_phonenum;
	private int m_enabled;
	private Date m_regdate;
	private String m_address;
	private boolean m_eval;
	private boolean m_pval;
	private List<Auth> authList;
	private List<MemberInterest> miList;
	private int m_apiType;
	private String m_apiId;
	
	
	public int getM_apiType() {
		return m_apiType;
	}
	public String getM_apiId() {
		return m_apiId;
	}
	public void setM_apiType(int m_apiType) {
		this.m_apiType = m_apiType;
	}
	public void setM_apiId(String m_apiId) {
		this.m_apiId = m_apiId;
	}
	public List<MemberInterest> getMiList() {
		return miList;
	}
	public void setMiList(List<MemberInterest> miList) {
		this.miList = miList;
	}
	public List<Auth> getAuthList() {
		return authList;
	}
	public void setAuthList(List<Auth> authList) {
		this.authList = authList;
	}
	public boolean isM_eval() {
		return m_eval;
	}
	public boolean isM_pval() {
		return m_pval;
	}
	public void setM_eval(boolean m_eval) {
		this.m_eval = m_eval;
	}
	public void setM_pval(boolean m_pval) {
		this.m_pval = m_pval;
	}
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
				+ m_regdate + ", m_address=" + m_address + ", m_eval=" + m_eval + ", m_pval=" + m_pval + ", authList="
				+ authList + ", miList=" + miList + "]";
	}
	
}
