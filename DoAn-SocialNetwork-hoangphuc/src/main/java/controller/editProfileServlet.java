package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.taiKhoan;

/**
 * Servlet implementation class editProfieServlet
 */
@WebServlet("/controller/edit-profile-servlet")
public class editProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append("editprofile");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		taiKhoan edit_tk = (taiKhoan) request.getSession().getAttribute("loggedInUser");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phone_number");
		String sex = request.getParameter("gender");
		Boolean gender = false;
		if (sex.equalsIgnoreCase("male")) {
			gender = true;
		}
		String address = request.getParameter("address");
		
		edit_tk.setHoTen(name);
		edit_tk.setEmail(email);
		edit_tk.setSoDienThoai(phone_number);
		edit_tk.setGioiTinh(gender);
		edit_tk.setDiaChi(address);
		
		
		taiKhoan.updateUserProfile(edit_tk);
		
		request.getSession().setAttribute("loggedInUser", edit_tk);
		
		response.sendRedirect(request.getContextPath()+"/edit-profile.jsp");
		
	}

}
