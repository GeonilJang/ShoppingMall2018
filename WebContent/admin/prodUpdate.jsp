<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="shoppingMall.*, java.util.*" %>
  
  
<%
	String pnum = request.getParameter("pnum");
	 if(pnum == null || pnum.trim().equals("")){
		 response.sendRedirect("prodList.jsp");
		 return;
	 }// if
	 
	 ProductDAO pdao = ProductDAO.getInstance();
	 ProductDTO pdto = pdao.selectProduct(pnum.trim()); // ��ǰ ��������
	
	 if(pdto == null){
		 %>
		 <script type="text/javascript">
			alert("<%=pnum%>�� ��ǰ�� �������� �ʽ��ϴ�.");
			history.back(); //location.href="productUpdate.jsp" , history.go(-1), 
		 </script>
		 <%
	 }
	 
%>

<%@ include file="../ad_top.jsp" %>
<!-- ��ǰ���� -->

<div class="panel panel-info">
    <div class="panel-heading"><h3 align=center>��ǰ���� ������</h3></div>
	<div class="panel-body">
	    <form action="prodUpdate_Ok.jsp" method="post" name="" enctype="multipart/form-data">
	    	<input type="hidden" name="pnum" value="<%=pdto.getPnum()%>"/>
			<table class="table table-hover table-border">
				<tr>
					<th>ī�װ�</th>
					<td>
						<select name="pcategory_fk">
							<%
								CategoryDAO cdao = CategoryDAO.getInstance();
								ArrayList<CategoryDTO> cdtos = cdao.categoryAll();
								if(cdtos == null || cdtos.size() == 0){
							%>
								<option value="">ī�װ� ����</option>
							<%		
								}else{
									for(CategoryDTO cdto : cdtos){
										String cname = cdto.getCname();
										String code = cdto.getCode();
										if(cdto.getCode().equals(pdto.getPcategory_fk())){
									%>
										<option value="<%=code%>" selected><%=cname%>[<%=code%>]</option>
									<%
										}else{ %>
											<option value="<%=code%>"><%=cname%>[<%=code%>]</option>
										<%}//else
									}//for
									%>
							<%
							}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<th>��ǰ��</th>
					<td align="left"><input type="text" name="pname" maxlength=10 value="<%=pdto.getPname()%>"></td>
				</tr> 
				<tr>
					<th>����ȸ��</th>
					<td align="left"><input type="text" name="pcompany" maxlength=10 value="<%=pdto.getPcompany()%>"></td>
				</tr>
				<tr>
					<th>��ǰ�̹���</th>
					<td>
						<img src="../uploadFile/<%=pdto.getPimage()%>" width=50 height=50/>
						<input type="file" name="pimageNew"/>
						<input type="hidden" name="pimageOld" value="<%=pdto.getPimage()%>"/>
					</td>
				</tr>  
				<tr>
					<th>����</th>
					<td align="left"><input type="text" name="pqty" maxlength=8 value="<%=pdto.getPqty()%>"></td>
				</tr> 
				<tr>
					<th>��ǰ����</th>
					<td align="left"><input type="text" name="price" maxlength=8 value="<%=pdto.getPrice()%>"></td>
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
						<textarea name="pcontents" rows="5" cols="50"><%=pdto.getPcontents()%></textarea>
					</td>
				</tr> 
				<tr>
					<th>��ǰ����Ʈ</th>
					<td align="left"><input type="text" name="point" maxlength=8 value="<%=pdto.getPoint()%>"></td>
				</tr> 
				<tr>
					<th colspan=2>
						<a href="prodList.jsp"><input type="button" class="btn btn-danger pull-right" value="���"></a>
						<input type="submit" value="����" class="btn btn-success pull-right">
					</th>
				</tr>
			</table>
		</form> 
    </div>
</div>

<%@ include file="../ad_bottom.jsp" %>