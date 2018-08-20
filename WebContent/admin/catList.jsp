<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="shoppingMall.*, java.util.*" %>



<%@ include file="../ad_top.jsp" %>


<h3>ī�װ� ����Ʈ</h3>
<table class="table table-hover table-border">
	<thead>
		<tr>
			<th>��ȣ</th><th>�ڵ�</th><th>ī�װ���</th><th>����</th>
		</tr>
	</thead>
	<tbody>
	<%
		CategoryDAO cdao = CategoryDAO.getInstance();
		ArrayList<CategoryDTO> cdtos = cdao.categoryAll();
		
		if(cdtos == null || cdtos.size() == 0){
			out.println("<tr><td colspan=4>��ϵ� ī�װ��� �����ϴ�.</td></tr>");
		}else{
			
			for(CategoryDTO cdto : cdtos){
	%>
			<tr>
				<td><%= cdto.getCnum() %></td>
				<td><%= cdto.getCode() %></td>
				<td><%= cdto.getCname() %></td>
				<td><a href="catDelete.jsp?cnum=<%= cdto.getCnum() %>">����</a></td>
			</tr>
			
			
		<%}
			}%>
	</tbody>

</table>




<%@ include file="../ad_bottom.jsp" %>