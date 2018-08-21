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
	 ProductDTO pdto = pdao.selectProduct(pnum.trim()); // 상품 가져오기
	
	 if(pdto == null){
		 %>
		 <script type="text/javascript">
			alert("<%=pnum%>번 상품이 존재하지 않습니다.");
			history.back(); //location.href="productUpdate.jsp" , history.go(-1), 
		 </script>
		 <%
	 }
	 
%>

<%@ include file="../ad_top.jsp" %>
<!-- 상품수정 -->

<div class="panel panel-info">
    <div class="panel-heading"><h3 align=center>상품수정 페이지</h3></div>
	<div class="panel-body">
	    <form action="prodUpdate_Ok.jsp" method="post" name="" enctype="multipart/form-data">
	    	<input type="hidden" name="pnum" value="<%=pdto.getPnum()%>"/>
			<table class="table table-hover table-border">
				<tr>
					<th>카테고리</th>
					<td>
						<select name="pcategory_fk">
							<%
								CategoryDAO cdao = CategoryDAO.getInstance();
								ArrayList<CategoryDTO> cdtos = cdao.categoryAll();
								if(cdtos == null || cdtos.size() == 0){
							%>
								<option value="">카테고리 없음</option>
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
					<th>상품명</th>
					<td align="left"><input type="text" name="pname" maxlength=10 value="<%=pdto.getPname()%>"></td>
				</tr> 
				<tr>
					<th>제조회사</th>
					<td align="left"><input type="text" name="pcompany" maxlength=10 value="<%=pdto.getPcompany()%>"></td>
				</tr>
				<tr>
					<th>상품이미지</th>
					<td>
						<img src="../uploadFile/<%=pdto.getPimage()%>" width=50 height=50/>
						<input type="file" name="pimageNew"/>
						<input type="hidden" name="pimageOld" value="<%=pdto.getPimage()%>"/>
					</td>
				</tr>  
				<tr>
					<th>수량</th>
					<td align="left"><input type="text" name="pqty" maxlength=8 value="<%=pdto.getPqty()%>"></td>
				</tr> 
				<tr>
					<th>상품가격</th>
					<td align="left"><input type="text" name="price" maxlength=8 value="<%=pdto.getPrice()%>"></td>
				</tr> 
				<tr>
					<th>상품사양</th>
					<td>
						<select name="pspec">
							<option value="none" selected>일반</option>
							<option value="hit" >인기</option>
							<option value="new" >최신</option>
							<option value="recommand" >추천</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>상품소개</th>
					<td>
						<textarea name="pcontents" rows="5" cols="50"><%=pdto.getPcontents()%></textarea>
					</td>
				</tr> 
				<tr>
					<th>상품포인트</th>
					<td align="left"><input type="text" name="point" maxlength=8 value="<%=pdto.getPoint()%>"></td>
				</tr> 
				<tr>
					<th colspan=2>
						<a href="prodList.jsp"><input type="button" class="btn btn-danger pull-right" value="취소"></a>
						<input type="submit" value="변경" class="btn btn-success pull-right">
					</th>
				</tr>
			</table>
		</form> 
    </div>
</div>

<%@ include file="../ad_bottom.jsp" %>