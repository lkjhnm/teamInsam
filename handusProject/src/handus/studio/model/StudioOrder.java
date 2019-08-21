package handus.studio.model;

import java.util.Date;

public class StudioOrder {
	private int SO_PK;
	private int S_PK;
	private int M_PK_USER;
	private int SO_AMOUNT;
	private Date SO_BUYDATE;
	private int SO_PRICE;
	
	public int getSO_PK() {
		return SO_PK;
	}
	public void setSO_PK(int sO_PK) {
		SO_PK = sO_PK;
	}
	public int getS_PK() {
		return S_PK;
	}
	public void setS_PK(int s_PK) {
		S_PK = s_PK;
	}
	public int getM_PK_USER() {
		return M_PK_USER;
	}
	public void setM_PK_USER(int m_PK_USER) {
		M_PK_USER = m_PK_USER;
	}
	public int getSO_AMOUNT() {
		return SO_AMOUNT;
	}
	public void setSO_AMOUNT(int sO_AMOUNT) {
		SO_AMOUNT = sO_AMOUNT;
	}
	public Date getSO_BUYDATE() {
		return SO_BUYDATE;
	}
	public void setSO_BUYDATE(Date sO_BUYDATE) {
		SO_BUYDATE = sO_BUYDATE;
	}
	public int getSO_PRICE() {
		return SO_PRICE;
	}
	public void setSO_PRICE(int sO_PRICE) {
		SO_PRICE = sO_PRICE;
	}
	@Override
	public String toString() {
		return "StudioOrder [SO_PK=" + SO_PK + ", S_PK=" + S_PK + ", M_PK_USER=" + M_PK_USER + ", SO_AMOUNT="
				+ SO_AMOUNT + ", SO_BUYDATE=" + SO_BUYDATE + ", SO_PRICE=" + SO_PRICE + ", getSO_PK()=" + getSO_PK()
				+ ", getS_PK()=" + getS_PK() + ", getM_PK_USER()=" + getM_PK_USER() + ", getSO_AMOUNT()="
				+ getSO_AMOUNT() + ", getSO_BUYDATE()=" + getSO_BUYDATE() + ", getSO_PRICE()=" + getSO_PRICE() + "]";
	}
	
}
