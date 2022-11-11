package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bean.lichsumuahangbean;
import bo.lichsumuahangbo;

/**
 * Servlet implementation class LSMHController
 */
@WebServlet(urlPatterns = { "/LSMHController", "/LSMHController/check" })
public class LSMHController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private lichsumuahangbo lsb;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	@Override
	public void init() throws ServletException {
		lsb = new lichsumuahangbo();
	}

	public LSMHController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void getLayout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("LSMH.jsp");
		rd.forward(request, response);
	}

	protected void getHistory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();

			// lichsumuahangbo lsb = new lichsumuahangbo();
			khachhangbean khb = (khachhangbean) session.getAttribute("khachhang");
			if(khb != null) {
			ArrayList<lichsumuahangbean> lsmh = lsb.getlichsumuahang((int) khb.getMakh());
			request.setAttribute("lsmh", lsmh);
			getLayout(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			
			//lichsumuahangbo lsb = new lichsumuahangbo();
			khachhangbean khb =(khachhangbean) session.getAttribute("khachhang");
			
			ArrayList<lichsumuahangbean> lsmh = lsb.getlichsumuahang((int)khb.getMakh());
				request.setAttribute("lsmh", lsmh);	
			getLayout(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
//		  String uri = request.getServletPath();
//		  
//		  try {
//			  if(uri.contains("/check")) {
//				  getHistory(request, response);
//			}else {
//				  getLayout(request, response); 
//		  } } catch (Exception e) { // TODO: hand exception 
//		  e.printStackTrace(); }
		 
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
