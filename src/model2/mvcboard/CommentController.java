package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JSFunction;

/*
 한번의 매핑으로 여러 요청을 받을 수 있도록
 매핑명에 와일드카드를 사용했음.
 */
@WebServlet("*.comm")
public class CommentController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// 전송방식에 상관없이 요청을 받아서 분기하는 메소드.
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 요청명을 분석한다.
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);

		// 마지막 요청명을 통해 각 기능의 메소드를 호출한다.
		if (commandStr.equals("/commentWrite.comm")) {
			commentWrite(req, resp);
		}
		else if(commandStr.equals("/commentEdit.comm")) {
			//commentEdit(req,resp); 
		}
		else if(commandStr.equals("/commentEditAction.comm")) {
			//commentEditAction(req,resp); 
		}
		else if(commandStr.equals("/commentDelete.comm")) { 
			//commentDelete(req,resp); 
		}
		else if(commandStr.equals("/commentDeleteAction.comm")) {
			//commentDeleteAction(req,resp); 
		 }
	}

	private void commentWrite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		/*
		 * 서블릿에서 기능 처리를 위한 메소드는 doGet, doPost와 동일하게 request, response객체를 매개변수로 사용하고,
		 * ServletException, IOException에 대한 예외처리를 해주는 게 좋다.
		 */
		System.out.println("댓글쓰기");

		String board_idx = req.getParameter("board_idx");
		String name = req.getParameter("name");
		String pass = req.getParameter("pass");
		String comments = req.getParameter("comments");
		// DTO객체에 저장
		CommentDTO dto = new CommentDTO();
		dto.setBoard_idx(board_idx); 
		dto.setName(name);
		dto.setPass(pass);
		dto.setComments(comments);
		// DAO 객체 생성 및 메소드 호출
		CommentDAO dao = new CommentDAO();
		int result = dao.commentInsert(dto);
		if (result == 1) {
			/*
			 * 댓글 작성 완료 후 내용보기 페이지로 리다이렉트 할때 댓글목록 부분을 로드하기 위해 URL뒤에 앵커를 추가한다.
			 */
			resp.sendRedirect("./view.do?idx=" + board_idx + "#commentsList");
		} else {
			JSFunction.alertBack(resp, "댓글 작성에 실패하였습니다.");
		}
	}
}