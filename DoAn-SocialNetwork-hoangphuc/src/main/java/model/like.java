package model;

public class like {
	private int id;
	private int baiViet_id;
	private int taiKhoan_id;
	
	public like(int id, int baiViet_id, int taiKhoan_id) {
		super();
		this.id = id;
		this.baiViet_id = baiViet_id;
		this.taiKhoan_id = taiKhoan_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBaiViet_id() {
		return baiViet_id;
	}

	public void setBaiViet_id(int baiViet_id) {
		this.baiViet_id = baiViet_id;
	}

	public int getTaiKhoan_id() {
		return taiKhoan_id;
	}

	public void setTaiKhoan_id(int taiKhoan_id) {
		this.taiKhoan_id = taiKhoan_id;
	}
	
	
}
