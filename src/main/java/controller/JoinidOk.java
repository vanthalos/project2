package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;


@WebServlet("/member/idok")
public class JoinidOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public JoinidOk() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("memberid");
		
		String msg = "";
		
		MemberDAO dao = new MemberDAO();
		int num = dao.loginSelect(id);
		
		if(id.length() < 4) {
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
