<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="shoppingMall.*" %>

<%
	String cnum = request.getParameter("cnum");
	if(cnum == null || cnum.trim().equals("")){
		response.sendRedirect("catList.jsp");
		return;
	}//if

	CategoryDAO cdao = CategoryDAO.getInstance();
	int n = cdao.categoryDelete(cnum);
	
	String msg="", url="catList.jsp";
	
	if(n>0){
		msg="카테고리 삭제완료 되었습니다.";
	}else{
		msg="카테고리 삭제 실패";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>