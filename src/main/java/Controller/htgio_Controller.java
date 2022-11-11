package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giohangbean;
import bean.khachhangbean;
import bean.loaibean;
import bean.sachbean;
import bo.chitiethoadonbo;
import bo.giohangbo;
import bo.hoadonbo;
import bo.loaibo;
import bo.sachbo;


/**
 * Servlet implementation class htgio_Controller
 */
@WebServlet(urlPatterns = { "/htgio_Controller", "/htgio_Controller/confirm" })
public class htgio_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;


	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public htgio_Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void gioHang(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String key = request.getParameter("txttk");
		String ml = request.getParameter("ml");

		loaibo lbo = new loaibo();
		ArrayList<loaibean> dsloai = lbo.getloai();
		request.setAttribute("dsloai", dsloai);

		sachbo sbo = new sachbo();
		ArrayList<sachbean> dssach = sbo.getsach();

		if (ml != null) {
			dssach = sbo.TimMa(ml);
		} else if (key != null) {
			dssach = sbo.Tim(key);
		}
		request.setAttribute("dssach", dssach);

		HttpSession session = request.getSession();
		giohangbo gh = (giohangbo) session.getAttribute("gio");
		if (gh != null) {
			if (request.getParameter("btnsl") != null) {
				String msach = request.getParameter("btnsl");
				long sl = Long.parseLong(request.getParameter("t" + msach));
				if (sl == 0) {
					gh.Xoa(msach);
				} else
					gh.Sua(msach, sl);

			}
			if (request.getParameter("btnxoa") != null) {
				String msach = request.getParameter("btnxoa");
				gh.Xoa(msach);

			}
			if (request.getParameter("btnxoaChon") != null) {
				String[] gtcheck = request.getParameterValues("check");
				if (gtcheck != null) {
					for (String ss : gtcheck)
						gh.Xoa(ss);
				}
			}

			if (request.getParameter("btnxoaAll") != null) {
				gh.xoaTC();
			}
			session.setAttribute("gio", gh);

		}
		RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
		rd.forward(request, response);
	}

	protected void xacNhanThanhToan(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		khachhangbean kh = (khachhangbean) session.getAttribute("khachhang");

		if (kh == null) {
			
			session.setAttribute("backToCart", "isBack");
			
			response.sendRedirect("/JavanangcaoNhom04/ktdn");
			return;
		}
		else {
			response.sendRedirect("/JavanangcaoNhom04/thanh-toan");
			return;
		}
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String uri = request.getServletPath();

		try {
			if (uri.contains("/confirm")) {
				xacNhanThanhToan(request, response);
			} else {
				gioHang(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

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
