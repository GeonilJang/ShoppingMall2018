<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.js" integrity="sha256-fNXJFIlca05BIO2Y5zh1xrShK3ME+/lYZ0j+ChxX2DA=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<hr>
			<h2 align="center"><a href="<%=request.getContextPath()%>/ad_main.jsp">������ ������</a></h2>
			<hr>
			
			<table class="table table-hober table-border"> 
				<tr>
					<td><a href="<%=request.getContextPath()%>/ad_main.jsp">������ Ȩ</a></td>
					<td><a href="<%=request.getContextPath()%>/ad_main.jsp">���θ� Ȩ</a></td>
					<td><a href="<%=request.getContextPath()%>/admin/cat_input.jsp">ī�װ� ���</a></td>
					<td><a href="<%=request.getContextPath()%>/admin/catList.jsp">ī�װ� ����Ʈ</a></td>
					<td><a href="<%=request.getContextPath()%>/admin/prod_input.jsp">��ǰ ���</a></td>
					<td><a href="#">��ǰ ����Ʈ</a></td>
				</tr>
			</table>
