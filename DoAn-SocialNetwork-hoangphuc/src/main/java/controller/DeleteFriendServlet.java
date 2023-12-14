package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data_access.banBeDAO;
import model.banBe;
import model.taiKhoan;

/**
 * Servlet implementation class DeleteFriendServlet
 */
@WebServlet("/controller/delete-friend-Servlet")
public class DeleteFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFriendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		taiKhoan loggedUser = (taiKhoan) request.getSession().getAttribute("loggedInUser");
		if(loggedUser != null) {
			int userId = loggedUser.getId();
			String friendIdParams = request.getParameter("friendIdToDelete");
			String url = request.getParameter("url");
			if(friendIdParams != null && !friendIdParams.isEmpty()) {
				int friendIdtoDelete = Integer.parseInt(friendIdParams);
				banBeDAO dao = new banBeDAO();
				boolean success = dao.deleteFriend(userId, friendIdtoDelete);
				if(success) {
					banBe usersFriend = banBe.getDSBanBe(userId);
                	request.getSession().setAttribute("userFriend", usersFriend);
                	
                	
                	if (url.equals("f")) {
                		response.sendRedirect(request.getContextPath()+"/friends.jsp");
                	}
                	else if (url.equals("s")) {
                		ArrayList<taiKhoan> ls = (ArrayList<taiKhoan>) request.getSession().getAttribute("arrayList_TaiKhoans_SauKhiTimKiem");
                		for (taiKhoan taiKhoan : ls) {
                			if (taiKhoan.getId() == friendIdtoDelete) {
    							taiKhoan.setFriend(false);
    							session.setAttribute("arrayList_TaiKhoans_SauKhiTimKiem", ls);
    						}
    					}
                		response.sendRedirect(request.getContextPath()+"/search-friends.jsp");
                	}
                	else if (url.equals("profile")) {
                		response.sendRedirect(request.getContextPath()+"/profile-servlet?id="+friendIdtoDelete);
                	}
				}
				else {
					response.getWriter().write("fail");
					System.out.println(friendIdtoDelete);
				}
				
			}
			else {
				System.out.println(request.getParameter("friendIdToDelete"));
			}	
		}
		else {
			response.sendRedirect(request.getContextPath()+"/login&register.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
