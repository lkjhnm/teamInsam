package handus.studio.model;

public class StudioImage {
	private int SI_PK;
	private String SI_FILENAME;
	private String SI_SAVEPATH;
	private int S_PK;
	
	public int getSI_PK() {
		return SI_PK;
	}
	public void setSI_PK(int sI_PK) {
		SI_PK = sI_PK;
	}
	public String getSI_FILENAME() {
		return SI_FILENAME;
	}
	public void setSI_FILENAME(String sI_FILENAME) {
		SI_FILENAME = sI_FILENAME;
	}
	public String getSI_SAVEPATH() {
		return SI_SAVEPATH;
	}
	public void setSI_SAVEPATH(String sI_SAVEPATH) {
		SI_SAVEPATH = sI_SAVEPATH;
	}
	public int getS_PK() {
		return S_PK;
	}
	public void setS_PK(int s_PK) {
		S_PK = s_PK;
	}
	@Override
	public String toString() {
		return "StudioImage [SI_PK=" + SI_PK + ", SI_FILENAME=" + SI_FILENAME + ", SI_SAVEPATH=" + SI_SAVEPATH
				+ ", S_PK=" + S_PK + ", getSI_PK()=" + getSI_PK() + ", getSI_FILENAME()=" + getSI_FILENAME()
				+ ", getSI_SAVEPATH()=" + getSI_SAVEPATH() + ", getS_PK()=" + getS_PK() + "]";
	}
	
}
