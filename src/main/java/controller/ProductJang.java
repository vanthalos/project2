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


@WebServlet("/product/ProductJang")
public class ProductJang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProductJang() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product p = new Product();
		
		ProductDAO dao = new ProductDAO();
		
		RequestDispatcher dis = request.getRequestDispatcher("productJang.jsp");
		dis.forward(request, response);
	}

}
