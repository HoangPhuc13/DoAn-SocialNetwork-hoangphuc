package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data_access.taiKhoanDAO;
import model.taiKhoan;

/**
 * Servlet implementation class changePasswrdServlet
 */
@WebServlet("/controller/change-password-servlet")
public class changePasswrdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePasswrdServlet() {
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
		
		
		HttpSession session = request.getSession();
		taiKhoan currentUser = (taiKhoan) session.getAttribute("loggedInUser");
		
		if (currentUser == null) {
			response.sendRedirect(request.getContextPath()+"/login&register.jsp");	
		} else {		
			String newPass = request.getParameter("newPass");
			String currPass = request.getParameter("currPass");
			String message = "";
			
			taiKhoan checkForCurrPass =  taiKhoan.authenticateUser(currentUser.getTaiKhoan(), currPass);
			
			if (checkForCurrPass == null) {
				message = "Mật khẩu hiện tại sai";
				
			}
			else {
				message = "Đổi mật khẩu thành công";
				currentUser.setMatKhau(newPass);
				taiKhoan.updateUser(currentUser);
			}
			String encodedMessage = URLEncoder.encode(message, "UTF-8");
			response.sendRedirect(request.getContextPath()+"/edit-password.jsp?Error="+encodedMessage);		
		}
		
		
	}

}
