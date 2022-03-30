package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SellerDAO;
import model.Seller;


@WebServlet("/seller/sellerJoin_insert")
public class SellerJoinInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerJoinInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Seller s = new Seller();
		
		s.setId(request.getParameter("id"));
		s.setPass(request.getParameter("pass"));
		s.setName(request.getParameter("name"));
		s.setEmail(request.getParameter("email"));
		s.setPhone(request.getParameter("phone"));
		s.setSel_num(request.getParameter("sel_num"));
		s.setZipcode(request.getParameter("zipcode"));
		s.setZipcode1(request.getParameter("zipcode1"));
		s.setZipcode2(request.getParameter("zipcode2"));
		s.setZipcode3(request.getParameter("zipcode3"));
		s.setZipcode4(request.getParameter("zipcode4"));
		s.setType("2");
		s.setState("1");

		SellerDAO dao = new SellerDAO();
		
		dao.insertSeller(s);
		
		response.sendRedirect("/");
		
		
	}

}
