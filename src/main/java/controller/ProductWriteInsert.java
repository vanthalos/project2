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

		//전송된 모든 파라미터 값들을 가지고 Part 객체를 생성한다. 
		//type=file 속성 값이 아닌 파라미터에 대해서도 객체가 생성되기 때문에 if구문으로 처리를 해야한다. 
		//type=file 속성만 true, 다른것들을 false... && part.getSize()>0
		for(Part part: request.getParts()){

			//if(!part.getName().equals("writer")){
			//if(part.getName().equals("partFile1") || part.getName().equals("partFile2")){ 
			
			if(part.getName().equals("pimg") || (part.getName().equals("pimg1") || part.getName().equals("pimg2") || part.getName().equals("pimg3") || part.getName().equals("pimg4") || part.getName().equals("pimg5")) && part.getSize()>0){
				String contentDisposition = part.getHeader("content-disposition");
				System.out.println("contentDisposition = " + contentDisposition); //콘솔 출력
				String uploadFileName = getUploadFileName(contentDisposition);

				//오늘 날짜 구하기
				java.util.Date today = new java.util.Date();
				SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
				signdate = cal.format(today);

				//중복 파일 피하기 위한 처리 
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

		// 출력부분 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("pimg : "+pimg+" 파일을 업로드 하였습니다.<br>" );
		out.println("pimg1 : "+pimg1+" 파일을 업로드 하였습니다.<br>" );
		out.println("pimg2 : "+pimg2+" 파일을 업로드 하였습니다.<br>" );
		out.println("pimg3 : "+pimg3+" 파일을 업로드 하였습니다.<br>" );
		out.println("pimg4 : "+pimg4+" 파일을 업로드 하였습니다.<br>" );
		out.println("pimg5 : "+pimg5+" 파일을 업로드 하였습니다.<br>" );
		
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
		
		
///////////////////형섭/////////////////////////////
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

///////////////////형섭END//////////////////////////
 		
 		
 		System.out.println(p.toString());
// 		out.print(p.toString());
		
		ProductDAO dao = new ProductDAO();
		dao.insertProduct(p);		//글등록 완료

		//원하는 화면으로 보내기
		response.sendRedirect("/product/productShopList?tab=1");
		
	}

		
	//사용브라우저가 Chrome인 경우
	private String getUploadFileName(String contentDisposition) {
	
		String uploadFileName = null;
		String[] contentSplitStr = contentDisposition.split(";");
		int firstQutosIndex = contentSplitStr[2].indexOf("\"");
		int lastQutosIndex = contentSplitStr[2].lastIndexOf("\"");
		uploadFileName = contentSplitStr[2].substring(firstQutosIndex + 1, lastQutosIndex);
		return uploadFileName;
	}
}
