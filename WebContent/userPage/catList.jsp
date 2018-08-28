<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="shoppingMall.user.*, java.util.*,shoppingMall.*, java.text.*"%>
    
        

 <%@ include file="main_top.jsp" %>       
 
 <%
 	
 	ProdListDAO pdao = ProdListDAO.getInstance();
 
 	request.setCharacterEncoding("euc-kr");
	DecimalFormat df = new DecimalFormat("#,###,###");
	String category_fk = request.getParameter("category_fk");
	String cname = request.getParameter("cname");
	
	Vector<ProductDTO>pdtos = pdao.selectByCat(category_fk);
	
	if(pdtos == null || pdtos.size() == 0){
		out.print("<div class='col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main'>");
		out.print("<h1 class=\"page-header\">�ش��ǰ�� �����ϴ�.</h1>");
		out.print("<h2 class=\"sub-header\"></h2><div class=\"table-responsive\"></div>");
		%>
		<%@ include file="main_bottom.jsp" %>   
		<%
		return;
	}else{
	%>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  <h1 class="page-header"><%= cname %>ī�װ�</h1>
		  
		<!-- ����Ʈ ����  -->
		<h2 class="sub-header"></h2>
		<div class="table-responsive">
		  <table class="table table-striped">
		    <thead>
		      <tr>
		        <th>�̹���</th>
		        <th>��ǰ��</th>
		        <th>��ǰ����</th>
		        <th>��ǰ ����Ʈ</th>
		      </tr>
		    </thead>
    <tbody>
	<%	
		for(ProductDTO pdto : pdtos){
			String pimage = pdto.getPimage();
			String pnum = pdto.getPnum();
			String pname = pdto.getPname();
			int price = pdto.getPrice();
			int point = pdto.getPoint();
			%>
		  <tr style="">
	        <td><a href="prodView.jsp?pnum=<%=pnum%>&pspec=<%=category_fk%>"><img src="../uploadFile/<%=pimage%>" width="50" height="50" border="0"/></a></td>
	        <td><a href="prodView.jsp?pnum=<%=pnum%>&pspec=<%=category_fk%>"><%=pname %></a></td>
	        <td><%=df.format(price)%>��</td>
	        <td>[<%=point %>] ����Ʈ</td>
	      </tr>
			<%
		}//for
	}//else
 %>
	    </tbody>
	  </table>
	</div>

<%@ include file="main_bottom.jsp" %>   