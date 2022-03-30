package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
	Connection conn;		//con 메소드 호출
	
	public void getCon() {
		try {
			//디비 접속
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/project02?useUnicode=true&characterEncoding=utf8";
			String user="root";
			String password="1111";
			
			conn = DriverManager.getConnection(url, user, password);	//con 메소드 초기화
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
