package handus.model;

public class Auth {
	
	private int ma_pk;
	private int m_pk;
	private String ma_authority;
	
	
	public int getMa_pk() {
		return ma_pk;
	}
	public int getM_pk() {
		return m_pk;
	}
	public void setMa_pk(int ma_pk) {
		this.ma_pk = ma_pk;
	}
	public void setM_pk(int m_pk) {
		this.m_pk = m_pk;
	}
	public String getMa_authority() {
		return ma_authority;
	}
	public void setMa_authority(String ma_authority) {
		this.ma_authority = ma_authority;
	}
	@Override
	public String toString() {
		return "Auth [ma_pk=" + ma_pk + ", m_pk=" + m_pk + ", ma_authority=" + ma_authority + "]";
	}
	
	
}
