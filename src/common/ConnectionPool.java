package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
JNDI(Java Naming and Directory Interface)
	: 디렉토리 서비스에서 제공하는 데이터 및 객체를 찾아서
	참고(lookup)하는 API로 쉽게말하면 외부에 있는 객체를
	일므으로 찾아오기 위한 기술이다.
	
DBCP(DataBase Connection Pool : 커넥션풀)
	: DB와 연결된 커넥션 객체를 미리 만들어 풀(Pool)에 저장해 뒀다가
	필요할때 가져다쓰고 반납하는 기법을 말한다. DB의 부하를 줄이고
	자원을 효율적으로 관리할 수 있다. 게임에서는 풀링시스템(Pooling System)
	이라는 용어로 사용한다.
 */
public class ConnectionPool {
	
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public ConnectionPool() {
		try {
			/*
			1. initialContext객체를 생성한다.
			 */
			Context initCtx = new InitialContext();
			/*
			2. 앞에서 생성한 객체를 통해 JNDI서비스 구조의 초기 ROOT디렉토리를 얻어온다.
			여기서 얻어오는 톰캣의 루트 디렉토리명은 java:comp/env로 이미 정해져
			있으므로, 그대로 사용하면 된다.
			 */
			//Context ctx = (Context)initCtx.lookup("java:comp/env");
			/*
			3. server.xml에 등록한 네이밍을 lookup하여 DataSource를 얻어온다.
			해당 데이터소스는 DB에 연결된 정보를 가지고 있다.
			 */
			//DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
			
			//위 2,3은 하나로 합칠 수 있다.
			DataSource source = (DataSource)initCtx.lookup("java:comp/env/dbcp_myoracle");
					
			/*
			4. 커넥션풀에 톰켓이 생성해 놓은 커넥션 객체를 가져다가 사용한다.
			 */
			con = source.getConnection();
			System.out.println("DB ConnectionPool 연결성공");
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB ConnectionPool 연결실패");
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
			System.out.println("DB ConnectionPool 자원반납시 예외 발생");
		}
	}
	
}
