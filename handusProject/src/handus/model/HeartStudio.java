package handus.model;

public class HeartStudio {
	private int hs_pk;
	private int hs_m_pk;
	private int hs_s_pk;
	
	public int getHs_pk() {
		return hs_pk;
	}
	public void setHs_pk(int hs_pk) {
		this.hs_pk = hs_pk;
	}
	public int getHs_m_pk() {
		return hs_m_pk;
	}
	public void setHs_m_pk(int hs_m_pk) {
		this.hs_m_pk = hs_m_pk;
	}
	public int getHs_s_pk() {
		return hs_s_pk;
	}
	public void setHs_s_pk(int hs_s_pk) {
		this.hs_s_pk = hs_s_pk;
	}
	@Override
	public String toString() {
		return "HeartStudio [hs_pk=" + hs_pk + ", hs_m_pk=" + hs_m_pk + ", hs_s_pk=" + hs_s_pk + ", getHs_pk()="
				+ getHs_pk() + ", getHs_m_pk()=" + getHs_m_pk() + ", getHs_s_pk()=" + getHs_s_pk() + "]";
	}
	
}
