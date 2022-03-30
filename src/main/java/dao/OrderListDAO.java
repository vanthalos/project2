package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.OrderList;
import model.Product;

public class OrderListDAO {
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	
	public int OrderListCounting (String id) {
		int count = 0;
		d.getCon();
		
		try {
			String sql = "select count(*) from orderlist where seller_id=?";
			
			pstmt=d.conn.prepareStatement(sql); 
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count  = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			d.conn.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
	public OrderList selectOrderList(String id) {
		d.getCon();
		OrderList o = new OrderList();
		
		try {
			String sql = "select * from orderlist where seller_id=?";
			
			pstmt=d.conn.prepareStatement(sql); 
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				o.setOrderNumber(rs.getString("orderNumber"));
				o.setSignDate(rs.getString("signDate"));
				o.setProductInfo(rs.getString("productInfo"));
				o.setProductPrice(rs.getInt("productPrice"));
				o.setBuyerName(rs.getString("buyerName"));
				o.setBuyerPhone(rs.getString("buyerPhone"));
				o.setBuyerAddress(rs.getString("buyerAddress"));
				o.setBuyerPaymentInfo(rs.getString("buyerPaymentInfo"));
				o.setPaymentCheck(rs.getString("PaymentCheck"));
			}
			rs.close();
			pstmt.close();
			d.conn.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return o;
		
	}
	
	
	public ArrayList<OrderList> allList(String id , int first , int numPerPage , int numbering) {
		//페이징 리스트
		d.getCon();
		
		ArrayList<OrderList> list = new ArrayList<OrderList>();
		int num = numbering;
		
		try {
			String sql = "select * from orderlist where seller_id = ? order by uid desc limit ?,?";
			
			pstmt=d.conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, first);
			pstmt.setInt(3, numPerPage);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				// 모델 product 생성
					//while 구문이 실행되는 동안 p값을 초기화시킴.	
				OrderList o = new OrderList();
				o.setSeller_id(rs.getString("seller_id"));
				o.setOrderNumber(rs.getString("orderNumber"));
				o.setSignDate(rs.getString("signDate"));
				o.setProductInfo(rs.getString("productInfo"));
				o.setProductPrice(rs.getInt("productPrice"));
				o.setBuyerName(rs.getString("buyerName"));
				o.setBuyerPhone(rs.getString("buyerPhone"));
				o.setBuyerAddress(rs.getString("buyerAddress"));
				o.setBuyerPaymentInfo(rs.getString("buyerPaymentInfo"));
				o.setPaymentCheck(rs.getString("PaymentCheck"));
				o.setNumbering(num);
				num --;
				list.add(o);
					
			}
			
			
			//System.out.println(boardList + "");
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}
