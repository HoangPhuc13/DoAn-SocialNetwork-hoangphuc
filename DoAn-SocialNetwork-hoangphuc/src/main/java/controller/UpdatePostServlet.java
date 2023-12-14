package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data_access.BaiVietDAO;
import model.baiViet;

/**
 * Servlet implementation class UpdatePost
 */
@WebServlet("/update-post-servlet")
public class UpdatePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePostServlet() {
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
		System.out.println("updatePost: " + postId);
		String noidung = request.getParameter("noidung");
		
		
		baiViet baiviet_update = new baiViet(postId, 0, noidung, null, null);
		
			
		
		
		BaiVietDAO baiVietDAO = new BaiVietDAO();
		baiVietDAO.update(baiviet_update);
		response.sendRedirect(request.getServletContext().getContextPath()+"/newsfeed.jsp");
	}

}
