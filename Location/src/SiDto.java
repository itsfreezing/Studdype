public class SiDto {
	private int si_no;
	private String si_name;
	public SiDto() {
		super();
	}
	public SiDto(int si_no, String si_name) {
		super();
		this.si_no = si_no;
		this.si_name = si_name;
	}
	public int getSi_no() {
		return si_no;
	}
	public void setSi_no(int si_no) {
		this.si_no = si_no;
	}
	public String getSi_name() {
		return si_name;
	}
	public void setSi_name(String si_name) {
		this.si_name = si_name;
	}
	@Override
	public String toString() {
		return "SiDto [si_no=" + si_no + ", si_name=" + si_name + "]";
	}
	
}
