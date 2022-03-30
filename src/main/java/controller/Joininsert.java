package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import model.Member;




@WebServlet("/member/join_insert")
public class Joininsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Joininsert() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Member m = new Member();
		
		m.setMemberid(request.getParameter("memberid"));
		m.setPassword(request.getParameter("password"));
		m.setName(request.getParameter("name"));
		m.setNickname(request.getParameter("nickname"));
		m.setEmail(request.getParameter("email"));
		m.setGender(request.getParameter("gender"));
		m.setPhone(request.getParameter("phone"));
		m.setZipcode(request.getParameter("zipcode"));
		m.setZipcode1(request.getParameter("zipcode1"));
		m.setZipcode2(request.getParameter("zipcode2"));
		m.setZipcode3(request.getParameter("zipcode3"));
		m.setZipcode4(request.getParameter("zipcode4"));
		m.setType(request.getParameter("type"));
		
		MemberDAO dao = new MemberDAO();
		dao.insertMember(m);
		
		response.sendRedirect("/");
	}

}
