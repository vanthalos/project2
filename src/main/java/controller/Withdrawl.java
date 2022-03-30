package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SellerDAO;
import model.Seller;

/**
 * Servlet implementation class Withdrawl
 */
@WebServlet("/member/withdrawal")
public class Withdrawl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Withdrawl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//type �� id ���� ������ 
		
		String type = request.getParameter("wType");
		
		//�Ϲ�/�Ǹ��� ȸ�� ���� �� DAO ����
		if(type.equals("1")) {
			
			
			
		}else if(type.equals("2")) {
			Seller s = new Seller();
			s.setId(request.getParameter("wId"));
			SellerDAO dao = new SellerDAO();
			dao.withdrawl(s);
		}
		
		// alert�� ���� �α׾ƿ� �� ù������
		out.write("<script>");
		out.write("alert('�׵��� �̿����ּż� �����մϴ�.');" );
		out.write("location.href=('/member/logout');" );
		out.write("</script>");
		out.close();
		
	}

}
