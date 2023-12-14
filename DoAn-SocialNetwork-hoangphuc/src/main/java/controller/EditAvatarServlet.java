package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import data_access.taiKhoanDAO;
import model.taiKhoan;

/**
 * Servlet implementation class EditProfile
 */

@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/edit-avatar-servlet")
public class EditAvatarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAvatarServlet() {
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
	 * @see HttpServlet#doPost(HttpSYervletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		File dir = new File(request.getServletContext().getRealPath("/avatar"));
		System.out.println("request.getServletContext(): " + request.getServletContext());
		System.out.println("request.getServletContext().getRealPath(\"/avatar\"): " + request.getServletContext().getRealPath("/avatar"));
		System.out.println("request.getContextPath(): " + request.getContextPath());
		
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		Part avatar = request.getPart("profile_avatar");
		File avatarFile = new File(dir, avatar.getSubmittedFileName());
		avatar.write(avatarFile.getAbsolutePath());
		//System.out.println(avatar.getSubmittedFileName());
		//System.out.println(avatarFile.getName());
		
		
		String newAvatarPath = request.getContextPath()+"/avatar/"+avatarFile.getName();
		HttpSession session = request.getSession();
		taiKhoan tk = (taiKhoan) session.getAttribute("loggedInUser");
		tk.setAnhDaiDien(newAvatarPath);
		taiKhoanDAO.updateUserAvatar(newAvatarPath, tk.getTaiKhoan());
		session.setAttribute("loggedInUser", tk);
		
		response.sendRedirect(request.getContextPath() + "/my-page.jsp");
	}

}
