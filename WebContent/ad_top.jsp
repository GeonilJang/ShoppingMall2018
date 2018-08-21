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
			<nav class="navbar navbar-inverse navbar-fixed">
		      <div class="container">
		        <div class="navbar-header">
		          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		          </button>
		          <a class="navbar-brand" href="#">어디민 페이지</a>
		        </div>
		        <div id="navbar" class="collapse navbar-collapse">
		          <ul class="nav navbar-nav">
		            <li class="active"><a href="<%=request.getContextPath()%>/ad_main.jsp">관리자 홈</a></li>
		            <li><a href="<%=request.getContextPath()%>/userPage/main.jsp">쇼핑몰 홈</a></li>
		            <li><a href="<%=request.getContextPath()%>/admin/cat_input.jsp">카테고리 등록</a></li>
		            <li><a href="<%=request.getContextPath()%>/admin/catList.jsp">카테고리 리스트</a></li>
		            <li><a href="<%=request.getContextPath()%>/admin/prod_input.jsp">상품 등록</a></li>
		            <li><a href="<%=request.getContextPath()%>/admin/prodList.jsp">상품 리스트</a></li>
		            <li class="dropdown">
		              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
		              <ul class="dropdown-menu" role="menu">
		                <li><a href="#">Action</a></li>
		                <li><a href="#">Another action</a></li>
		                <li><a href="#">Something else here</a></li>
		                <li class="divider"></li>
		                <li class="dropdown-header">Nav header</li>
		                <li><a href="#">Separated link</a></li>
		                <li><a href="#">One more separated link</a></li>
		              </ul>
		            </li>
		          </ul>
		        </div><!--/.nav-collapse -->
		      </div>
		    </nav>

