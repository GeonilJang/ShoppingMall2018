<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ include file="../ad_top.jsp" %>



<script type=text/javascript>
	function inputCheck(){
		if(!cat_inputFrm.code.value){
			alert("ī�װ� �ڵ带 �Է��ϼ���!!");
			cat_inputFrm.code.focus();
			return;
		}
		if(!cat_inputFrm.cname.value){
			alert("ī�װ� �̸��� �Է��ϼ���!!");
			cat_inputFrm.cname.focus();
			return;
		}
		cat_inputFrm.submit();
	}
	
</script>

<!-- ī�װ� ��� -->
<hr width=400 color="maroon">
<h2 align=center>ī�װ� ���</h2>
<hr width=400 color="maroon">

<form action="cat_regOK.jsp" method="post" name="cat_inputFrm">
	<table class="table table-hover table-border">
		<tr>
			<th>�ڵ�</th>
			<td><input type="text" name="code" maxlength=10></td>
		</tr>
		<tr>
			<th>ī�װ� �̸�</th>
			<td><input type="text" name="cname" maxlength=10></td>
		</tr> 
		<tr>
			<th colspan=2>
				<input type="reset" value="���" class="btn btn-danger pull-right">
				<input type="button" value="���" class="btn btn-success pull-right" onclick="inputCheck()">
			</th>
		</tr>
	</table>
</form>


<%@ include file="../ad_bottom.jsp" %>