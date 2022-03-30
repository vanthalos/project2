package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import model.Member;


@WebServlet("/member/memberlogin_ok")
public class MemberLoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberLoginOk() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("memberid");
		String pass = request.getParameter("password");
		
		MemberDAO dao = new MemberDAO();
		//System.out.println("==============================="+id);
		//System.out.println("==============================="+pass);
		
		int num = dao.loginSelect(id);
		//System.out.println("================================="+num);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(num == 1) {
			int num2 = dao.loginSelect3(id,pass);
			
			if(num2 == 1) {
				Member m = dao.loginMemberSelect(id, pass);
				HttpSession session = request.getSession();
				
				session.setAttribute("memberid", m.getMemberid());
				session.setAttribute("name", m.getName());
				session.setAttribute("type", m.getType());
			}else {
				out.print("<script>");
				out.print("alert('비밀번호가 틀렸습니다.');");
				out.print("history.back();");
				out.print("</script>");
				out.close();
			}
		
		response.sendRedirect("/");
		}else {
			out.print("<script>");
			out.print("alert('존재하지 않은 아이디입니다.');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
		}
	}

}
