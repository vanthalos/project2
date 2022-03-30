package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SellerDAO;

/**
 * Servlet implementation class SellerIdCk
 */
@WebServlet("/seller/SellerIdCk")
public class SellerIdCk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerIdCk() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		String msg = "";
		
		SellerDAO dao = new SellerDAO();
		
		int num = dao.loginSelectId(id); //0 or 1
		
		if(id.length() < 4) {
			msg = "1";
		}else if(num == 1) {
			msg = "2";
		}
		else{
			msg = "3";
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(msg);
	}
		
}



