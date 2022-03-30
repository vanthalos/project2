package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SellerDAO;
import model.Seller;

/**
 * Servlet implementation class SellerLoginInsert
 */
@WebServlet("/seller/sellerLogin_insert")
public class SellerLoginInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerLoginInsert() {	
        super();
        // TODO Auto-generated constructor stub
    }
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// �ش� �������� ����� ���� ����
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String id_chk = request.getParameter("id_chk");
		
		// DAO ����
		SellerDAO dao = new SellerDAO();
		
		// ������ Ÿ���� text/html �����ڵ� ���� utf-8���� ���� / PrintWriter out�� ���� �ڹٸ� ���� html �±� ����
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int check = dao.logincheck(id, pass);
		
		if(check == 1) {
		// num ������ ���� SellerDAO ���� �ִ� �Լ� loginSelect �� id ���� �־ 0 or 1 ��ȯ => ���̵� Ȯ�� 
		int num = dao.loginSelect(id , pass);
		
		// ���̵� ������ �� ��й�ȣ�� ��ġ�ϴ��� �����ܰ�
		if(num == 1) {
			// Seller �� �ȿ� SellerDAO ��Ʈ�ѷ��� loginSellerSelect �Լ��� id�� , pass ���� �־� Ȯ��
			Seller s = dao.loginSellerSelect(id, pass);
			
			//���̵� üũ�ڽ� ����Ȯ��
			if(id_chk != null){
				id_chk= request.getParameter("id_chk");
			}else{
				id_chk= "";
			}

			// HttpSession ���� = request������ session���� �����´�.
			HttpSession session = request.getSession();
			
			// session�� �Ӽ��� ���� > id��� ���� > Session �� ���� id���� value�� ����Ѵ�.
			session.setAttribute("sel_num", s.getSel_num());
			session.setAttribute("id", s.getId());
			session.setAttribute("pass", s.getPass());
			session.setAttribute("name", s.getName());
			session.setAttribute("type", s.getType());
			session.setAttribute("phone", s.getPhone());
			session.setAttribute("email", s.getEmail());
			session.setAttribute("zipcode1", s.getZipcode());
			session.setAttribute("zipcode1", s.getZipcode1());
			session.setAttribute("zipcode2", s.getZipcode2());
			session.setAttribute("zipcode3", s.getZipcode3());
			session.setAttribute("zipcode4", s.getZipcode4());
			
			
			if(id_chk.equals("checked")){
				request.setCharacterEncoding("utf-8");
				
				Cookie cookie =new Cookie("cid",id); //������ , ��
				cookie.setMaxAge(600); //�ʴ���
				response.addCookie(cookie); //������ ��Ű�� Ŭ���̾�Ʈ�� ����
				
			}else{
				Cookie cookie=new Cookie("cid",""); //������ , ��
				cookie.setMaxAge(0); //�ʴ���
				response.addCookie(cookie); //������ ��Ű�� Ŭ���̾�Ʈ�� ����
			}
			
			// ù �������� �̵�
			response.sendRedirect("/");
		// ���̵� �������� ���� �� || ��й�ȣ�� Ʋ�� ��
		}else {
			// ������ ����� PrintWriter �����Լ��� html�� ��Ʈ���� �� �ִ�.
			out.write("<script>");
			out.write("alert('���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�.');" );
			out.write("history.back();" );
			out.write("</script>");
			out.close();
		
		}
		
		}else {
			out.write("<script>");
			out.write("alert('Ż���� ȸ���Դϴ�.');" );
			out.write("history.back();" );
			out.write("</script>");
			out.close();
		}
		
	}
}
