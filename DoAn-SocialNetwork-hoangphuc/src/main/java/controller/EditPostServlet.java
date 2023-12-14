package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data_access.BaiVietDAO;
import data_access.taiKhoanDAO;
import model.baiViet;
import model.taiKhoan;

/**
 * Servlet implementation class EditPostServlet
 */
@WebServlet("/edit-post-servlet")
public class EditPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPostServlet() {
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
		
		
		int postId = Integer.parseInt(request.getParameter("postId"));
		System.out.println("postId:" + postId);
		BaiVietDAO baiVietDAO = new BaiVietDAO();
		baiViet baiViet = baiVietDAO.selectById(postId);
		taiKhoanDAO taiKhoanDAO = new taiKhoanDAO();
		taiKhoan tk = taiKhoanDAO.selectById(baiViet.getTaiKhoan_id());
		
		HttpSession sessionPost = request.getSession();
		sessionPost.setAttribute("postInfo", baiViet);
		sessionPost.setAttribute("userPostInfo", tk);
		
		
		
		
		//response.getWriter().write("editPost.jsp");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/editPost.jsp");
		dispatcher.forward(request, response);
	}

}
