package handus.model;

import java.util.Date;

public class ReviewItem {
	private int ri_pk;
	private int ri_m_pk;
	private String ri_m_name;
	private int ri_grade;
	private String ri_content;
	private int ri_i_pk;
	private Date ri_reg_date;
	
	public int getRi_pk() {
		return ri_pk;
	}
	public void setRi_pk(int ri_pk) {
		this.ri_pk = ri_pk;
	}
	public int getRi_m_pk() {
		return ri_m_pk;
	}
	public void setRi_m_pk(int ri_m_pk) {
		this.ri_m_pk = ri_m_pk;
	}
	public String getRi_m_name() {
		return ri_m_name;
	}
	public void setRi_m_name(String ri_m_name) {
		this.ri_m_name = ri_m_name;
	}
	public int getRi_grade() {
		return ri_grade;
	}
	public void setRi_grade(int ri_grade) {
		this.ri_grade = ri_grade;
	}
	public String getRi_content() {
		return ri_content;
	}
	public void setRi_content(String ri_content) {
		this.ri_content = ri_content;
	}
	public int getRi_i_pk() {
		return ri_i_pk;
	}
	public void setRi_i_pk(int ri_i_pk) {
		this.ri_i_pk = ri_i_pk;
	}
	public Date getRi_reg_date() {
		return ri_reg_date;
	}
	public void setRi_reg_date(Date ri_reg_date) {
		this.ri_reg_date = ri_reg_date;
	}
	@Override
	public String toString() {
		return "ReviewItem [ri_pk=" + ri_pk + ", ri_m_pk=" + ri_m_pk + ", ri_m_name=" + ri_m_name + ", ri_grade="
				+ ri_grade + ", ri_content=" + ri_content + ", ri_i_pk=" + ri_i_pk + ", ri_reg_date=" + ri_reg_date
				+ ", getRi_pk()=" + getRi_pk() + ", getRi_m_pk()=" + getRi_m_pk() + ", getRi_m_name()=" + getRi_m_name()
				+ ", getRi_grade()=" + getRi_grade() + ", getRi_content()=" + getRi_content() + ", getRi_i_pk()="
				+ getRi_i_pk() + ", getRi_reg_date()=" + getRi_reg_date() + "]";
	}
	
}
