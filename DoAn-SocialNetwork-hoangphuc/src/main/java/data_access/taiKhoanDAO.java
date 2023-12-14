package data_access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.mysql.cj.jdbc.JdbcConnection;

import model.taiKhoan;

public class taiKhoanDAO implements IDataAccess<taiKhoan> {
	
	public static boolean updateUserAvatar(String path, String taikhoan) {
		String sql = "UPDATE taikhoan set anhDaiDien = ? WHERE taiKhoan = ?";
		
		try (Connection con = JDBCUtil.getConnection()){
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, path);
			p.setString(2, taikhoan);
			p.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public boolean checkTaiKhoanIfExist(String taikhoan) {
		Connection connection = JDBCUtil.getConnection();
		
		try {
			String sql = "SELECT * FROM taikhoan WHERE taiKhoan = ?";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, taikhoan);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				return false;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return true;
	}
	
	@Override
	public boolean insert(taiKhoan t) {
		Connection con = JDBCUtil.getConnection();
		
		try {
			String sql = "INSERT INTO `dbmangxahoi`.`taikhoan` (`taiKhoan`, `matKhau`,`anhDaiDien`, `hoTen`, `diaChi`, `email`, `soDienThoai`, `gioiTinh`) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, t.getTaiKhoan());
			st.setString(2, t.getMatKhau());
			st.setString(3, t.getAnhDaiDien().trim());
			st.setString(4, t.getHoTen());			
			st.setString(5, t.getDiaChi());			
			st.setString(6, t.getEmail());			
			st.setString(7, t.getSoDienThoai());			
			st.setBoolean(8, t.isGioiTinh());	
			
			st.executeUpdate();
			
			JDBCUtil.closeConnection(con);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.closeConnection(con);
		return false;
	}

	@Override
	public boolean delete(taiKhoan t) {
		
		return false;
	}

	@Override
	public boolean update(taiKhoan t) {
		Connection con = JDBCUtil.getConnection();
		
		try {
			String sql = "UPDATE `dbmangxahoi`.`taikhoan` SET `taiKhoan`=?, `matKhau`=?, "
					+ "`anhDaiDien`=?, `hoTen`=?, `diaChi`=?, `email`=?, `soDienThoai`=?, `gioiTinh`=? "
					+ "WHERE `id`=?;";
			
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, t.getTaiKhoan());
			st.setString(2, t.getMatKhau());
			st.setString(3, t.getAnhDaiDien().trim());
			st.setString(4, t.getHoTen());			
			st.setString(5, t.getDiaChi());			
			st.setString(6, t.getEmail());			
			st.setString(7, t.getSoDienThoai());			
			st.setBoolean(8, t.isGioiTinh());
			st.setInt(9, t.getId());
			
			st.executeUpdate();
			
			JDBCUtil.closeConnection(con);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.closeConnection(con);
		return false;
	}
	public boolean updateProfile(taiKhoan t) {
		Connection con = JDBCUtil.getConnection();
		
		try {
			String sql = "UPDATE `dbmangxahoi`.`taikhoan` SET `taiKhoan`=?, "
					+ "`anhDaiDien`=?, `hoTen`=?, `diaChi`=?, `email`=?, `soDienThoai`=?, `gioiTinh`=? "
					+ "WHERE `id`=?;";
			
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, t.getTaiKhoan());
			st.setString(2, t.getAnhDaiDien().trim());
			st.setString(3, t.getHoTen());			
			st.setString(4, t.getDiaChi());			
			st.setString(5, t.getEmail());			
			st.setString(6, t.getSoDienThoai());			
			st.setBoolean(7, t.isGioiTinh());
			st.setInt(8, t.getId());
			
			st.executeUpdate();
			
			JDBCUtil.closeConnection(con);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.closeConnection(con);
		return false;
	}

	@Override
	public taiKhoan selectById(int id) {
		taiKhoan found = null;
		Connection con = JDBCUtil.getConnection();

		try {

			String sql = "SELECT * FROM taikhoan WHERE id=?";
			PreparedStatement st = con.prepareStatement(sql);	
			st.setInt(1, id);

			ResultSet rs = st.executeQuery();

			if (rs.next()) {
				found = new taiKhoan(rs.getInt("id"), rs.getString("taiKhoan"), rs.getString("anhDaiDien"), rs.getString("hoTen"),
									 rs.getBoolean("gioiTinh"), rs.getString("diaChi"), 
									 rs.getString("email"), rs.getString("soDienThoai"), rs.getString("status"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.closeConnection(con);
		return found;
	}
	public taiKhoan selectByUserNamePassword(String username, String password) {
		taiKhoan found = null;
		Connection con = JDBCUtil.getConnection();

		try {

			String sql = "SELECT * FROM taikhoan WHERE taiKhoan = ? AND matKhau = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);
			st.setString(2, password);

			ResultSet rs = st.executeQuery();

			if (rs.next()) {
				found = new taiKhoan(rs.getInt("id"), rs.getString("taiKhoan"), rs.getString("anhDaiDien"), rs.getString("hoTen"),
						 rs.getBoolean("gioiTinh"), rs.getString("diaChi"), 
						 rs.getString("email"), rs.getString("soDienThoai"), rs.getString("status"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.closeConnection(con);
		return found;
	}

	@Override
	 public ArrayList<taiKhoan> selectAll() {
	  // TODO Auto-generated method stub
	  ArrayList<taiKhoan> taiKhoans = new ArrayList<taiKhoan>();
	  Connection con = JDBCUtil.getConnection();

	  try {
	   String sql = "SELECT * FROM taikhoan;";

	   PreparedStatement st = con.prepareStatement(sql);

	   ResultSet rs = st.executeQuery();

	   while (rs.next()) {
	    taiKhoan taikhoan = new taiKhoan(rs.getInt("id"), rs.getString("taiKhoan"), rs.getString("anhDaiDien"),
	      rs.getString("hoTen"), rs.getBoolean("gioiTinh"), rs.getString("diaChi"), rs.getString("email"),
	      rs.getString("soDienThoai"), rs.getString("status"));
	    taiKhoans.add(taikhoan);
	   }

	   JDBCUtil.closeConnection(con);
	   return taiKhoans;
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }
	  JDBCUtil.closeConnection(con);
	  return taiKhoans;
	 }

	
	
	public static void main(String[] args) {

	}
		
		
		
	
}
