package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SellerDAO;
import model.Seller;

/**
 * Servlet implementation class SellerMypage
 */
@WebServlet("/seller/sellerMypage")
public class SellerMypage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerMypage() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String session_id = (String)session.getAttribute("id");
		//System.out.println(session_id);
		if(session_id == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			out.print("alert('비정상적인 접근입니다.');");
			out.print("location.href='/';");
			out.print("</script>");
			out.close();
		}else {
			SellerDAO dao = new SellerDAO();
			Seller s = dao.oneSeller(session_id);
			
			
			String email0 =s.getEmail();
			
			int idx = email0.indexOf("@");
			String email1 = email0.substring(0, idx);
			String email2 = email0.substring(email0.lastIndexOf("@")+1);
			
			String phone0 = s.getPhone();
			String phone1 = phone0.substring(0, 3);
			String phone2 = phone0.substring(3, 7);
			String phone3 = phone0.substring(7, 11);
			
			String phone = phone1 +"-"+phone2+"-"+phone3;
			
			String phones = phone1 + phone2 + phone3;
					
			request.setAttribute("Seller", s);
			request.setAttribute("email1", email1);
			request.setAttribute("email2", email2);
			
			RequestDispatcher dis = request.getRequestDispatcher("seller_mypage.jsp");
			dis.forward(request, response);
	}


}
}
