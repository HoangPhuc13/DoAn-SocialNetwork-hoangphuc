package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class addFriendServlet
 */
@WebServlet("/controller/add-friend-servlet")
public class addFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addFriendServlet() {
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
			int userID = loggedUser.getId();
			String friendIdParams = request.getParameter("friendIdToAdd");
			if(friendIdParams != null && !friendIdParams.isEmpty()) {
				int friendIdToAdd = Integer.parseInt(friendIdParams);
				banBeDAO dao = new banBeDAO();
				 boolean success = dao.addFriend(userID, friendIdToAdd);
				 request.setAttribute("addFriendSuccess", success);
	                if (success) {
	                	banBe usersFriend = banBe.getDSBanBe(userID);
	                	String url = request.getParameter("url");
	                	request.getSession().setAttribute("userFriend", usersFriend);
	                	
	                	if (url !=null && url.equals("profile")) {
	                		response.sendRedirect(request.getContextPath()+"/profile-servlet?id="+friendIdToAdd);
	                	}
	                	else {
	                		ArrayList<taiKhoan> ls = (ArrayList<taiKhoan>) request.getSession().getAttribute("arrayList_TaiKhoans_SauKhiTimKiem");
	                		for (taiKhoan taiKhoan : ls) {
	                			if (taiKhoan.getId() == friendIdToAdd) {
	                				taiKhoan.setFriend(true);
	                				session.setAttribute("arrayList_TaiKhoans_SauKhiTimKiem", ls);
	                			}
	                		}
	                		response.sendRedirect(request.getContextPath()+"/search-friends.jsp");						
						}
	                	
	                } else {
	                	response.getWriter().write("fail");
	                    System.out.println(friendIdToAdd);
	                }
			}
			else {
				System.out.println(request.getParameter("friendIdToAdd"));
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
