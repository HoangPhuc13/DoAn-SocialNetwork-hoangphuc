package model;

import java.util.ArrayList;

import data_access.banBeDAO;

public class banBe {
	private int taiKhoan_id;
	private ArrayList<taiKhoan> ListbanBe;
	private static banBeDAO DAO = new banBeDAO();
	
	public banBe(int taiKhoan_id, ArrayList<taiKhoan> listbanBe) {
		super();
		this.taiKhoan_id = taiKhoan_id;
		ListbanBe = listbanBe;
	}

	public int getTaiKhoan_id() {
		return taiKhoan_id;
	}

	public void setTaiKhoan_id(int taiKhoan_id) {
		this.taiKhoan_id = taiKhoan_id;
	}

	public ArrayList<taiKhoan> getListbanBe() {
		return ListbanBe;
	}

	public void setListbanBe(ArrayList<taiKhoan> listbanBe) {
		ListbanBe = listbanBe;
	}
	
	public static banBe getDSBanBe(int id) {
		return DAO.getUserFriends(id);
	}

}
