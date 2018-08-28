<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="shoppingMall.user.*, java.util.*,shoppingMall.*, java.text.*"%>
    
        
<jsp:useBean id="mallCart" class="shoppingMall.user.CartBean" scope="session"/>

 <%@ include file="main_top.jsp" %>       
 
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  <h1 class="page-header">��ٱ���</h1>
		  
		<!-- ����Ʈ ����  -->
		<h2 class="sub-header"></h2>
		<div class="table-responsive">
		  <table class="table table-striped">
		    <thead>
		      <tr align="center">
		        <th>��ȣ</th>
		        <th>��ǰ��</th>
		        <th>����</th>
		        <th>�ܰ�</th>
		        <th>�հ�</th>
		        <th>����</th>
		      </tr>
		    </thead>
	   		<tbody>
	   		
	   			<%
	   				DecimalFormat df = new DecimalFormat("#,###,###");
	   				int cartTotPrice =0, cartTotPoint = 0;
	   		
	   				Vector<ProductDTO> cpds = mallCart.getAllProducts();
	   				if(cpds==null||cpds.size()==0){
	   					out.println("<tr><td colspan=6>��ٱ��ϰ� ������ϴ�.</td></tr></tbody></table></div>");
	   					return;
	   				}
	   				
	   				
	   				
	   				for(ProductDTO pd:cpds){
	   			%>
	   		
	   		
			  <tr style="">
		        <th align="center"><%=pd.getPname()%></th>
		        <th align="center">
		        	<img src="../uploadFile/<%=pd.getPimage()%>" width="100" height="100"/>
		        </th>
		        <th align="center">
		        	<form action="cartModify.jsp" name="frm" method="post">
		        		<input type="text" size="2" name="pqty" value="<%=pd.getPqty() %>"/>��
		        		<input type="hidden" name="pnum" value="<%=pd.getPnum() %>">
		        		<input type="submit" value="����"/>
		        	</form>
		        </th>
		        <th align="center"><%=df.format(pd.getPrice())%> �� [<%=pd.getPoint()%>]����Ʈ</th>
		        <th align="center">
		        	<%= df.format(pd.getTotPrice()) %>�� [<%=pd.getTotPoint() %>] ����Ʈ
		        </th>
		        <th align="center">
		        	<a href="cartDel.jsp?pnum=<%=pd.getPnum() %>">����</a>
		        </th>
		      </tr>
		      <%
		      	//��ٱ��� ��ü �Ѿ�
		      cartTotPrice += pd.getTotPrice();
		      cartTotPoint += pd.getTotPoint();
	   				}%>
	   			<tr>
	   				<td colspan="4">��ٱ��� �Ѿ�:<%=df.format(cartTotPrice)%>��, �� ���� ����Ʈ [<%=cartTotPoint %>]����Ʈ</td>
	   				<td colspan="2">
	   					<a href="order.jsp">[�ֹ��ϱ�]</a> &nbsp;&nbsp;<a href="javascript:history.go(-2)">[��� �����ϱ�]</a>
	   				</td> 
	   			</tr>
		    </tbody>
	 	 </table>
		</div>

<%@ include file="main_bottom.jsp" %>   