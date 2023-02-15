package jdbc;

public class infoDTO {
	private String id, ilocation, icontent, iregtime;
	
	public infoDTO(String id, String ilocation, String icontent, String iregtime) {
		this.id = id;
		this.ilocation = ilocation;
		this.icontent = icontent;
		this.iregtime = iregtime;
	}

	public infoDTO() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIlocation() {
		return ilocation;
	}

	public void setIlocation(String ilocation) {
		this.ilocation = ilocation;
	}

	public String getIcontent() {
		return icontent;
	}

	public void setIcontent(String icontent) {
		this.icontent = icontent;
	}

	public String getIregtime() {
		return iregtime;
	}

	public void setIregtime(String iregtime) {
		this.iregtime = iregtime;
	}
}
