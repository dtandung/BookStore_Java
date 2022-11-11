package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Test
 */
@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//tao ra doi tuong out
		PrintWriter out = response.getWriter();
		//HttpSession session = request.getSession();
		//lay ve gia tri cua a va b
		String aa = request.getParameter("txtnum1");
		String bb = request.getParameter("txtnum2");
		long kq = 0;
		if(aa != null && bb != null) {
			long a = Long.parseLong(aa);
			long b = Long.parseLong(bb);
			if(request.getParameter("btnsubmitC")!=null)
				kq=a+b;
			//session.setAttribute("txtnum3", kq); 	
			//response.sendRedirect("calculator.jsp?kq="+kq+"&a="+a+"&b="+b);
			request.setAttribute("aa", a);
			request.setAttribute("bb", b);
			request.setAttribute("kq", kq);
		}
		RequestDispatcher rd = request.getRequestDispatcher("calculator.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
