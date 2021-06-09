package fileupload;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JConnect {
	
	Connection con; 
	PreparedStatement psmt;
	ResultSet rs;
	Statement stmt;

	public JConnect() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "kosmo";
			String pass = "1234";
			con = DriverManager.getConnection(url,id,pass);
				System.out.println("JConnect 연결성공");
		}
		catch(Exception e) {
			System.out.println("JConnect 연결시 예외발생");
		}
	}
	
	public JConnect(ServletContext application) {
		try {
			String drv = application.getInitParameter("JDBCDriver");
			String url = application.getInitParameter("ConnectionURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			
			Class.forName(drv);
			con = DriverManager.getConnection(url,id,pwd);
				System.out.println("JDBC 연결성공");
		}
		catch(Exception e) {
			System.out.println("JDBC 연결시 예외발생");
		} 
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {
			System.out.println("Oracle 자원반납시 예외발생");
		}
	}
}
