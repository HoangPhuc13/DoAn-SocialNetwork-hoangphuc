package data_access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.binhLuan;
import model.taiKhoan;

public class BinhLuanDAO implements IDataAccess<binhLuan>{

	@Override
	public boolean insert(binhLuan t) {
		// TODO Auto-generated method stub
		try (Connection con = JDBCUtil.getConnection()){
			String sql = "INSERT INTO binhluan(baiviet_id, taikhoan_id, noidung, ngaytao, binhluancha) VALUES (?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getBaiViet_id());
			st.setInt(2, t.getTaiKhoan_id());
			st.setString(3, t.getNoiDung());
			st.setTimestamp(4, t.getNgayTao());
			st.setInt(5, t.getBinhLuanCha());
			
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return false;
	}

	@Override
	public boolean delete(binhLuan t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(binhLuan t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public binhLuan selectById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<binhLuan> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ArrayList<binhLuan> selectAllBinhLuanById(int id) {
		// TODO Auto-generated method stub
		ArrayList<binhLuan> arr = new ArrayList<binhLuan>();
		
		try (Connection con = JDBCUtil.getConnection()){
			String sql = "SELECT * FROM binhluan WHERE baiviet_id = ?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				int baiviet_id = rs.getInt("baiviet_id");
				int taikhoan_id = rs.getInt("taikhoan_id");
				String noidung = rs.getString("noidung");
				Timestamp ngaytao = rs.getTimestamp("ngaytao");
				binhLuan binhLuan = new binhLuan(baiviet_id, taikhoan_id, noidung, ngaytao);
				arr.add(binhLuan);
				
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return arr;
	}

	
	public static void main(String[] args) {
		BinhLuanDAO binhLuanDAO = new BinhLuanDAO();
		taiKhoanDAO taiKhoanDAO = new taiKhoanDAO();
		for (binhLuan binhLuan: binhLuanDAO.selectAllBinhLuanById(2)) {
			taiKhoan taiKhoan = taiKhoanDAO.selectById(binhLuan.getTaiKhoan_id());
			Timestamp ngaytao = binhLuan.getNgayTao();
			SimpleDateFormat formatNgayTao = new SimpleDateFormat("HH:mm dd-MM-yyyy");

			String avatar = taiKhoan.getAnhDaiDien();
			String name = taiKhoan.getHoTen();
			String noidung = binhLuan.getNoiDung();
			String formattedNgayTao = (ngaytao != null) ? formatNgayTao.format(ngaytao) : "N/A";
			System.out.println(avatar);
			System.out.println(name);
			System.out.println(noidung);
			System.out.println(formattedNgayTao);
		}
	}
}
