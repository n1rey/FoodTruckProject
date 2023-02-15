package jdbc;

public class userDTO {
	private String id, pw, mail, mname;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public userDTO(String id, String pw, String mail, String mname) {
		super();
		this.id = id;
		this.pw = pw;
		this.mail = mail;
		this.mname = mname;
	}
	
	
}
