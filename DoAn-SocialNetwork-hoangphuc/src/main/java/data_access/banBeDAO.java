package data_access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import controller.changePasswrdServlet;
import model.banBe;
import model.taiKhoan;

public class banBeDAO {
	
	public banBe getUserFriends(int id) {
		ArrayList<taiKhoan> listBanBe = new ArrayList<taiKhoan>();
		Connection connection = null;
		try {
			connection = JDBCUtil.getConnection();
			String sql = "SELECT t.id, t.anhDaiDien, t.hoTen FROM taikhoan as t "
					+ "INNER JOIN banbe as b ON b.banbe_id = t.id "
					+ "WHERE b.taikhoan_id =? "
					+ "UNION "
					+ "SELECT t.id, t.anhDaiDien, t.hoTen FROM taikhoan as t "
					+ "INNER JOIN banbe as b ON b.taikhoan_id = t.id "
					+ "WHERE b.banbe_id = ?";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, id);
			st.setInt(2, id);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				int tk_id = rs.getInt("id");
				String anhDaiDien = rs.getString("anhDaiDien");
				String hoTen = rs.getString("hoTen");
				
				listBanBe.add(new taiKhoan(tk_id, anhDaiDien, hoTen));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			JDBCUtil.closeConnection(connection);
		}
		
		return new banBe(id, listBanBe);
	}
	 public boolean addFriend(int userId, int friendId) {
	        boolean success = false;
	        Connection connection = null;
	        try {
	            connection = JDBCUtil.getConnection();
	            String sql = "INSERT INTO banbe (taikhoan_id, banbe_id) VALUES (?, ?)";
	            PreparedStatement st = connection.prepareStatement(sql);
	            st.setInt(1, userId);
	            st.setInt(2, friendId);
	            int rowsAffected = st.executeUpdate();
	            
	            // Check if the query was successful (rows affected > 0)
	            if (rowsAffected > 0) {
	                success = true;
	            }
	        } catch (Exception e) {
	            // Handle exceptions
	        } finally {
	            JDBCUtil.closeConnection(connection);
	        }
	        return success;
	    }
	 public boolean deleteFriend(int userId, int friendId) {
		 boolean success = false;
		 Connection connection = null;
		 try {
			 connection = JDBCUtil.getConnection();
			 String sql = "DELETE FROM banbe WHERE taikhoan_id = ? AND banbe_id = ? OR taikhoan_id = ? AND banbe_id = ?";
			 PreparedStatement st = connection.prepareStatement(sql);
			 st.setInt(1, userId);
			 st.setInt(2, friendId);
			 st.setInt(3, friendId);
			 st.setInt(4, userId);
			 int rowsAffected = st.executeUpdate();
			 if(rowsAffected > 0) {
				 success = true;
			 }	 
		 }
		 catch(Exception e){
		 }
		 finally {
			 JDBCUtil.closeConnection(connection);
			 
		 }
		 return success;
	 }
	 public boolean checkFriendship(int userId1, int userId2) {
	        boolean isFriend = false;
	        Connection connection = null;
	        try {
	            connection = JDBCUtil.getConnection();
	            String sql = "SELECT * FROM banbe WHERE (taikhoan_id = ? AND banbe_id = ?) OR (taikhoan_id = ? AND banbe_id = ?)";
	            PreparedStatement st = connection.prepareStatement(sql);
	            st.setInt(1, userId1);
	            st.setInt(2, userId2);
	            st.setInt(3, userId2);
	            st.setInt(4, userId1);
	            ResultSet rs = st.executeQuery();

	            // Nếu có kết quả từ truy vấn, đồng nghĩa với việc họ đã là bạn bè
	            if (rs.next()) {
	                isFriend = true;
	            }
	        } catch (Exception e) {
	            // Xử lý ngoại lệ
	        } finally {
	            JDBCUtil.closeConnection(connection);
	        }
	        return isFriend;
	    }
}
