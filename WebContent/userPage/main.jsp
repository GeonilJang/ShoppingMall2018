<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="shoppingMall.user.*, java.util.*,shoppingMall.*, java.text.*"%>
    
        

 <%@ include file="main_top.jsp" %>       
 
 <%
 	request.setCharacterEncoding("euc-kr");
	DecimalFormat df = new DecimalFormat("#,###,###");
 %>
 
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
  <h1 class="page-header">���θ��� ���� ���� ȯ���մϴ�!!!</h1>
  
<!-- ����Ʈ ���(�α��ǰ ����) -->
<div class="row placeholders">
<%
ProdListDAO bdao = ProdListDAO.getInstance();
Vector<ProductDTO> bdtos = bdao.selectByPspec("hit");
int f = 0;
for(ProductDTO bdto : bdtos){
	f++;
%>
  <div class="col-xs-6 col-sm-3 placeholder">
    <a href="../uploadFile/<%=bdto.getPimage()%>"><img src="../uploadFile/<%=bdto.getPimage()%>" width="120" height="120" border="0"/></a>
    <h4><%=bdto.getPname()%></h4>
    <span class="text-muted"><%=df.format(bdto.getPrice())%></span>
  </div>
  
<%
	if(f%4==0){
		break;
	}
}
%>
</div>



<!-- ����Ʈ ����  -->
<h2 class="sub-header">�ֽŻ�ǰ</h2>
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
	ProdListDAO pdao = ProdListDAO.getInstance();
	//ArrayList<ProductDTO> lidtos = pdao.selectByPspec("hit");
	Vector<ProductDTO> pdtos = pdao.selectByPspec("new");

	
	if(pdtos==null || pdtos.size()==0){
		out.println("<tr><td colspan='4'>new ��ǰ�� �����ϴ�.</td></tr>");
	}else{
		int cnt = 0 ;
		for(ProductDTO pdto : pdtos){
			cnt++;
			String pimage = pdto.getPimage();
			String pnum = pdto.getPnum();
			String pname = pdto.getPname();
			int price = pdto.getPrice();
			int point = pdto.getPoint();
	%>
		
		<tr>
	        <td><a href="prodView.jsp?pnum=<%=pnum%>&pspec=hit"><img src="../uploadFile/<%=pimage%>" width="120" height="120" border="0"/></a></td>
	        <td><%=pname %></td>
	        <td><%=df.format(price)%>��</td>
	        <td>[<%=point %>] ����Ʈ</td>
	      </tr>
	
<%		
		 if(cnt%4==0){
			 
		 }
		}//end of for
	}

%>
	    </tbody>
	  </table>
	</div>

<%@ include file="main_bottom.jsp" %>   