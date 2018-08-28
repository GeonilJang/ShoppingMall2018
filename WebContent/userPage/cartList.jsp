<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="shoppingMall.user.*, java.util.*,shoppingMall.*, java.text.*"%>
    
        
<jsp:useBean id="mallCart" class="shoppingMall.user.CartBean" scope="session"/>

 <%@ include file="main_top.jsp" %>       
 
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  <h1 class="page-header">장바구니</h1>
		  
		<!-- 리스트 메인  -->
		<h2 class="sub-header"></h2>
		<div class="table-responsive">
		  <table class="table table-striped">
		    <thead>
		      <tr align="center">
		        <th>번호</th>
		        <th>상품명</th>
		        <th>수량</th>
		        <th>단가</th>
		        <th>합계</th>
		        <th>삭제</th>
		      </tr>
		    </thead>
	   		<tbody>
	   		
	   			<%
	   				DecimalFormat df = new DecimalFormat("#,###,###");
	   				int cartTotPrice =0, cartTotPoint = 0;
	   		
	   				Vector<ProductDTO> cpds = mallCart.getAllProducts();
	   				if(cpds==null||cpds.size()==0){
	   					out.println("<tr><td colspan=6>장바구니가 비었습니다.</td></tr></tbody></table></div>");
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
		        		<input type="text" size="2" name="pqty" value="<%=pd.getPqty() %>"/>개
		        		<input type="hidden" name="pnum" value="<%=pd.getPnum() %>">
		        		<input type="submit" value="수정"/>
		        	</form>
		        </th>
		        <th align="center"><%=df.format(pd.getPrice())%> 원 [<%=pd.getPoint()%>]포인트</th>
		        <th align="center">
		        	<%= df.format(pd.getTotPrice()) %>원 [<%=pd.getTotPoint() %>] 포인트
		        </th>
		        <th align="center">
		        	<a href="cartDel.jsp?pnum=<%=pd.getPnum() %>">삭제</a>
		        </th>
		      </tr>
		      <%
		      	//장바구니 전체 총액
		      cartTotPrice += pd.getTotPrice();
		      cartTotPoint += pd.getTotPoint();
	   				}%>
	   			<tr>
	   				<td colspan="4">장바구니 총액:<%=df.format(cartTotPrice)%>원, 총 누적 포인트 [<%=cartTotPoint %>]포인트</td>
	   				<td colspan="2">
	   					<a href="order.jsp">[주문하기]</a> &nbsp;&nbsp;<a href="javascript:history.go(-2)">[계속 쇼핑하기]</a>
	   				</td> 
	   			</tr>
		    </tbody>
	 	 </table>
		</div>

<%@ include file="main_bottom.jsp" %>   