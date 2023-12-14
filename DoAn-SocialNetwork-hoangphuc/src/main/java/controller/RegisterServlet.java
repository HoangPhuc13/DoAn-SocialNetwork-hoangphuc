package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MaHoa;
import data_access.taiKhoanDAO;
import model.taiKhoan;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/controller/register-servlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		
		// get value from input field
		String fullname = request.getParameter("fullname").trim();
		String username = request.getParameter("register_username").trim();
		String password = request.getParameter("password").trim();
		String radio = request.getParameter("radio");
		String email = request.getParameter("email").trim();
		boolean gender = false;
		if (radio.equals("male")) {
			gender = true;
		} 
		
		String thongBao = "";
		// create new user and insert new user to db
		
		taiKhoan tk = new taiKhoan(0, username, MaHoa.sha256Hash(password), fullname, gender, email);
		tk.setAnhDaiDien(request.getContextPath()+"/images/avatar-resource/default-avatar.png");
		taiKhoanDAO tkDao = new taiKhoanDAO();
		
		if (tkDao.checkTaiKhoanIfExist(username)) {
			tkDao.insert(tk);
			thongBao = "Đăng ký tài khoản thành công!";
			
			request.setAttribute("thongBao2", thongBao);
			request.setAttribute("show", "show");
			request.getRequestDispatcher("/login&register.jsp").forward(request, response);
			//response.sendRedirect(request.getContextPath() + "/login&register.jsp");
			
		} else {
			thongBao = "Tên tài khoản đã tồn tại vui lòng nhập tên tài khoản khác!";
			
			request.setAttribute("thongBao", thongBao);
			request.setAttribute("show", "show");
			request.getRequestDispatcher("/login&register.jsp").forward(request, response);
			//response.sendRedirect(request.getContextPath() + "/login&register.jsp");
		}
		
	}

}
