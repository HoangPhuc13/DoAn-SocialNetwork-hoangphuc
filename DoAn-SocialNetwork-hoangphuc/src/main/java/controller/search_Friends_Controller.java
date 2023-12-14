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
import model.taiKhoan;

@WebServlet(urlPatterns = {"/search-friends"})
public class search_Friends_Controller extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public search_Friends_Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		taiKhoan loggedUser = (taiKhoan) request.getSession().getAttribute("loggedInUser");
		if(loggedUser != null) {
			int userId = loggedUser.getId();
			request.setCharacterEncoding("UTF-8");
			doGet(request, response);
			String input_Search = removeVietnameseAccent(request.getParameter("keyWord").trim());
			
			taiKhoan taiKhoan = new taiKhoan();
			ArrayList<taiKhoan> arrayList_TaiKhoans = taiKhoan.selectAll();
			
			
			ArrayList<taiKhoan> arrayList_TaiKhoans_SauKhiTimKiem = new ArrayList<taiKhoan>();
			banBeDAO dao = new banBeDAO();
			for (taiKhoan tk : arrayList_TaiKhoans) {
				
				if (tk.getId() == userId) continue;
				
				// Tìm kiếm theo tên
				String nameToFind = tk.getHoTen();
				if (nameToFind != null) {
					nameToFind = nameToFind.toLowerCase();
					if (nameToFind.contains(input_Search.toLowerCase()) || removeVietnameseAccent(nameToFind).contains(input_Search)){
						boolean isFriend = dao.checkFriendship(userId, tk.getId());
						tk.setFriend(isFriend);
						arrayList_TaiKhoans_SauKhiTimKiem.add(tk);
						
					}
				}
				// Tìm kiếm theo số điện thoại
				String sdtToFind = tk.getSoDienThoai();
				if (sdtToFind != null) {
					if (sdtToFind.contains(input_Search)){
						boolean isFriend = dao.checkFriendship(userId, tk.getId());
						tk.setFriend(isFriend);
						arrayList_TaiKhoans_SauKhiTimKiem.add(tk);
					}		
				}
//				// Tìm kiếm theo email
//				String emailToFind = tk.getEmail();
//				if (emailToFind != null && emailToFind.contains(input_Search.toLowerCase())) {
//					boolean isFriend = dao.checkFriendship(userId, tk.getId());
//					tk.setFriend(isFriend);
//					arrayList_TaiKhoans_SauKhiTimKiem.add(tk);
//				}
				
			}
			
			
////		 Đặt danh sách vào phạm vi của request
//        request.setAttribute("arrayList_TaiKhoans_SauKhiTimKiem", arrayList_TaiKhoans_SauKhiTimKiem);
//
//        // Chuyển hướng đến trang JSP
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/search-friends.jsp");
//        dispatcher.forward(request, response);
			
			session.setAttribute("arrayList_TaiKhoans_SauKhiTimKiem", arrayList_TaiKhoans_SauKhiTimKiem);
			response.sendRedirect(request.getContextPath() + "/search-friends.jsp");
		}
		else {
			response.sendRedirect(request.getContextPath()+"/login&register.jsp");
		}
	}
	
	 private String removeVietnameseAccent(String str) {
		   // Chuyển đổi từ tiếng Việt có dấu sang tiếng Việt không dấu
		 return java.text.Normalizer.normalize(str, java.text.Normalizer.Form.NFD)
		            .replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
	  }

}
