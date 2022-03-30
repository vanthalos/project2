package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;


@WebServlet("/member/Nickidok")
public class JoinNickid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public JoinNickid() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname = request.getParameter("nickname");
		
		String msg = "";
		
		MemberDAO dao = new MemberDAO();
		int num = dao.loginSelect2(nickname);
		
		if(nickname.length() < 1) {
			msg = "1";
		}else if(num == 1) {
			msg = "2";
		}else {
			msg = "3";
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(msg);
	}

}
