package handus.model;

import java.util.Date;

public class AuctionGraph {
	
	private int ag_pk;
	private int a_pk;
	private int m_pk_user;
	private int ag_bidding;
	private Date ag_regDate;
	
	public int getAg_pk() {
		return ag_pk;
	}
	public int getA_pk() {
		return a_pk;
	}
	public int getM_pk_user() {
		return m_pk_user;
	}
	public int getAg_bidding() {
		return ag_bidding;
	}
	public Date getAg_regDate() {
		return ag_regDate;
	}
	public void setAg_pk(int ag_pk) {
		this.ag_pk = ag_pk;
	}
	public void setA_pk(int a_pk) {
		this.a_pk = a_pk;
	}
	public void setM_pk_user(int m_pk_user) {
		this.m_pk_user = m_pk_user;
	}
	public void setAg_bidding(int ag_bidding) {
		this.ag_bidding = ag_bidding;
	}
	public void setAg_regDate(Date ag_regDate) {
		this.ag_regDate = ag_regDate;
	}
	@Override
	public String toString() {
		return "AuctionGraph [ag_pk=" + ag_pk + ", a_pk=" + a_pk + ", m_pk_user=" + m_pk_user + ", ag_bidding="
				+ ag_bidding + ", ag_regDate=" + ag_regDate + "]";
	}
}
