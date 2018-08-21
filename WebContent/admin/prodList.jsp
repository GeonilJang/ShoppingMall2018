<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="shoppingMall.*, java.util.*" %>


<%@ include file="../ad_top.jsp" %>

<script type="text/javascript">
	function checkDel(pnum, pimage){
		let isDel = window.confirm("삭제 하시겠습니까?");
		if(isDel) location.href="prodDelete.jsp?pnum="+pnum+"&pimage="+pimage;
		else location.reload();
	}//checkDel()
</script>

<div class="panel panel-info">
  <div class="panel-heading" id="titleButton"><h3 align="center">상품 리스트</h3></div>
  <div class="panel-body" id="buttonInfo">
  	<table class="table table-hover table-border">
		<thead>
			<tr>
				<th>번호</th>
				<th>카테고리 코드</th>
				<th>상품명</th>
				<th>이미지</th>
				<th>가격</th>
				<th>제조사</th>
				<th>수량</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody>
		<%
			ProductDAO pdao = ProductDAO.getInstance();
			ArrayList<ProductDTO> pdtos = pdao.productAll();
			if(pdtos == null || pdtos.size() == 0){
				out.println("<tr><td colspan=8>상품 테이터가 없습니다.</td></tr></tbody></table>");
				return; //데이터가 없는 경우
			}
			
			for(ProductDTO pdto : pdtos){
		%>
			<tr>
				<td><%=pdto.getPnum() %></td>
				<td><%=pdto.getPcategory_fk() %></td>
				<td><%=pdto.getPname() %></td>
				<td>
					<% String imaPath = request.getContextPath()+"/uploadFile/"+pdto.getPimage();%>
					<a href="<%=imaPath%>"><img src="<%=imaPath%>" border=0 width=50 height=50/></a>
					
				</td>
				<td><%=pdto.getPrice() %></td>
				<td><%=pdto.getPcompany() %></td>
				<td><%=pdto.getPqty() %></td>
				<td><a href="prodUpdate.jsp?pnum=<%=pdto.getPnum()%>" class="btn btn-info">수정</a> 
				<a href="javascript:checkDel('<%=pdto.getPnum()%>','<%=pdto.getPimage()%>')" class="btn btn-danger">삭제</a></td>
			</tr>
			<%
				} 
			%>
		</tbody>
	</table>
  </div>
</div>

<%@ include file="../ad_bottom.jsp" %>