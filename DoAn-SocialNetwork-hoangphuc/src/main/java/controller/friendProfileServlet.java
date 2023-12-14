package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data_access.banBeDAO;
import model.banBe;
import model.taiKhoan;

/**
 * Servlet implementation class friendProfileServlet
 */
@WebServlet("/profile-servlet")
public class friendProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public friendProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int idToProfile = Integer.parseInt(id);
		taiKhoan tkToProfile = taiKhoan.getById(idToProfile);
		request.setAttribute("friendProfile", tkToProfile);		
		
		taiKhoan loggedUser = (taiKhoan) request.getSession().getAttribute("loggedInUser");
		if (loggedUser == null) {
			// check if haven't logged
			response.sendRedirect(request.getContextPath()+"/login&register.jsp");
		}
		int loogedUserId = loggedUser.getId();
		
		banBeDAO bbDao = new banBeDAO();
		boolean isFriend = bbDao.checkFriendship(loogedUserId, idToProfile);
		
		request.setAttribute("isFriend", isFriend);
		
		request.getRequestDispatcher("/profile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);	
		
	}

}
