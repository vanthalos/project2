package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
	Connection conn;		//con �޼ҵ� ȣ��
	
	public void getCon() {
		try {
			//��� ����
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/project02?useUnicode=true&characterEncoding=utf8";
			String user="root";
			String password="1111";
			
			conn = DriverManager.getConnection(url, user, password);	//con �޼ҵ� �ʱ�ȭ
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
