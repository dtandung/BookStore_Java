package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bo.khachhangbo;
import dao.khachhangdao;

/**
 * Servlet implementation class ktdn
 */
@WebServlet(urlPatterns = { "/ktdn", "/ktdn/login" })
public class ktdn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private khachhangbo khbo;
	
	//private static khachhangdao khdao;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ktdn() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void init() throws ServletException {
		khbo = new khachhangbo();
		//khdao = new khachhangdao();
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void getLoginPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		/*
		 * RequestDispatcher rd = request.getRequestDispatcher("Frmdangnhap.jsp");
		 * rd.forward(request, response);
		 */
		response.sendRedirect("Frmdangnhap.jsp");
	}

	protected void Login(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String un = request.getParameter("un");
		String pass = request.getParameter("pass");
		
		String passEncode = khachhangdao.getMd5Hash(pass);
		
		khachhangbean khbean = khbo.ktdn(un, passEncode);

		String isBackToCart = (String) session.getAttribute("backToCart");
		if (khbean != null) {
			//response.sendRedirect("LSMHController/check");
			session.setAttribute("khachhang", khbean);
			if (isBackToCart != null) {
				//session.removeAttribute("backToCart");
				response.sendRedirect("/JavanangcaoNhom04/thanh-toan");
				//return;
			} else {
				response.sendRedirect("/JavanangcaoNhom04/htsach_Controller");
				//return;
			}

		} else {// dang nhap sai
//			RequestDispatcher rd = request.getRequestDispatcher("Frmdangnhap.jsp?kt=1");
//			rd.forward(request, response);
			response.sendRedirect("/JavanangcaoNhom04/Frmdangnhap.jsp?kt=1");
			
		}
		getLoginPage(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {

		String uri = request.getServletPath();

		try {
			if (uri.contains("/login")) {
				Login(request, response);
			}

			getLoginPage(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		
//		try {
//			HttpSession session = request.getSession();
//			String un = request.getParameter("un");
//			String pass = request.getParameter("pass");
//			khachhangbo khbo = new khachhangbo();
//			khachhangdao khdao = new khachhangdao();
//			khachhangbean khbean = khbo.ktdn(un, pass);
//			if (khbean != null) {
////				if (request.getParameter("but1") != null) {
//					
//					boolean isBackToCart = (boolean) session.getAttribute("backToCart");
//					
//					if(isBackToCart) {
//						response.sendRedirect("thanh-toan");
//						System.out.println("back to cart");
//					}
//					else {
//						RequestDispatcher rd = request.getRequestDispatcher("htsach_Controller");
//						rd.forward(request, response);
//						
//						System.out.println("ok");
//					}
//					
//					session.setAttribute("khachhang", khbean);
//					
//				} else {// dang nhap sai
//					RequestDispatcher rd = request.getRequestDispatcher("Frmdangnhap.jsp?kt=1");
//					rd.forward(request, response);
//				}
////			} else
//
//			{// chay lan dau
//				RequestDispatcher rd = request.getRequestDispatcher("Frmdangnhap.jsp");
//				rd.forward(request, response);
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		RequestDispatcher rd = request.getRequestDispatcher("Frmdangnhap.jsp");
//		rd.forward(request, response);

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
