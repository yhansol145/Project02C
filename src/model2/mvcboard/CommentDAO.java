package model2.mvcboard;

import java.util.List;
import java.util.Vector;

import common.ConnectionPool;

public class CommentDAO extends ConnectionPool {

	public CommentDAO() {
		super();
	}

	public int commentInsert(CommentDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO mycomment ("
					+ "idx, board_idx, name, pass, comments) " + " VALUES("
							+ " ?, ?, ?, ?, ? )";
//			String query = "INSERT INTO mycomment ( " + " idx, board_idx, name, pass, comments) " + " VALUES ( "
//					+ " ?,?,?,?)";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getIdx());
			psmt.setString(2, dto.getBoard_idx());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getPass());
			psmt.setString(5, dto.getComments());
			result = psmt.executeUpdate(); 

		} catch (Exception e) {
			System.out.println("댓글 입력중 예외발생");
			e.printStackTrace();
		}
		return result;
	}

	public List<CommentDTO> commentSelectList(String board_idx) {
		List<CommentDTO> comments = new Vector<CommentDTO>();

		String query = "SELECT idx, board_idx, name, pass, comments "
				+ " FROM mycomment " + " WHERE board_idx=? " + " ORDER BY idx DESC";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, board_idx);
			rs = psmt.executeQuery();

			while (rs.next()) {
				CommentDTO dto = new CommentDTO();

				dto.setIdx(rs.getInt(1));
				dto.setBoard_idx(rs.getString(2)); 
				dto.setName(rs.getString(3));
				dto.setPass(rs.getString(4));
				dto.setComments(rs.getString(5).replaceAll("\r\n", "<br/>"));
//				dto.setCommentsEdit(rs.getString(6));
//				dto.setRegidate(rs.getDate(6)); 

				comments.add(dto);
			}
		} catch (Exception e) {
			System.out.println("댓글 조회중 예외발생");
			e.printStackTrace();
		}
		return comments;
	}

}