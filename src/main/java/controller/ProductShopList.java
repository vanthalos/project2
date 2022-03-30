package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

@WebServlet("/product/productShopList")
public class ProductShopList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductShopList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO dao = new ProductDAO();
		
		
		//한 페이지 보여질 글의 갯수
		int pageSize = 10;

		//현재 보여지는 페이지의 넘버 값 처리
		int pageNum = 1;
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		//컬렉션 프레임워크 ArrayList
		//array 타입으로 객체 v를 만들었으니 getAllMember로 반환을 해야함 -> getAllMember 메소드생성
				
		//전체 회원 수
		int count = dao.getAllCount();

		//페이지 내에서 보여질 넘버링 숫자 처리 초기화
		int number = 0;

		int startRow = (pageNum - 1) * pageSize;
		int endRow = pageSize;
		
		//정렬 카테고리 타입
		String tab = request.getParameter("tab");
				
//			System.out.println("============tab:"+tab);
		ArrayList<Product> list = dao.getAllProduct(startRow, endRow, tab);
		
		//넘버링 숫자
		number = count - (pageNum - 1) * pageSize;
		
		request.setAttribute("list", list);		//리스트에 필요한 객체들의 모임 전달
		request.setAttribute("count", count);	//전체 회원 수 view로 전달
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("tab", tab);
		
		RequestDispatcher dis = request.getRequestDispatcher("shopList.jsp");
		dis.forward(request, response);

	}


}
