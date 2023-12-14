package model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import data_access.taiKhoanDAO;

public class taiKhoan {
	private int id;
	private String taiKhoan;
	private String matKhau;
	private String anhDaiDien;
	private String hoTen;
	private boolean gioiTinh;
	private String diaChi;
	private String email;
	private String soDienThoai;
	private String status;
	private static taiKhoanDAO taiKhoanDAO = new taiKhoanDAO();
	private boolean friend;
	
	
	public taiKhoan(String taiKhoan) {
		super();
		this.taiKhoan = taiKhoan;
	}
	public boolean isFriend() {
		return friend;
	}
	public void setFriend(boolean friend) {
		this.friend = friend;
	}
	public taiKhoan(int id, String taiKhoan, String matKhau, String anhDaiDien, String hoTen, boolean gioiTinh,
			String diaChi, String email, String soDienThoai, String status) {
		super();
		this.id = id;
		this.taiKhoan = taiKhoan;
		this.matKhau = matKhau;
		this.anhDaiDien = anhDaiDien;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.email = email;
		this.soDienThoai = soDienThoai;
		this.status = status;
	}

	public taiKhoan(int id, String taiKhoan, String matKhau, String hoTen, boolean gioiTinh, String email) {
		super();
		this.id = id;
		this.taiKhoan = taiKhoan;
		this.matKhau = matKhau;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.email = email;
	}
	
	public taiKhoan(int id, String taiKhoan, String anhDaiDien, String hoTen, boolean gioiTinh,
			String diaChi, String email, String soDienThoai, String status) {
		super();
		this.id = id;
		this.taiKhoan = taiKhoan;
		this.anhDaiDien = anhDaiDien;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.email = email;
		this.soDienThoai = soDienThoai;
		this.status = status;
	}

	public taiKhoan(int id, String anhDaiDien, String hoTen) {
		super();
		this.id = id;
		this.anhDaiDien = anhDaiDien;
		this.hoTen = hoTen;
	}

	public taiKhoan() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(String taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getAnhDaiDien() {
		return anhDaiDien;
	}

	public void setAnhDaiDien(String anhDaiDien) {
		this.anhDaiDien = anhDaiDien;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public boolean isGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	
	private static String sha256Hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = md.digest(input.getBytes());

            // Chuyển mảng byte thành chuỗi hex
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
	
	
	public static taiKhoan authenticateUser(String taiKhoan, String matKhau) {	
		
		String hashMatKhau = sha256Hash(matKhau);
		
		taiKhoan result = taiKhoanDAO.selectByUserNamePassword(taiKhoan, hashMatKhau);
			
		return result;
		
	}
	
	public static boolean createNewUser(taiKhoan newUser) {
		
		String hashMatKhau = sha256Hash(newUser.getMatKhau());
		newUser.setMatKhau(hashMatKhau);
		
		boolean result = taiKhoanDAO.insert(newUser);
		
		return result;
	}
	public static boolean updateUser(taiKhoan updateUser) {
		
		String hashMatKhau = sha256Hash(updateUser.getMatKhau());
		updateUser.setMatKhau(hashMatKhau);
		
		boolean result = taiKhoanDAO.update(updateUser);
		
		return result;
	}
	public static boolean updateUserProfile(taiKhoan updateUser) {
		
		boolean result = taiKhoanDAO.updateProfile(updateUser);
		
		return result;
	}
	public ArrayList<taiKhoan> selectAll(){
		return taiKhoanDAO.selectAll();
	}
	public static taiKhoan getById(int id) {
		return taiKhoanDAO.selectById(id);
	}
}
