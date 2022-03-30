package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

@WebServlet("/product/productView")
public class ProductView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		ProductDAO dao = new ProductDAO();
		Product p = dao.oneProduct(uid);
		
		request.setAttribute("p", p);
		RequestDispatcher dis = request.getRequestDispatcher("view.jsp");
		dis.forward(request, response);
	}
	
}
