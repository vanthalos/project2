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
		// 해당 서블릿에서 사용할 변수 선언
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String id_chk = request.getParameter("id_chk");
		
		// DAO 선언
		SellerDAO dao = new SellerDAO();
		
		// 컨텐츠 타입을 text/html 유니코드 값을 utf-8으로 선언 / PrintWriter out을 통해 자바를 통해 html 태그 생성
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int check = dao.logincheck(id, pass);
		
		if(check == 1) {
		// num 변수의 값은 SellerDAO 안의 있는 함수 loginSelect 에 id 값을 넣어서 0 or 1 반환 => 아이디 확인 
		int num = dao.loginSelect(id , pass);
		
		// 아이디가 존재할 때 비밀번호가 일치하는지 검증단계
		if(num == 1) {
			// Seller 모델 안에 SellerDAO 컨트롤러의 loginSellerSelect 함수에 id값 , pass 값을 넣어 확인
			Seller s = dao.loginSellerSelect(id, pass);
			
			//아이디 체크박스 유무확인
			if(id_chk != null){
				id_chk= request.getParameter("id_chk");
			}else{
				id_chk= "";
			}

			// HttpSession 생성 = request값으로 session값을 가져온다.
			HttpSession session = request.getSession();
			
			// session의 속성을 세팅 > id라는 변수 > Session 모델 안의 id값을 value로 사용한다.
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
				
				Cookie cookie =new Cookie("cid",id); //변수명 , 값
				cookie.setMaxAge(600); //초단위
				response.addCookie(cookie); //생성한 쿠키를 클라이언트로 전송
				
			}else{
				Cookie cookie=new Cookie("cid",""); //변수명 , 값
				cookie.setMaxAge(0); //초단위
				response.addCookie(cookie); //생성한 쿠키를 클라이언트로 전송
			}
			
			// 첫 페이지로 이동
			response.sendRedirect("/");
		// 아이디가 존재하지 않을 때 || 비밀번호가 틀릴 때
		}else {
			// 위에서 사용한 PrintWriter 내장함수를 html을 컨트롤할 수 있다.
			out.write("<script>");
			out.write("alert('아이디 또는 패스워드가 일치하지 않습니다.');" );
			out.write("history.back();" );
			out.write("</script>");
			out.close();
		
		}
		
		}else {
			out.write("<script>");
			out.write("alert('탈퇴한 회원입니다.');" );
			out.write("history.back();" );
			out.write("</script>");
			out.close();
		}
		
	}
}
