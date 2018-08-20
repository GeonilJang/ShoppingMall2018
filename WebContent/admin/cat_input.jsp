<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ include file="../ad_top.jsp" %>



<script type=text/javascript>
	function inputCheck(){
		if(!cat_inputFrm.code.value){
			alert("카테고리 코드를 입력하세요!!");
			cat_inputFrm.code.focus();
			return;
		}
		if(!cat_inputFrm.cname.value){
			alert("카테고리 이름를 입력하세요!!");
			cat_inputFrm.cname.focus();
			return;
		}
		cat_inputFrm.submit();
	}
	
</script>

<!-- 카테고리 등록 -->
<hr width=400 color="maroon">
<h2 align=center>카테고리 등록</h2>
<hr width=400 color="maroon">

<form action="cat_regOK.jsp" method="post" name="cat_inputFrm">
	<table class="table table-hover table-border">
		<tr>
			<th>코드</th>
			<td><input type="text" name="code" maxlength=10></td>
		</tr>
		<tr>
			<th>카테고리 이름</th>
			<td><input type="text" name="cname" maxlength=10></td>
		</tr> 
		<tr>
			<th colspan=2>
				<input type="reset" value="취소" class="btn btn-danger pull-right">
				<input type="button" value="등록" class="btn btn-success pull-right" onclick="inputCheck()">
			</th>
		</tr>
	</table>
</form>


<%@ include file="../ad_bottom.jsp" %>