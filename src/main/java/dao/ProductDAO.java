package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Product;

public class ProductDAO {

	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	
	//여기는 인설트 부분, 건드리면 안됨
		public void insertProduct(Product p) {
			d.getCon();
			
			try {
				String sql = "insert into product (p_id, p_name, company, price, amount, stock, pimg, pimg1, pimg2, pimg3, pimg4, pimg5, pimg_o, pimg_s, fid, thread, title, content, categoryNum, category1, category2, category3, p_option, signDate, signTime) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = d.conn.prepareStatement(sql);
				
				pstmt.setString(1, p.getP_id());
				pstmt.setString(2, p.getP_name());
				pstmt.setString(3, p.getCompany());
				pstmt.setInt(4, p.getPrice());
				pstmt.setInt(5, p.getAmount());
				pstmt.setInt(6, p.getStock());
				pstmt.setString(7, p.getPimg());
				pstmt.setString(8, p.getPimg1());
				pstmt.setString(9, p.getPimg2());
				pstmt.setString(10, p.getPimg3());
				pstmt.setString(11, p.getPimg4());
				pstmt.setString(12, p.getPimg5());
				pstmt.setString(13, p.getPimg_o());
				pstmt.setString(14, p.getPimg_s());
				pstmt.setString(15, p.getFid());
				pstmt.setString(16, p.getThread());
				pstmt.setString(17, p.getTitle());
				pstmt.setString(18, p.getContent());
				pstmt.setString(19, p.getCategoryNum());
				pstmt.setString(20, p.getCategory1());
				pstmt.setString(21, p.getCategory2());
				pstmt.setString(22, p.getCategory3());
				pstmt.setString(23, p.getP_option());
				pstmt.setString(24, p.getSignDate());
				pstmt.setString(25, p.getSignTime());
				
				
				pstmt.executeUpdate();
				
				pstmt.close();
				d.conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
//////////////	상품목록	/////////////////////
		public ArrayList<Product> getAllProduct(int startRow, int endRow, String tab) {
			d.getCon();

			ArrayList<Product> list = new ArrayList<Product>();

			try {
				String sql;
				
				if(tab.equals("1")) {
					sql = "select * from product order by uid desc limit ?,?";
				}else if(tab.equals("2")) {
					sql = "select * from product order by ref desc limit ?,?";
				}else if(tab.equals("3")) {
					sql = "select * from product order by hit desc limit ?,?";
				}else if(tab.equals("4")) {
					sql = "select * from product order by price asc limit ?,?";
				}else if(tab.equals("5")) {
					sql = "select * from product order by price desc limit ?,?";
				}else {
					sql = "select * from product";
				}
				
				pstmt = d.conn.prepareStatement(sql);

				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);

				rs = pstmt.executeQuery();

				while(rs.next()) {
					Product p = new Product();

					p.setP_uid(rs.getInt("uid"));
					p.setP_name(rs.getString("p_name"));
					p.setP_id(rs.getString("p_id"));
					p.setCompany(rs.getString("company"));
					p.setPrice(rs.getInt("price"));
					p.setAmount(rs.getInt("amount"));
					p.setStock(rs.getInt("stock"));
					p.setPimg(rs.getString("pimg"));
					p.setPimg1(rs.getString("pimg1"));
					p.setPimg2(rs.getString("pimg2"));
					p.setPimg3(rs.getString("pimg3"));
					p.setPimg4(rs.getString("pimg4"));
					p.setPimg5(rs.getString("pimg5"));
					p.setSignDate(rs.getString("signDate"));
					p.setSignTime(rs.getString("signTime"));
					p.setPimg_o(rs.getString("pimg_o"));
					p.setPimg_s(rs.getString("pimg_s"));
					p.setRef(rs.getInt("ref"));
					p.setFid(rs.getString("fid"));
					p.setThread(rs.getString("thread"));
					p.setTitle(rs.getString("title"));
					p.setContent(rs.getString("content"));
					p.setHit(rs.getInt("hit"));
					p.setP_option(rs.getString("p_option"));

					list.add(p);
				}
				
				rs.close();
				pstmt.close();
				d.conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();

			}
			return list;
	}



	
	//전체 상품수
	public int getAllCount() {
		d.getCon();
		
		int num = 0;
		try {
			
			String sql ="select count(*) from product";
			
			pstmt = d.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
	
	
	//한개의 상품정보 불러오기
		public Product oneProduct(int uid) {	//void 는 반환할게 없다 그래서 void대신 Product로~ Product로 전달할거니까.
			d.getCon();
			
			Product p = new Product();
			
			try {
				String sql = "select * from Product where uid=?";			//?를 쓰겠다는건 pstmt를 이용해서 db에 접근하겠다~
				pstmt = d.conn.prepareStatement(sql);						//자꾸 빼먹는다ㅜㅜㅋ 쿼리문 작성후 무조건!!ㅋㅋ
				
				pstmt.setInt(1, uid);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					p.setP_uid(rs.getInt("uid"));
					p.setP_name(rs.getString("p_name"));
					p.setP_id(rs.getString("p_id"));
					p.setCompany(rs.getString("company"));
					p.setPrice(rs.getInt("price"));
					p.setAmount(rs.getInt("amount"));
					p.setStock(rs.getInt("stock"));
					p.setPimg(rs.getString("pimg"));
					p.setPimg1(rs.getString("pimg1"));
					p.setPimg2(rs.getString("pimg2"));
					p.setPimg3(rs.getString("pimg3"));
					p.setPimg4(rs.getString("pimg4"));
					p.setPimg5(rs.getString("pimg5"));
					p.setSignDate(rs.getString("signDate"));
					p.setSignTime(rs.getString("signTime"));
					p.setPimg_o(rs.getString("pimg_o"));
					p.setPimg_s(rs.getString("pimg_s"));
					p.setRef(rs.getInt("ref"));
					p.setHit(rs.getInt("hit"));
					p.setFid(rs.getString("fid"));
					p.setThread(rs.getString("thread"));
					p.setTitle(rs.getString("title"));
					p.setContent(rs.getString("content"));
					p.setP_option(rs.getString("p_option"));
					
				}
				
				rs.close();
				pstmt.close();
				d.conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(p);
			return p;
		}
		
		
/*
		//상품정보 수정/업데이트
		public void updateMember(Member m) {
			d.getCon();
			
			try {
				String sql = "update member4 set pass=?, name=?, age=?, gender=?, email=?, level=? where id=?";
				pstmt = d.conn.prepareStatement(sql);
				
				pstmt.setString(1, m.getPass());
				pstmt.setString(2, m.getName());
				pstmt.setInt(3, m.getAge());
				pstmt.setString(4, m.getGender());
				pstmt.setString(5, m.getEmail());
				pstmt.setString(6, m.getLevel());
				pstmt.setString(7, m.getId());
				
				pstmt.executeUpdate();
				
				pstmt.close();
				d.conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
*/
		
		
		
}
