package handus.model;

import java.util.Date;

public class MemberVerify {
	
	private int mv_pk;
	private int m_pk;
	private String mv_ecode;
	private String mv_pcode;
	private Date mv_edate;
	private Date mv_pdate;
	
	public int getMv_pk() {
		return mv_pk;
	}
	public int getM_pk() {
		return m_pk;
	}
	public String getMv_ecode() {
		return mv_ecode;
	}
	public String getMv_pcode() {
		return mv_pcode;
	}
	public Date getMv_edate() {
		return mv_edate;
	}
	public Date getMv_pdate() {
		return mv_pdate;
	}
	public void setMv_pk(int mv_pk) {
		this.mv_pk = mv_pk;
	}
	public void setM_pk(int m_pk) {
		this.m_pk = m_pk;
	}
	public void setMv_ecode(String mv_ecode) {
		this.mv_ecode = mv_ecode;
	}
	public void setMv_pcode(String mv_pcode) {
		this.mv_pcode = mv_pcode;
	}
	public void setMv_edate(Date mv_edate) {
		this.mv_edate = mv_edate;
	}
	public void setMv_pdate(Date mv_pdate) {
		this.mv_pdate = mv_pdate;
	}
	
	@Override
	public String toString() {
		return "MemberVerify [mv_pk=" + mv_pk + ", m_pk=" + m_pk + ", mv_ecode=" + mv_ecode + ", mv_pcode=" + mv_pcode
				+ ", mv_edate=" + mv_edate + ", mv_pdate=" + mv_pdate + "]";
	}
}
