package model;


import java.sql.Timestamp;


public class baiViet {
	private int id;
	private int taiKhoan_id;
	private String noiDung;
	private String hinhAnh;
	private Timestamp ngayDang;
	
	public baiViet(int id, int taiKhoan_id, String noiDung, String hinhAnh, Timestamp ngayDang) {
		super();
		this.id = id;
		this.taiKhoan_id = taiKhoan_id;
		this.noiDung = noiDung;
		this.hinhAnh = hinhAnh;
		this.ngayDang = ngayDang;
	}
	


	public baiViet(int taiKhoan_id, String noiDung, String hinhAnh, Timestamp ngayDang) {
		super();
		this.taiKhoan_id = taiKhoan_id;
		this.noiDung = noiDung;
		this.hinhAnh = hinhAnh;
		this.ngayDang = ngayDang;
	}

	

	public baiViet(int taiKhoan_id, String noiDung, String hinhAnh) {
		super();
		this.taiKhoan_id = taiKhoan_id;
		this.noiDung = noiDung;
		this.hinhAnh = hinhAnh;
	}

	







	






	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTaiKhoan_id() {
		return taiKhoan_id;
	}

	public void setTaiKhoan_id(int taiKhoan_id) {
		this.taiKhoan_id = taiKhoan_id;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	public Timestamp getNgayDang() {
		return ngayDang;
	}

	public void setNgayDang(Timestamp ngayDang) {
		this.ngayDang = ngayDang;
	}



	@Override
	public String toString() {
		return "baiViet [id=" + id + ", taiKhoan_id=" + taiKhoan_id + ", noiDung=" + noiDung + ", hinhAnh=" + hinhAnh
				+ ", ngayDang=" + ngayDang + "]";
	}
	
	
}
