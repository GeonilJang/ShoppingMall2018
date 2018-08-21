<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="shoppingMall.*,com.oreilly.servlet.*" %>
<!--  
	1. 파일 업로드 라이브러리 다운로드
	http:// www.servlets.com
	com.oreilly.servlets
	cos-26Des2008.zip


	WebConten 폴더 내에 포더생성
-->

<%
	request.setCharacterEncoding("euc-kr");
	String msg="", url="";

	String uploadPath = request.getSession().getServletContext().getRealPath("uploadFile");
	int maxSize = 1024*1024*10; // 10mb;
	String filename = "";
	String originFile ="";

	
	try{
		//파일 업로드할 때 사용하는 request  인가보오
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "euc-kr", new DefaultFileRenamePolicy());
		
		ProductDAO pdao = ProductDAO.getInstance();
		int n = pdao.registerProduct(multi);
		
		if(n>0){
			msg="상품등록 완료되었습니다.";
			url ="prodList.jsp";
		}else{
			msg="상품등록 실패했습니다.";
			url ="prod_input.jsp";
		}
	}catch(Exception e){
		msg = "이미지 파일 업로드 실패";
		url ="prod_input.jsp";
		e.printStackTrace();
	}
%>


<script type="text/javascript">
	alert("<%= msg %>");
	location.href="<%=url%>";
</script>


