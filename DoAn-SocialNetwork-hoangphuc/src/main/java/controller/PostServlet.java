package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import data_access.BaiVietDAO;
import model.baiViet;
import model.taiKhoan;

/**
 * Servlet implementation class PostServlet
 */ 
@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/post-servlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String content = request.getParameter("content");
		File dir = new File(request.getServletContext().getRealPath("/post-image"));
		System.out.println("request.getServletContext(): " + request.getServletContext());
		System.out.println("request.getServletContext().getRealPath(\"/post-image\"): " + request.getServletContext().getRealPath("/post-image"));
		System.out.println("request.getContextPath(): " + request.getContextPath());
		
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		// Lưu hình ảnh vào tệp tin
		Part image = request.getPart("inputImage");
		System.out.println("image: " + image);
		System.out.println("image.getSubmittedFileName(): " + image.getSubmittedFileName());
		File imagePost = null;
		if (image != null && image.getSize() > 0) {
			imagePost = new File(dir, image.getSubmittedFileName());
			System.out.println("imagePost: " + imagePost);
			System.out.println("imagePost.getAbsolutePath(): " + imagePost.getAbsolutePath());
			image.write(imagePost.getAbsolutePath());
		} else {
			// Không có hình ảnh được tải lên, không cần ghi vào tệp tin
		    System.out.println("Không có hình ảnh được tải lên.");
		}
		
		
		
		
		
		// Lấy dữ liệu hình ảnh từ tệp tin lên
		String getImagePost = null;
		if (imagePost != null) {
			getImagePost = request.getContextPath()+"/post-image/" + imagePost.getName();
		}
		
		// Lấy ra user đang đăng nhập để lấy ra id user đó
		HttpSession session = request.getSession();
		taiKhoan tk = (taiKhoan)session.getAttribute("loggedInUser");
		int idTK = tk.getId();
		
		// Khởi tạo đối tượng bài viết
		baiViet bv = new baiViet(idTK, content, getImagePost);
		BaiVietDAO baiVietDAO = new BaiVietDAO();
		if (baiVietDAO.insert(bv)) {
			System.out.println("Lưu bài viết thành công");
		}
		
		//RequestDispatcher rd = request.getRequestDispatcher("/testLoadAllNewsFeed.jsp");
		//rd.forward(request, response);
		response.sendRedirect(request.getServletContext().getContextPath()+"/newsfeed.jsp");
	}

}
