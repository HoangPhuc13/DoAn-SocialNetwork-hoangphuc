package model;

import java.sql.Timestamp;


public class binhLuan {
	private int id;
	private int baiViet_id;
	private int taiKhoan_id;
	private String noiDung;
	private Timestamp ngayTao;
	private int binhLuanCha;
	
	
	public binhLuan() {
		super();
	}


	public binhLuan(int id, int baiViet_id, int taiKhoan_id, String noiDung, Timestamp ngayTao, int binhLuanCha) {
		super();
		this.id = id;
		this.baiViet_id = baiViet_id;
		this.taiKhoan_id = taiKhoan_id;
		this.noiDung = noiDung;
		this.ngayTao = ngayTao;
		this.binhLuanCha = binhLuanCha;
	}

	
	

	public binhLuan(int baiViet_id, int taiKhoan_id, String noiDung) {
		super();
		this.baiViet_id = baiViet_id;
		this.taiKhoan_id = taiKhoan_id;
		this.noiDung = noiDung;
	}

	

	public binhLuan(int baiViet_id, int taiKhoan_id, String noiDung, Timestamp ngayTao) {
		super();
		this.baiViet_id = baiViet_id;
		this.taiKhoan_id = taiKhoan_id;
		this.noiDung = noiDung;
		this.ngayTao = ngayTao;
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


	public String getNoiDung() {
		return noiDung;
	}


	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}


	public Timestamp getNgayTao() {
		return ngayTao;
	}


	public void setNgayTao(Timestamp ngayTao) {
		this.ngayTao = ngayTao;
	}


	public int getBinhLuanCha() {
		return binhLuanCha;
	}


	public void setBinhLuanCha(int binhLuanCha) {
		this.binhLuanCha = binhLuanCha;
	}


	@Override
	public String toString() {
		return "binhLuan [id=" + id + ", baiViet_id=" + baiViet_id + ", taiKhoan_id=" + taiKhoan_id + ", noiDung="
				+ noiDung + ", ngayTao=" + ngayTao + ", binhLuanCha=" + binhLuanCha + "]";
	}
	
	
	
	
}	
