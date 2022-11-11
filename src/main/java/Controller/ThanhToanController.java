package Controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giohangbean;
import bean.khachhangbean;
import bo.chitiethoadonbo;
import bo.giohangbo;
import bo.hoadonbo;

/**
 * Servlet implementation class ThanhToanController
 */
@WebServlet(urlPatterns = { "/thanh-toan","/thanh-toan/chap-nhan"})
public class ThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	private hoadonbo hoaDonBo;

	private chitiethoadonbo chiTietHDBo;

	@Override
	public void init() throws ServletException {
		hoaDonBo = new hoadonbo();

		chiTietHDBo = new chitiethoadonbo();
	}

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    protected void getThanhToanLayout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	RequestDispatcher rd = request.getRequestDispatcher("thanhtoan.jsp");
		rd.forward(request, response);
    }
    
    protected void thanhToan(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	HttpSession session = request.getSession();
    	
    	khachhangbean kh = (khachhangbean) session.getAttribute("khachhang");
    	
    	giohangbo gh = (giohangbo) session.getAttribute("gio");

		int maHDRT = hoaDonBo.ThemHoadon(kh.getMakh(), new Date(), true);
		if (maHDRT != 0) {
			for (giohangbean item : gh.ds) {
				chiTietHDBo.ThemChiTietHoaDon(item.getMasach(), item.getSoluong(), (long) maHDRT, true);
			}
		}
		gh.xoaTC();
		
		session.setAttribute("success", "success");
		
		response.sendRedirect("/JavanangcaoNhom04/htgio_Controller");
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getServletPath();

		
		try {
			if(uri.contains("/chap-nhan")) {
				thanhToan(request, response);
			}
			
			else {
				getThanhToanLayout(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		
//		RequestDispatcher rd = request.getRequestDispatcher("thanhtoan.jsp");
//		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
