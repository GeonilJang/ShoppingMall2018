<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="shoppingMall.*, java.util.*" %>

<% 
	CategoryDAO cdao = CategoryDAO.getInstance();
	

%>    
<%@ include file="../ad_top.jsp" %>



<!-- 카테고리 등록 -->
<hr width=400 color="maroon">
<h2 align=center>상품등록 페이지</h2>
<hr width=400 color="maroon">

<form action="prod_regOK.jsp" method="post" name="prodFrm" enctype="multipart/for-data">
	<table class="table table-hover table-border">
		<tr>
			<th>카테고리</th>
			<td>
			<select name="pcategory">
			<%
				ArrayList<CategoryDTO> cdtos = cdao.categoryAll();
				if(cdtos == null || cdtos.size() == 0){
			%>
				<option value="">카테고리 없음</option>
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
			<th>상품명</th>
			<td align="left"><input type="text" name="pname" maxlength=10></td>
		</tr> 
		<tr>
			<th>제조회사</th>
			<td align="left"><input type="text" name="pcompany" maxlength=10></td>
		</tr>
		<tr>
			<th>상품이미지</th>
			<td><input type="file" name="pimage"></td>
		</tr>  
		<tr>
			<th>수량</th>
			<td align="left"><input type="text" name="pqty" maxlength=8></td>
		</tr> 
		<tr>
			<th>상품가격</th>
			<td align="left"><input type="text" name="price" maxlength=8></td>
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
				<textarea name="pcontents" rows="5" cols="50"></textarea>
			</td>
		</tr> 
		<tr>
			<th>상품포인트</th>
			<td align="left"><input type="text" name="point" maxlength=8></td>
		</tr> 
		<tr>
			<th colspan=2>
				<input type="reset" value="취소" class="btn btn-danger pull-right">
				<input type="submit" value="등록" class="btn btn-success pull-right">
			</th>
		</tr>
	</table>
</form>


<%@ include file="../ad_bottom.jsp" %>