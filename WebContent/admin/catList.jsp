<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="shoppingMall.*, java.util.*" %>



<%@ include file="../ad_top.jsp" %>


<h3>카테고리 리스트</h3>
<table class="table table-hover table-border">
	<thead>
		<tr>
			<th>번호</th><th>코드</th><th>카테고리명</th><th>삭제</th>
		</tr>
	</thead>
	<tbody>
	<%
		CategoryDAO cdao = CategoryDAO.getInstance();
		ArrayList<CategoryDTO> cdtos = cdao.categoryAll();
		
		if(cdtos == null || cdtos.size() == 0){
			out.println("<tr><td colspan=4>등록된 카테고리가 없습니다.</td></tr>");
		}else{
			
			for(CategoryDTO cdto : cdtos){
	%>
			<tr>
				<td><%= cdto.getCnum() %></td>
				<td><%= cdto.getCode() %></td>
				<td><%= cdto.getCname() %></td>
				<td><a href="catDelete.jsp?cnum=<%= cdto.getCnum() %>">삭제</a></td>
			</tr>
			
			
		<%}
			}%>
	</tbody>

</table>




<%@ include file="../ad_bottom.jsp" %>