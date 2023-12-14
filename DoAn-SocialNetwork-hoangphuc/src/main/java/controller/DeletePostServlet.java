package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data_access.BaiVietDAO;
import model.baiViet;

/**
 * Servlet implementation class DeletePostServlet
 */
@WebServlet("/delete-post-servlet")
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePostServlet() {
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
		int postId = Integer.parseInt(request.getParameter("postId"));
		System.out.println("delete post id: " + postId);
		BaiVietDAO baiVietDAO = new BaiVietDAO();
		baiViet baiViet = baiVietDAO.selectById(postId);
		System.out.println(baiViet);
		if (baiVietDAO.delete(baiViet)) {
			System.out.println("Xóa bài viết thành công");
		} else {
			System.out.println("Xóa bài viết thất bại");
		}
		
		
		response.sendRedirect(request.getServletContext().getContextPath()+"/newsfeed.jsp");
	}

}
