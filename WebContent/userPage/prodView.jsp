<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="shoppingMall.user.*, java.util.*,shoppingMall.*, java.text.*"%>
    
        

 <%@ include file="main_top.jsp" %>       
 
 <%
 	request.setCharacterEncoding("euc-kr");
	DecimalFormat df = new DecimalFormat("#,###,###");
	String pnum = request.getParameter("pnum");
	String pspec = request.getParameter("pspec");
	
	if(pnum == null || pnum.trim().equals("") || pspec ==null || pspec.trim().equals("")){
		response.sendRedirect("main.jsp");
		return;
	}
	
	ProdListDAO lidao = ProdListDAO.getInstance();
	Vector<ProductDTO> pdtos = lidao.selecByPnum(pnum.trim());
	
	ProductDTO pdto = pdtos.get(0);
	if(pdto == null){
		out.println(pdto+"�� �ش��ϴ� ��ǰ�� �����ϴ�.");
		return;
		
	}
			

 %>
 
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
  <h1 class="page-header">[<%=pdto.getPname()%>]��ǰ ������</h1>
	<div class="row">
	  <div class="col-sm-9 col-md-12">
	    <div class="thumbnail" align="center"  style="height:700px;">
	      <img class="col-sm-9 col-md-6" src="../uploadFile/<%=pdto.getPimage() %>" alt="<%=pdto.getPname()%> ��ǰ�̹���" style="float:left;height:100%;">
	      <div class="caption col-sm-9 col-md-6"  style="height:100%;">
	        <h3><%=pdto.getPname()%></h3>
	        	<form name="frm" method="post">
	        	<input type="hidden" name="pspec" value="<%=pspec %>"/>
			       	<p style="height:330px;">
			       		��ǰ��ȣ : <%=pnum%> <br/>
			       		��ǰ�̸� : <%= pdto.getPname() %><br/>
			       		��ǰ���� : <%= df.format(pdto.getPrice()) %> ��<br/>
			       		��ǰ����Ʈ : [<%=pdto.getPoint() %>] ����Ʈ<br/>
			       		��ǰ���� : <input type="text" name="pqty" size="2" value="1">��<br><br>
			       		
			       		<a href="#" class="btn btn-primary " role="button">�����ϱ�</a> 
				  		<a href="javascript:goCart('<%=pnum %>')" class="btn btn-default " role="button">��ٱ���</a>
				  	</p>	
				  	<p>
				  	<%=pdto.getPcontents()%><br>
				  	</p>
       			</form>
	      </div>
	    </div>
	  </div>
	</div>
	
<script type="text/javascript">
	function goCart(pnum){
		document.frm.action="/shoppingMall/userPage/cartAdd.jsp?pnum="+pnum;
		document.frm.submit();
	}
</script>

<%@ include file="main_bottom.jsp" %>   