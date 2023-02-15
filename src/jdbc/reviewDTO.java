package jdbc;

import lombok.*;

@AllArgsConstructor
@Data
public class reviewDTO {
	private String fno, id, point, rcontent, rregtime, rupdatetime;

	public String getFno() {
		return fno;
	}

	public void setFno(String fno) {
		this.fno = fno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRregtime() {
		return rregtime;
	}

	public void setRregtime(String rregtime) {
		this.rregtime = rregtime;
	}

	public String getRupdatetime() {
		return rupdatetime;
	}

	public void setRupdatetime(String rupdatetime) {
		this.rupdatetime = rupdatetime;
	}

	public reviewDTO(String fno, String id, String point, String rcontent, String rregtime, String rupdatetime) {
		super();
		this.fno = fno;
		this.id = id;
		this.point = point;
		this.rcontent = rcontent;
		this.rregtime = rregtime;
		this.rupdatetime = rupdatetime;
	}

	public reviewDTO() {
	}
}
