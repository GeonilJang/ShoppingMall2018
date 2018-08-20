<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="shoppingMall.*, java.util.*" %>

<% 
	CategoryDAO cdao = CategoryDAO.getInstance();
	

%>    
<%@ include file="../ad_top.jsp" %>



<!-- ī�װ� ��� -->
<hr width=400 color="maroon">
<h2 align=center>��ǰ��� ������</h2>
<hr width=400 color="maroon">

<form action="prod_regOK.jsp" method="post" name="prodFrm" enctype="multipart/for-data">
	<table class="table table-hover table-border">
		<tr>
			<th>ī�װ�</th>
			<td>
			<select name="pcategory">
			<%
				ArrayList<CategoryDTO> cdtos = cdao.categoryAll();
				if(cdtos == null || cdtos.size() == 0){
			%>
				<option value="">ī�װ� ����</option>
			<%		
				}else{
					for(CategoryDTO cdto : cdtos){
						String cname = cdto.getCname();
						String code = cdto.getCode();
					%>
						<option value="<%=code%>"><%=cname%>[<%=code%>]</option>
					<%	
					}
			%>
								
			<%
			}
			%>

			</select>
			</td>
		</tr>
		<tr>
			<th>��ǰ��</th>
			<td align="left"><input type="text" name="pname" maxlength=10></td>
		</tr> 
		<tr>
			<th>����ȸ��</th>
			<td align="left"><input type="text" name="pcompany" maxlength=10></td>
		</tr>
		<tr>
			<th>��ǰ�̹���</th>
			<td><input type="file" name="pimage"></td>
		</tr>  
		<tr>
			<th>����</th>
			<td align="left"><input type="text" name="pqty" maxlength=8></td>
		</tr> 
		<tr>
			<th>��ǰ����</th>
			<td align="left"><input type="text" name="price" maxlength=8></td>
		</tr> 
		<tr>
			<th>��ǰ���</th>
			<td>
				<select name="pspec">
					<option value="none" selected>�Ϲ�</option>
					<option value="hit" >�α�</option>
					<option value="new" >�ֽ�</option>
					<option value="recommand" >��õ</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>��ǰ�Ұ�</th>
			<td>
				<textarea name="pcontents" rows="5" cols="50"></textarea>
			</td>
		</tr> 
		<tr>
			<th>��ǰ����Ʈ</th>
			<td align="left"><input type="text" name="point" maxlength=8></td>
		</tr> 
		<tr>
			<th colspan=2>
				<input type="reset" value="���" class="btn btn-danger pull-right">
				<input type="submit" value="���" class="btn btn-success pull-right">
			</th>
		</tr>
	</table>
</form>


<%@ include file="../ad_bottom.jsp" %>