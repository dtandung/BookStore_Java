package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.loaibean;
import bean.sachbean;
import bo.loaibo;
import bo.sachbo;
import dao.sachdao;

/**
 * Servlet implementation class htsach_Controller
 */
@WebServlet("/htsach_Controller")
public class htsach_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public htsach_Controller() {
		super();
		// TODO Auto-generated constructor stub
		// .....
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// mvc => model view controller model => bean or entities controler => service
	// => dao
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String key = request.getParameter("txttk");
		String ml = request.getParameter("ml");

		loaibo lbo = new loaibo();
		ArrayList<loaibean> dsloai = lbo.getloai();
		request.setAttribute("dsloai", dsloai);

		sachbo sbo = new sachbo();
		ArrayList<sachbean> dssach = sbo.getsach();

		ArrayList<sachbean> dsSachFinal = null;

		// ------
		int getTotal = 0;

		int pageSize = 8;

		int totalPage = 0;

		String index = request.getParameter("index");

		if (index == null) {
			index = "1";
		}
		int indexPage = Integer.parseInt(index);

		if (ml == null && key == null) {

			getTotal = dssach.size();

			totalPage = getTotal / pageSize;

			if (getTotal % pageSize != 0) {
				totalPage++;
			}

			if (indexPage > totalPage) {
				indexPage = 1;
			}

			if (indexPage < 1) {
				indexPage = totalPage;
			}
			
			
			int pageSizeFinal = indexPage == totalPage ? dssach.size() : pageSize * indexPage;
			dsSachFinal = new ArrayList<sachbean>(dssach.subList(pageSize * (indexPage - 1), pageSizeFinal));
		}

		if (ml != null) {

			getTotal = sbo.TimMa(ml).size();

			totalPage = getTotal / pageSize;

			if (getTotal % pageSize != 0) {
				totalPage++;
			}

			if (indexPage > totalPage) {
				indexPage = 1;
			}

			if (indexPage < 1) {
				indexPage = totalPage;
			}

			int pageSizeFinal = (indexPage == totalPage || getTotal < pageSize) ? sbo.TimMa(ml).size() : pageSize * indexPage;
			dsSachFinal = new ArrayList<sachbean>(sbo.TimMa(ml).subList(pageSize * (indexPage - 1), pageSizeFinal));
		} else if (key != null) {
			getTotal = sbo.Tim(key).size();

			totalPage = getTotal / pageSize;

			if (getTotal % pageSize != 0) {
				totalPage++;
			}

			if (indexPage > totalPage) {
				indexPage = 1;
			}

			if (indexPage < 1) {
				indexPage = totalPage;
			}

			int pageSizeFinal = (indexPage == totalPage || getTotal < pageSize) ? sbo.Tim(key).size() : pageSize * indexPage;
			
			dsSachFinal = new ArrayList<sachbean>(sbo.Tim(key).subList(pageSize * (indexPage - 1), pageSizeFinal));
		}
		// ------

		request.setAttribute("dssach", dsSachFinal);

		request.setAttribute("indexPage", indexPage);

		request.setAttribute("totalPage", totalPage);

		request.setAttribute("index", index);

		request.setAttribute("txttk", key);
		
		request.setAttribute("ml", ml);

		RequestDispatcher rd = request.getRequestDispatcher("htsach.jsp");
		rd.forward(request, response);

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
