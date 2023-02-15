package jdbc;

public class userDTO {
	private String id, password, mail, mname;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public userDTO(String id, String password, String mail, String mname) {
		super();
		this.id = id;
		this.password = password;
		this.mail = mail;
		this.mname = mname;
	}
	
	
}
