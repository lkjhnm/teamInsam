package handus.model;

import java.util.Date;

public class ReviewStudio {
	private int rs_pk;
	private int rs_m_pk;
	private String rs_m_name;
	private int rs_grade;
	private String rs_content;
	private int rs_s_pk;
	private Date rs_reg_date;
	
	public Date getRs_reg_date() {
		return rs_reg_date;
	}
	public void setRs_reg_date(Date rs_reg_date) {
		this.rs_reg_date = rs_reg_date;
	}
	public int getRs_pk() {
		return rs_pk;
	}
	public void setRs_pk(int rs_pk) {
		this.rs_pk = rs_pk;
	}
	public int getRs_m_pk() {
		return rs_m_pk;
	}
	public void setRs_m_pk(int rs_m_pk) {
		this.rs_m_pk = rs_m_pk;
	}
	public String getRs_m_name() {
		return rs_m_name;
	}
	public void setRs_m_name(String rs_m_name) {
		this.rs_m_name = rs_m_name;
	}
	public int getRs_grade() {
		return rs_grade;
	}
	public void setRs_grade(int rs_grade) {
		this.rs_grade = rs_grade;
	}
	public String getRs_content() {
		return rs_content;
	}
	public void setRs_content(String rs_content) {
		this.rs_content = rs_content;
	}
	public int getRs_s_pk() {
		return rs_s_pk;
	}
	public void setRs_s_pk(int rs_s_pk) {
		this.rs_s_pk = rs_s_pk;
	}
	@Override
	public String toString() {
		return "ReviewStudio [rs_pk=" + rs_pk + ", rs_m_pk=" + rs_m_pk + ", rs_m_name=" + rs_m_name + ", rs_grade="
				+ rs_grade + ", rs_content=" + rs_content + ", rs_s_pk=" + rs_s_pk + ", rs_reg_date=" + rs_reg_date
				+ ", getRs_reg_date()=" + getRs_reg_date() + ", getRs_pk()=" + getRs_pk() + ", getRs_m_pk()="
				+ getRs_m_pk() + ", getRs_m_name()=" + getRs_m_name() + ", getRs_grade()=" + getRs_grade()
				+ ", getRs_content()=" + getRs_content() + ", getRs_s_pk()=" + getRs_s_pk() + "]";
	}
	
}
