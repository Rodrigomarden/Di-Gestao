package sgr;

public class Mesas {
	private int num_mesa;
	private String status;
	
	public Mesas() {
		
	}
	
	public Mesas(int num_mesa, String status) {
		this.num_mesa=num_mesa;
		this.status=status;
	}
	
	public int getNum_mesa() {
		return num_mesa;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setNum_mesa(int num_mesa) {
		this.num_mesa = num_mesa;
	}
	
}
