	package controller;
	
	import java.io.IOException;
	
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
	 * Servlet implementation class FriendServlet
	 */
	@WebServlet("/controller/friend-servlet")
	public class FriendServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public FriendServlet() {
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
				banBe usersFriend = banBe.getDSBanBe(userId);
				request.getSession().setAttribute("userFriend", usersFriend);
				response.sendRedirect(request.getContextPath()+"/friends.jsp");				
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
