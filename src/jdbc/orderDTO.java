package jdbc;

public class orderDTO {
	private String fno, id, menu, opro;
	
	
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

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getOpro() {
		return opro;
	}

	public void setOpro(String opro) {
		this.opro = opro;
	}

	public orderDTO(String fno, String id, String menu, String opro) {
		super();
		this.fno = fno;
		this.id = id;
		this.menu = menu;
		this.opro = opro;
	}
	public orderDTO() {
		
	}
}
