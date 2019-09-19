package handus.model;

public class HeartItem {
	private int hi_pk;
	private int hi_m_pk;
	private int hi_i_pk;
	public int getHi_pk() {
		return hi_pk;
	}
	public void setHi_pk(int hi_pk) {
		this.hi_pk = hi_pk;
	}
	public int getHi_m_pk() {
		return hi_m_pk;
	}
	public void setHi_m_pk(int hi_m_pk) {
		this.hi_m_pk = hi_m_pk;
	}
	public int getHi_i_pk() {
		return hi_i_pk;
	}
	public void setHi_i_pk(int hi_i_pk) {
		this.hi_i_pk = hi_i_pk;
	}
	@Override
	public String toString() {
		return "HeartItem [hi_pk=" + hi_pk + ", hi_m_pk=" + hi_m_pk + ", hi_i_pk=" + hi_i_pk + ", getHi_pk()="
				+ getHi_pk() + ", getHi_m_pk()=" + getHi_m_pk() + ", getHi_i_pk()=" + getHi_i_pk() + "]";
	}
	
}
