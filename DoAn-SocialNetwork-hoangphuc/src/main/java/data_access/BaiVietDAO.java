package data_access;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.baiViet;
import model.taiKhoan;

public class BaiVietDAO implements IDataAccess<baiViet>{

	@Override
	public boolean insert(baiViet t) {
		// TODO Auto-generated method stub
		try (Connection con = JDBCUtil.getConnection()){
			String sql = "INSERT INTO baiviet(taikhoan_id, noidung, hinhanh) VALUES (?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getTaiKhoan_id());
			st.setString(2, t.getNoiDung());
			st.setString(3, t.getHinhAnh());
			
			
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
	public boolean delete(baiViet t) {
		// TODO Auto-generated method stub
		try (Connection con = JDBCUtil.getConnection()){
			String sql = "DELETE FROM baiviet WHERE id = ?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getId());
			
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public boolean update(baiViet t) {
		// TODO Auto-generated method stub
		
		try (Connection con = JDBCUtil.getConnection()){
			String sql = "UPDATE baiviet SET noidung = ? WHERE id = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getNoiDung());
			st.setInt(2, t.getId());
			st.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public baiViet selectById(int id) {
		// TODO Auto-generated method stub
		baiViet bv = null;
		try (Connection con = JDBCUtil.getConnection()){
			String sql = "SELECT * FROM baiviet WHERE id = ?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				int baiviet_id = rs.getInt("id");
				int taikhoan_id = rs.getInt("taikhoan_id");
				String noidung = rs.getString("noidung");
				String hinhanh = rs.getString("hinhanh");
				Timestamp ngaydang = rs.getTimestamp("ngaydang");
				bv = new baiViet(baiviet_id, taikhoan_id, noidung, hinhanh, ngaydang);
				
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return bv;
	}

	@Override
	public ArrayList<baiViet> selectAll() {
		// TODO Auto-generated method stub
		ArrayList<baiViet> arrayList = new ArrayList<baiViet>();
		try (Connection con = JDBCUtil.getConnection()){
			String sql = "SELECT * FROM baiviet ORDER BY ngaydang DESC";
			
			PreparedStatement st = con.prepareStatement(sql);		
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				int id = rs.getInt("id");
				int taikhoan_id = rs.getInt("taikhoan_id");
				String noidung = rs.getString("noidung");
				String hinhanh = rs.getString("hinhanh");
				Timestamp ngaydang = rs.getTimestamp("ngaydang");
				baiViet bv = new baiViet(id, taikhoan_id, noidung, hinhanh, ngaydang);
				arrayList.add(bv);
				
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return arrayList;
	}
	
	public ArrayList<baiViet> selectAllById(taiKhoan tk) {
		// TODO Auto-generated method stub
		ArrayList<baiViet> arrayList = new ArrayList<baiViet>();
		try (Connection con = JDBCUtil.getConnection()){
			String sql = "SELECT * FROM baiviet WHERE taikhoan_id = ? ORDER BY ngaydang DESC";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, tk.getId());
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				int id = rs.getInt("id");
				int taikhoan_id = rs.getInt("taikhoan_id");
				String noidung = rs.getString("noidung");
				String hinhanh = rs.getString("hinhanh");
				Timestamp ngaydang = rs.getTimestamp("ngaydang");
				baiViet bv = new baiViet(id, taikhoan_id, noidung, hinhanh, ngaydang);
				arrayList.add(bv);
				
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return arrayList;
	}
	
	public static void main(String[] args) {
		BaiVietDAO baiVietDAO = new BaiVietDAO();
		baiVietDAO.update(new baiViet(34, 0, "Coder", null, null));
	}
}
