package model.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class MembershipDAO {

	// DAO의 기본 멤버변수
	Connection con;// DB연결
	Statement stmt;// 정적 쿼리 전송 및 실행
	PreparedStatement psmt;// 동적 쿼리전송 및 실행
	ResultSet rs;// select결과반환

	public MembershipDAO() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mariadb://127.0.0.1:3306/suamil_db";
			String id = "suamil_user";
			String pass = "1234";
			con = DriverManager.getConnection(url, id, pass);
			System.out.println("Maria 연결성공");
		} catch (Exception e) {
			System.out.println("Maria 연결시 예외발생");
			e.printStackTrace();
		}
	}
	

	/*
	 * JSP에서 컨텍스트 초기화 파라미터를 읽어서 매개변수로 전달하여 DB연결을 하기위한 인자 생성
	 */
	public MembershipDAO(String drv, String url) {
		try {

			Class.forName(drv);
			String id = "suamil_user";
			String pass = "1234";
			con = DriverManager.getConnection(url, id, pass);
			System.out.println("Maria 연결성공");

		} catch (Exception e) {
			System.out.println("Maria 연결시 예외발생");
			e.printStackTrace();
		}
	}

	public Map<String, String> getMemberMap(String uid, String upass) {

		// 회원정보를 저장할 Map컬렉션 생성
		Map<String, String> maps = new HashMap<String, String>();

		String query = " SELECT id, pass, name FROM " + " member WHERE id=? AND pass=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			if (rs.next()) {
				maps.put("id", rs.getString(1)); // 아이디
				maps.put("pass", rs.getString(2)); // 패스워드
				maps.put("name", rs.getString("name")); // 이름
			} else {
				System.out.println("결과셋이 없습니다.");
			}
		} catch (Exception e) {
			System.out.println("getMemberMap오류");
			e.printStackTrace();
		}
		// Map컬렉션에 저장된 회원정보 반환
		return maps;
	}

	public MembershipDAO(ServletContext application) {
		try {
			String drv = application.getInitParameter("MariaJDBCDriver");
			String url = application.getInitParameter("MariaConnectURL");
			String id = application.getInitParameter("MariaUser");
			String pwd = application.getInitParameter("MariaPass");

			Class.forName(drv);
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("MariaDB 연결성공");
		} catch (Exception e) {
			System.out.println("MariaDB 연결시 예외발생");
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			System.out.println("MariaDB 자원반납시 예외발생");
		}
	}

	public int memberRegist(MembershipDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO member ( " + " id, pass, name, birth, zipcode, address, address2, "
					+ " email, mobile, tel) " + " VALUES ( " + " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getBirth());
			psmt.setString(5, dto.getZipcode());
			psmt.setString(6, dto.getAddress());
			psmt.setString(7, dto.getAddress2());
			psmt.setString(8, dto.getEmail());
			psmt.setString(9, dto.getMobile());
			psmt.setString(10, dto.getTel());
			// 쿼리문 실행
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원가입 처리중 예외발생");
			e.printStackTrace();
		}
		return result;
	}

	// 게시물 조회하기
	public MembershipDTO memberView(String Id) {
		MembershipDTO dto = new MembershipDTO();

		String query = "SELECT * FROM member " + " WHERE user_id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, Id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setBirth(rs.getString(4));
				dto.setZipcode(rs.getString(5));
				dto.setAddress(rs.getString(6));
				dto.setAddress2(rs.getString(7));
				dto.setEmail(rs.getString(8));
				dto.setMobile(rs.getString(9));
				dto.setTel(rs.getString(10));
				dto.setRegidate(rs.getDate(11));
			}
		} catch (Exception e) {
			System.out.println("회원정보 조회중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}

	public int memberCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM member ";
		// 검색 파라미터가 있는 경우라면 where절을 추가한다.
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 카운트중 예외발생");
			e.printStackTrace();
		}

		return totalCount;
	}

	public List<MembershipDTO> memberList(Map<String, Object> map) {

		List<MembershipDTO> members = new Vector<MembershipDTO>();

		String query = "SELECT * FROM member ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += " ORDER BY regidate DESC ";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				MembershipDTO dto = new MembershipDTO();

				dto.setId(rs.getString("Id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress2(rs.getString("address2"));
				dto.setEmail(rs.getString("email"));
				dto.setMobile(rs.getString("mobile"));
				dto.setTel(rs.getString("tel"));
				dto.setRegidate(rs.getDate("regidate"));

				members.add(dto);
			}
		} catch (Exception e) {
			System.out.println("회원 목록 조회1중 예외발생");
			e.printStackTrace();
		}
		return members;
	}

	// 게시판 목록 출력시 페이지 처리
	public List<MembershipDTO> memberListPage(Map<String, Object> map) {
		List<MembershipDTO> members = new Vector<MembershipDTO>();

		String query = " " + " SELECT * FROM ( " + "	 SELECT Tb.*, ROWNUM rNum FROM ( "
				+ "	    SELECT * FROM member ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += " " + "    	ORDER BY regidate DESC " + "    ) Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?";
		System.out.println("페이지쿼리:" + query);
		try {
			psmt = con.prepareStatement(query);
			// between절의 start와 end값을 인파라미터 설정
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				MembershipDTO dto = new MembershipDTO();

				dto.setId(rs.getString("Id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress2(rs.getString("address2"));
				dto.setEmail(rs.getString("email"));
				dto.setMobile(rs.getString("mobile"));
				dto.setTel(rs.getString("tel"));
				dto.setRegidate(rs.getDate("regidate"));

				members.add(dto);
			}
		} catch (Exception e) {
			System.out.println("회원 목록 조회2중 예외발생");
			e.printStackTrace();
		}
		return members;
	}

	public int memberUpdate(MembershipDTO dto) {
		int result = 0;
		try {
			String query = "UPDATE member SET " + " Id=?, pass=?, name=?, birth=?, "
					+ " zipcode=?, address=?, address2=?, " + " email=?, mobile=?, tel=? " + " WHERE Id=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getBirth());
			psmt.setString(5, dto.getZipcode());
			psmt.setString(6, dto.getAddress());
			psmt.setString(7, dto.getAddress2());
			psmt.setString(8, dto.getEmail());
			psmt.setString(9, dto.getMobile());
			psmt.setString(10, dto.getTel());
			// 쿼리문 실행
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원가입 처리중 예외발생");
			e.printStackTrace();
		}
		return result;
	}

	public int memberDelete(String Id) {
		int result = 0;
		try {
			String query = "DELETE FROM member WHERE Id=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, Id);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제중 예외발생");
			e.printStackTrace();
		}
		return result;
	}

	public int insertWrite(MembershipDTO dto) {
		int result = 0;
		try {
			// 인파라미터가 있는 insert 쿼리문 작성
			String query = "INSERT INTO member ( "
					+ " Id, pass, name, birth, zipcode, address, address2, email, mobile, tel) " + " VALUES ( "
					+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
			// prepare객체 생성후 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getBirth());
			psmt.setString(5, dto.getZipcode());
			psmt.setString(6, dto.getAddress());
			psmt.setString(7, dto.getAddress2());
			psmt.setString(8, dto.getEmail());
			psmt.setString(9, dto.getMobile());
			psmt.setString(10, dto.getTel());
			// 쿼리문 실행
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력중 예외발생");
			e.printStackTrace();
		}
		return result;
	}

	public String findId(MembershipDTO member) throws Exception {

		String user_id = null;

		String sql = "SELECT Id FROM member WHERE name=? and email=?";

		try {
			psmt = con.prepareStatement(sql);

			psmt.setString(1, member.getName());
			psmt.setString(2, member.getEmail());

			System.out.println("이름 읽어오기 : " + member.getName());
			System.out.println("이메일 읽어오기 : " + member.getEmail());
			rs = psmt.executeQuery();
			if (rs.next()) {
				user_id = rs.getString("Id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			psmt.close();
			rs.close();

		}

		return user_id;
	}

	public String findPw(MembershipDTO member) throws Exception {

		String user_pw = null;

		String sql = "SELECT pass FROM member WHERE Id=? and email=?";

		try {
			psmt = con.prepareStatement(sql);

			psmt.setString(1, member.getId());
			psmt.setString(2, member.getEmail());

			System.out.println("이름 읽어오기 : " + member.getId());
			System.out.println("이메일 읽어오기 : " + member.getEmail());
			rs = psmt.executeQuery();
			if (rs.next()) {
				user_pw = rs.getString("pass");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			psmt.close();
			rs.close();

		}

		return user_pw;
	}
	
	public boolean checkId(String Id) {
	
		boolean check = false;
		
		try {
			con = DriverManager.getConnection(Id);
			String query = "SELECT * FROM member WHERE Id=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, Id);
			rs = psmt.executeQuery();
			check= rs.next();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("아이디 체크 중 예외발생");
		}
		
		return check;
		
	}
	
}
