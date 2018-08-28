<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="shoppingMall.user.*"%>
    
    
 <%//로그인 모듈 필요 %>
 <jsp:useBean id="mallCart" class="shoppingMall.user.CartBean" scope="session"/>   
    
<%
	//수정하고자 하는 상품의 번호롸 수량을 얻어온다.
	String pnum = request.getParameter("pnum");
	String pqty = request.getParameter("pqty");
	
	if(pnum==null|| pnum.trim().equals("")|| pqty==null || pqty.trim().equals("")){
%>
	<script type="text/javscript">
		alert("잘못 들어온 경로 입니다.");
		history.back();
	</script>		
<%
	}// end if
	
	try{
		mallCart.setModify(pnum, pqty);
		response.sendRedirect("cartList.jsp");
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>