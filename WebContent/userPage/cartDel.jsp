<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="shoppingMall.user.*"%>
    
    
 <%//�α��� ��� �ʿ� %>
 <jsp:useBean id="mallCart" class="shoppingMall.user.CartBean" scope="session"/>   
    
<%
	//�����ϰ��� �ϴ� ��ǰ�� ��ȣ�� ������ ���´�.
	String pnum = request.getParameter("pnum");
	String pqty = request.getParameter("pqty");
	
	if(pnum==null|| pnum.trim().equals("")){
%>
	<script type="text/javscript">
		alert("�߸� ���� ��� �Դϴ�.");
		history.back();
	</script>		
<%
	}// end if
	
	
	mallCart.delProd(pnum.trim());
	response.sendRedirect("cartList.jsp");
		
	
	
%>