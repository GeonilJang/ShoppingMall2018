<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.io.*, shoppingMall.*" %>


<%
	String pnum = request.getParameter("pnum");

	if(pnum==null || pnum.trim().equals("")){
		response.sendRedirect("prodList.jsp");
		return;
	}
	
	String pimage = request.getParameter("pimage");
	String imgPath = application.getRealPath("uploadFile");
	
	File dfile = null;
	
	if(pimage != null){
		dfile = new File(imgPath+"/"+pimage);
		System.out.println(dfile+" 삭제 해봅시다.");
		if(dfile.exists()){
			if(dfile.delete()) out.println("이미지 파일 삭제 완료");
		}
	}//end of if
	
	
	//삭제 비지니스 로지 호출
	ProductDAO pdao = ProductDAO.getInstance();
	int n = pdao.delProd(pnum.trim());
	
	String msg = "", url="prodList.jsp";
	
	if(n>0){
		msg ="상품 삭제처리가 완료 되었습니다.";
	}else{
		msg ="상품 삭제 실패..";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>















