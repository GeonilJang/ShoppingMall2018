<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@page import="shoppingMall.CategoryDAO" %>
    
<%
	request.setCharacterEncoding("euc-kr");
	String code = request.getParameter("code");
	String cname = request.getParameter("cname");
	
	//유효성 검사
	if(code == null || cname == null || code.trim().equals("") || cname.trim().equals("")){
		response.sendRedirect("cat_input.jsp");
	}
	
	//비지니스 로직 수행
	CategoryDAO cdao = CategoryDAO.getInstance();
	int n = cdao.insertCat(code.trim(), cname.trim());
	
	String msg = "", url="";
	
	if(n>0){
		msg = " 카테고리 등록 되었습니다.";
		url ="catList.jsp";
	}else{
		msg = " 카테고리 등록 실패..";
		url ="cat_input.jsp";
	}
	
	
	
	
%> 
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
    
    
    
  