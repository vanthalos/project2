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

import dao.MemberDAO;
import model.Member;


@WebServlet("/member/MemberJoin_up")
public class JoinUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public JoinUp() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String session_id = (String)session.getAttribute("memberid");
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
			MemberDAO dao = new MemberDAO();
			Member m = dao.oneMember(session_id);
			
			request.setAttribute("member", m);
			RequestDispatcher dis = request.getRequestDispatcher("join_up.jsp");
			dis.forward(request, response);
		}
	}

}
