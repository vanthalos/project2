package dao;

import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import model.Seller;

public class SellerDAO {
	
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	
	public void insertSeller(Seller s) {
		d.getCon();
		
		try {
			String sql="insert into seller (sel_num,sel_id,sel_pass,sel_name,sel_email,sel_phone,type, zipcode, zipcode1, zipcode2, zipcode3, zipcode4,state) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			//	insert into seller (sel_num,sel) values (?,?,?)"
			// 	무엇을	어디에 	어떤것을 and 어떤것을 key(넣고싶은 위치) = value (넣고싶은 값)
			
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, s.getSel_num());
			pstmt.setString(2, s.getId());
			pstmt.setString(3, s.getPass());
			pstmt.setString(4, s.getName());
			pstmt.setString(5, s.getEmail());
			pstmt.setString(6, s.getPhone());
			pstmt.setString(7, s.getType());
			pstmt.setString(8, s.getZipcode());
			pstmt.setString(9, s.getZipcode1());
			pstmt.setString(10, s.getZipcode2());
			pstmt.setString(11, s.getZipcode3());
			pstmt.setString(12, s.getZipcode4());
			pstmt.setString(13, s.getState());
				
			// s.get최근본페이지
			//	s.get최근구매햇던상품
			pstmt.executeUpdate();
			
			pstmt.close();
			d.conn.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	public int logincheck(String id, String pass) {
		d.getCon();
		int check = 0;
		try {
			String sql="select state from seller where sel_id= ? and sel_pass=? ";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				check = Integer.parseInt(rs.getString("state")); 
			}
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	public int loginSelect(String id , String pass) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql="select count(*) from seller where sel_id= ? and sel_pass=? ";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				num = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			d.conn.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	public int loginSelectId (String id ) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql="select count(*) from seller where sel_id= ? ";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				num = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			d.conn.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	
	
	public Seller loginSellerSelect(String id, String pass) {
		d.getCon();
		
		Seller s = new Seller();
		
		try {
			String sql = "select * from seller where sel_id=? and sel_pass = ?";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {

				s.setSel_num(rs.getString("sel_num"));
				s.setId(rs.getString("sel_id"));
				s.setPass(rs.getString("sel_pass"));
				s.setName(rs.getString("sel_name"));
				s.setEmail(rs.getString("sel_email"));
				s.setPhone(rs.getString("sel_phone"));
				s.setType(rs.getString("type"));
				s.setZipcode(rs.getString("zipcode"));
				s.setZipcode1(rs.getString("zipcode1"));
				s.setZipcode2(rs.getString("zipcode2"));
				s.setZipcode3(rs.getString("zipcode3"));
				s.setZipcode4(rs.getString("zipcode4"));
				s.setState(rs.getString("state"));
			}
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	
	public Seller oneSeller (String id ) {
		d.getCon();
		
		Seller s = new Seller();
		
		try {
			String sql="select * from seller where sel_id = ?";
			
			pstmt=d.conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				s.setSel_num(rs.getString("sel_num"));
				s.setId(rs.getString("sel_id"));
				s.setPass(rs.getString("sel_pass"));
				s.setName(rs.getString("sel_name"));
				s.setEmail(rs.getString("sel_email"));
				s.setPhone(rs.getString("sel_phone"));
				s.setType(rs.getString("type"));
				s.setZipcode(rs.getString("zipcode"));
				s.setZipcode1(rs.getString("zipcode1"));
				s.setZipcode2(rs.getString("zipcode2"));
				s.setZipcode3(rs.getString("zipcode3"));
				s.setZipcode4(rs.getString("zipcode4"));
				s.setState(rs.getString("state"));
				
			}
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public void updateSeller(Seller s) {
		d.getCon();
		
		try {
			String sql = "update seller set sel_pass=? , sel_name=? ,sel_email=? , sel_phone=?, zipcode=? , zipcode1=? ,zipcode2=? ,zipcode3=? ,zipcode4=? where sel_id =?";
			
			pstmt = d.conn.prepareStatement(sql);
			
			
			pstmt.setString(1, s.getPass());
			pstmt.setString(2, s.getName());
			pstmt.setString(3, s.getEmail());
			pstmt.setString(4, s.getPhone());
			pstmt.setString(5, s.getZipcode());
			pstmt.setString(6, s.getZipcode1());
			pstmt.setString(7, s.getZipcode2());
			pstmt.setString(8, s.getZipcode3());
			pstmt.setString(9, s.getZipcode4());
			pstmt.setString(10, s.getId());
			
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void withdrawl(Seller s) {
		d.getCon();
		
		try {
			String sql = "update seller set state=? where sel_id =?";
			
			pstmt = d.conn.prepareStatement(sql);
			
			
			pstmt.setString(1, "0");
			pstmt.setString(2, s.getId());
			
			System.out.println(s.getId());
			pstmt.executeUpdate();
			pstmt.close();
			d.conn.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
