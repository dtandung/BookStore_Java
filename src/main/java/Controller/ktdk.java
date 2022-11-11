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

/**
 * Servlet implementation class ktdk
 */
@WebServlet("/ktdk")
public class ktdk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktdk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			HttpSession session = request.getSession();
			String hoten = request.getParameter("fullname");
			String diachi = request.getParameter("address");
			String sdt = request.getParameter("phonenumber");
			String email = request.getParameter("email");
			String tendn = request.getParameter("username");
			String pass = request.getParameter("password");
			String passcon = request.getParameter("password_confirm");
			khachhangbo khbo = new khachhangbo();
			if(hoten != null && diachi != null && sdt != null && email != null && tendn != null && pass != null && passcon!= null) {
				if(pass.equals(passcon)) {
					int khbean = khbo.ktdk(hoten, diachi, sdt, email, tendn, pass);
					if(khbean == 1) {
						RequestDispatcher rd = request.getRequestDispatcher("ktdn");
						rd.forward(request, response);
					}
				}else {
					RequestDispatcher rd = request.getRequestDispatcher("FrmDangKy.jsp");
					rd.forward(request, response);
				}
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("FrmDangKy.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


//if (UserName != null && FullName != null && address != null && phonenumber != null
//&& confirm != null && Email != null && password != null) {
//if (password.equals(confirm)) {
//boolean kh = khbo.ktdk(FullName, address, phonenumber, Email, UserName, password);
//if (kh == true) {
//  RequestDispatcher rd = request.getRequestDispatcher("DangNhapController");
//  rd.forward(request, response);
//}
//} else {
//RequestDispatcher rd = request.getRequestDispatcher("DangKy.jsp");
//rd.forward(request, response);
//}
//
//} else {// chay lan dau
//RequestDispatcher rd = request.getRequestDispatcher("DangKy.jsp");
//rd.forward(request, response);
//}
//
//} catch (Exception e) {
//// TODO: handle exception
//}