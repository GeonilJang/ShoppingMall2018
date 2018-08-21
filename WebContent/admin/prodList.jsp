<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="shoppingMall.*, java.util.*" %>


<%@ include file="../ad_top.jsp" %>

<script type="text/javascript">
	function checkDel(pnum, pimage){
		let isDel = window.confirm("���� �Ͻðڽ��ϱ�?");
		if(isDel) location.href="prodDelete.jsp?pnum="+pnum+"&pimage="+pimage;
		else location.reload();
	}//checkDel()
</script>

<div class="panel panel-info">
  <div class="panel-heading" id="titleButton"><h3 align="center">��ǰ ����Ʈ</h3></div>
  <div class="panel-body" id="buttonInfo">
  	<table class="table table-hover table-border">
		<thead>
			<tr>
				<th>��ȣ</th>
				<th>ī�װ� �ڵ�</th>
				<th>��ǰ��</th>
				<th>�̹���</th>
				<th>����</th>
				<th>������</th>
				<th>����</th>
				<th>����/����</th>
			</tr>
		</thead>
		<tbody>
		<%
			ProductDAO pdao = ProductDAO.getInstance();
			ArrayList<ProductDTO> pdtos = pdao.productAll();
			if(pdtos == null || pdtos.size() == 0){
				out.println("<tr><td colspan=8>��ǰ �����Ͱ� �����ϴ�.</td></tr></tbody></table>");
				return; //�����Ͱ� ���� ���
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
				<td><a href="prodUpdate.jsp?pnum=<%=pdto.getPnum()%>" class="btn btn-info">����</a> 
				<a href="javascript:checkDel('<%=pdto.getPnum()%>','<%=pdto.getPimage()%>')" class="btn btn-danger">����</a></td>
			</tr>
			<%
				} 
			%>
		</tbody>
	</table>
  </div>
</div>

<%@ include file="../ad_bottom.jsp" %>