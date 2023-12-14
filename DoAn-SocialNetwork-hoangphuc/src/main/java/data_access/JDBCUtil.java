package data_access;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;	
import com.mysql.cj.jdbc.DatabaseMetaData;

public class JDBCUtil {

	public static Connection getConnection() {
			Connection c = null;
			
			try {
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				
				String url ="jdbc:mySQL://localhost:3306/dbmangxahoi";
				String username = "root";
				String password = "";
				
				c = DriverManager.getConnection(url, username, password);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			return c;
	}
	
	public static void closeConnection(Connection c) {
		try {
			if (c != null) {
				c.close();				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void printInfo (Connection c) {
		try {
			if(c!=null) {
				DatabaseMetaData m = (DatabaseMetaData) c.getMetaData();
				System.out.println(m.getDatabaseProductName());
				System.out.println(m.getDatabaseProductVersion());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
