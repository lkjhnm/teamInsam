package handus.model;

public class MemberInterest {
	
	private int mi_pk;
	private int m_pk;
	private int c_pk;
	
	
	public int getMi_pk() {
		return mi_pk;
	}
	public void setMi_pk(int mi_pk) {
		this.mi_pk = mi_pk;
	}
	public int getM_pk() {
		return m_pk;
	}
	public int getC_pk() {
		return c_pk;
	}
	public void setM_pk(int m_pk) {
		this.m_pk = m_pk;
	}
	public void setC_pk(int c_pk) {
		this.c_pk = c_pk;
	}
	@Override
	public String toString() {
		return "MemberInterest [mi_pk=" + mi_pk + ", m_pk=" + m_pk + ", c_pk=" + c_pk + "]";
	}
}
