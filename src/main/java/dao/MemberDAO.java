package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import model.Member;

public class MemberDAO {
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	//회원가입
	public void insertMember(Member m) {
		d.getCon();
		
		try {
			String sql = "insert into member (memberid,password,name,nickname,email,gender,phone,level,zipcode,zipcode1,zipcode2,zipcode3,zipcode4,type) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberid());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getNickname());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getPhone());
			pstmt.setString(8, "1");
			pstmt.setString(9, m.getZipcode());
			pstmt.setString(10, m.getZipcode1());
			pstmt.setString(11, m.getZipcode2());
			pstmt.setString(12, m.getZipcode3());
			pstmt.setString(13, m.getZipcode4());
			pstmt.setString(14, "1");
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				d.conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	//아이디 중복확인
	public int loginSelect(String id) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select count(*) from member where memberid=?";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			pstmt.close();
			d.conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	//닉네임 중복확인
	public int loginSelect2(String nickname) {
		d.getCon();
		int num2 = 0;
		try {
			String sql = "select count(*) from member where nickname=?";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, nickname);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num2 = rs.getInt(1);
			}
			
			pstmt.close();
			d.conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return num2;
	}
	//로그인2
	public int loginSelect3(String id,String pass) {
		d.getCon();
		
		int num2 = 0;
		
		try {
			String sql = "select count(*) from member where memberid=? and password=?";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num2 = rs.getInt(1);
			}
			
			pstmt.close();
			d.conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return num2;
	}
	//로그인
	public Member loginMemberSelect(String id, String pass) {
		d.getCon();
		
		Member m = new Member();
		
		try {
			String sql = "select * from member where memberid=? and password=?";
			
			pstmt = d.conn.prepareStatement(sql); 
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m.setMemberid(rs.getString("memberid"));
				m.setName(rs.getString("name"));
				m.setType(rs.getString("type"));
			}
			rs.close();
			pstmt.close();
			d.conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return m;
	}
	//회원수정 인풋 출력
	public Member oneMember(String id) {
		d.getCon();
		
		Member m = new Member();
		
		try {
			String sql = "select * from member where memberid=?";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m.setMemberid(rs.getString("memberid"));
				m.setPassword(rs.getString("password"));
				m.setName(rs.getString("name"));
				m.setNickname(rs.getString("nickname"));
				m.setEmail(rs.getString("email"));
				m.setGender(rs.getString("gender"));
				m.setPhone(rs.getString("phone"));
				m.setZipcode(rs.getString("zipcode"));
				m.setZipcode1(rs.getString("zipcode1"));
				m.setZipcode2(rs.getString("zipcode2"));
				m.setZipcode3(rs.getString("zipcode3"));
				m.setZipcode4(rs.getString("zipcode4"));
			}
			rs.close();
			pstmt.close();
			d.conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	//회원 수정 업데이트
	public void updateMember(Member m) {
		d.getCon();
		
		try {
			String sql = "update member set password=?,name=?,nickname=?,email=?,gender=?,phone=?,zipcode=?,zipcode1=?,zipcode2=?,zipcode3=?,zipcode4=? where memberid=?";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getPassword());
			pstmt.setString(2, m.getName());
			pstmt.setString(3, m.getNickname());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getZipcode());
			pstmt.setString(8, m.getZipcode1());
			pstmt.setString(9, m.getZipcode2());
			pstmt.setString(10, m.getZipcode3());
			pstmt.setString(11, m.getZipcode4());;
			pstmt.setString(12, m.getMemberid());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
