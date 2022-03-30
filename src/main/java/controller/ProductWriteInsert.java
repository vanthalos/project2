package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ProductDAO;
import model.Product;

@WebServlet("/product/productWriteInsert")
@MultipartConfig (
		location = "C:\\WORK\\jsp\\project02\\src\\main\\webapp\\upload",
		fileSizeThreshold = 1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
	)
public class ProductWriteInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductWriteInsert() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String pimg = "";
		String pimg1 = "";
		String pimg2 = "";
		String pimg3 = "";
		String pimg4 = "";
		String pimg5 = "";
		
		String signdate = "";
		
		String s_id = request.getParameter("s_id");
		String s_name = request.getParameter("s_name");

		//���۵� ��� �Ķ���� ������ ������ Part ��ü�� �����Ѵ�. 
		//type=file �Ӽ� ���� �ƴ� �Ķ���Ϳ� ���ؼ��� ��ü�� �����Ǳ� ������ if�������� ó���� �ؾ��Ѵ�. 
		//type=file �Ӽ��� true, �ٸ��͵��� false... && part.getSize()>0
		for(Part part: request.getParts()){

			//if(!part.getName().equals("writer")){
			//if(part.getName().equals("partFile1") || part.getName().equals("partFile2")){ 
			
			if(part.getName().equals("pimg") || (part.getName().equals("pimg1") || part.getName().equals("pimg2") || part.getName().equals("pimg3") || part.getName().equals("pimg4") || part.getName().equals("pimg5")) && part.getSize()>0){
				String contentDisposition = part.getHeader("content-disposition");
				System.out.println("contentDisposition = " + contentDisposition); //�ܼ� ���
				String uploadFileName = getUploadFileName(contentDisposition);

				//���� ��¥ ���ϱ�
				java.util.Date today = new java.util.Date();
				SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
				signdate = cal.format(today);

				//�ߺ� ���� ���ϱ� ���� ó�� 
				uploadFileName = signdate+"_"+uploadFileName; 
				part.write(uploadFileName);

				if(part.getName().equals("pimg")) {
					pimg = uploadFileName;
				}
				
				if(part.getName().equals("pimg1")) {
					pimg1 = uploadFileName;
				}

				if(part.getName().equals("pimg2")) {
					pimg2 = uploadFileName;
				}
				
				if(part.getName().equals("pimg3")) {
					pimg3 = uploadFileName;
				}
				
				if(part.getName().equals("pimg4")) {
					pimg4 = uploadFileName;
				}

				if(part.getName().equals("pimg5")) {
					pimg5 = uploadFileName;
				}
			}
		}

		// ��ºκ� 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("pimg : "+pimg+" ������ ���ε� �Ͽ����ϴ�.<br>" );
		out.println("pimg1 : "+pimg1+" ������ ���ε� �Ͽ����ϴ�.<br>" );
		out.println("pimg2 : "+pimg2+" ������ ���ε� �Ͽ����ϴ�.<br>" );
		out.println("pimg3 : "+pimg3+" ������ ���ε� �Ͽ����ϴ�.<br>" );
		out.println("pimg4 : "+pimg4+" ������ ���ε� �Ͽ����ϴ�.<br>" );
		out.println("pimg5 : "+pimg5+" ������ ���ε� �Ͽ����ϴ�.<br>" );
		
		Product p = new Product();
		
//		p.setP_id(request.getParameter("p_id"));
//		p.setP_name(request.getParameter("p_name"));
		p.setCompany(request.getParameter("company"));
		p.setPrice(Integer.parseInt(request.getParameter("price")));
		p.setAmount(Integer.parseInt(request.getParameter("amount")));
		p.setStock(Integer.parseInt(request.getParameter("stock")));
		p.setPimg(pimg);
		p.setPimg1(pimg1);
		p.setPimg2(pimg2);
		p.setPimg3(pimg3);
		p.setPimg4(pimg4);
		p.setPimg5(pimg5);
		p.setPimg_o(request.getParameter("pimg_o"));
		p.setPimg_s(request.getParameter("pimg_s"));
		p.setFid(request.getParameter("fid"));
		p.setThread(request.getParameter("thread"));
		p.setTitle(request.getParameter("title"));
		p.setContent(request.getParameter("content"));
		p.setP_name(request.getParameter("p_name"));
		p.setSignDate(signdate.substring(0, 10));
		p.setSignTime(signdate.substring(11, 19));
//		p.setRef(Integer.parseInt(request.getParameter("ref")));
//		p.setHit(Integer.parseInt(request.getParameter("hit")));
		
		
///////////////////����/////////////////////////////
		String id_str = signdate + "-" + (request.getParameter("p_name"))+"-" +s_id+"-"+ s_name;
		p.setP_id(id_str);
 		p.setCategory1(request.getParameter("category1"));
 		p.setCategory2(request.getParameter("category2"));
 		p.setCategory3(request.getParameter("category3"));
 		p.setCategoryNum(request.getParameter("categoryNum"));
 		
 		if(request.getParameter("p_option").equals("2")) {
			p.setP_option("2");
		}else if(request.getParameter("p_option").equals("3")) {
			p.setP_option("3");
		}else {
			p.setP_option("1");
		}

///////////////////����END//////////////////////////
 		
 		
 		System.out.println(p.toString());
// 		out.print(p.toString());
		
		ProductDAO dao = new ProductDAO();
		dao.insertProduct(p);		//�۵�� �Ϸ�

		//���ϴ� ȭ������ ������
		response.sendRedirect("/product/productShopList?tab=1");
		
	}

		
	//���������� Chrome�� ���
	private String getUploadFileName(String contentDisposition) {
	
		String uploadFileName = null;
		String[] contentSplitStr = contentDisposition.split(";");
		int firstQutosIndex = contentSplitStr[2].indexOf("\"");
		int lastQutosIndex = contentSplitStr[2].lastIndexOf("\"");
		uploadFileName = contentSplitStr[2].substring(firstQutosIndex + 1, lastQutosIndex);
		return uploadFileName;
	}
}
