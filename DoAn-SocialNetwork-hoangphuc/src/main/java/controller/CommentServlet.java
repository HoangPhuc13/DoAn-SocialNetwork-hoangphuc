package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data_access.BinhLuanDAO;
import model.binhLuan;
import model.taiKhoan;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/comment-servlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		taiKhoan tk = (taiKhoan)session.getAttribute("loggedInUser");
		
		
		String comment = request.getParameter("user-comment");
		int baiViet_id = Integer.parseInt(request.getParameter("baiViet_id"));
		int taiKhoan_id = tk.getId();
		
		binhLuan binhLuan = new binhLuan(baiViet_id, taiKhoan_id, comment);
		
		BinhLuanDAO binhLuanDAO = new BinhLuanDAO();
		if (binhLuanDAO.insert(binhLuan)) {
			System.out.println("Them binh luan thanh cong!");
		}
		response.sendRedirect(request.getServletContext().getContextPath()+"/newsfeed.jsp");
	}

}
