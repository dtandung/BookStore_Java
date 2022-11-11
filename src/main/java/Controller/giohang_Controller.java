package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;

/**
 * Servlet implementation class giohang_Controller
 */
@WebServlet("/giohang_Controller")
public class giohang_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public giohang_Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String masach = request.getParameter("ms");
		String tensach = request.getParameter("ts");
		long gia = Long.parseLong(request.getParameter("gia"));
		//if (masach != null) {
			giohangbo gh = null;
			// Neu mua hang lan dau
			if (session.getAttribute("gio") == null) {
				gh = new giohangbo();// cap vung nho
				session.setAttribute("gio", gh);// tao session
			}
			// b1: Luu session ra bien
			gh = (giohangbo) session.getAttribute("gio");
			// b2: Thao tac tren bien
			gh.Them(masach, tensach, gia, (long) 1);
			// b3: Luu bien vao session
			session.setAttribute("gio", gh);

		response.sendRedirect("htgio_Controller");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
