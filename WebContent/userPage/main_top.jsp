<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="shoppingMall.*,java.util.*,java.net.*"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link rel="icon" href="../../favicon.ico">
	<link rel="stylesheet" href="http://bootstrapk.com/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://bootstrapk.com/examples/dashboard/dashboard.css">

	<title>쇼핑몰에 오신것을 환영합니다.</title>
	
  </head>

  <body>
  
<!-- 위에 네이게이션 -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%=request.getContextPath()%>/userPage/main.jsp">쇼핑몰 홈</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="<%=request.getContextPath()%>/adminLogin.jsp">관리자</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>


<!-- 왼쪽 네이버게이션 -->
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
          <%
          	CategoryDAO cdao = CategoryDAO.getInstance();
          	ArrayList<CategoryDTO> cdtos =cdao.categoryAll();
          	
          	if(cdtos != null && cdtos.size() !=0){
          		for(CategoryDTO cdto:cdtos){
          			
          			String cname = cdto.getCname();
          			String code = cdto.getCode();
           			
					//code=URLEncoder.encode(cname, "UTF-8");
          			cname=URLEncoder.encode(cname, "UTF-8");
          			/* URL url = new URL("http://www.test.com/login.jsp?id="+id+"&pass="+pass); */


 		  %>
				<li><a href="catList.jsp?category_fk=<%=code%>&cname=<%=cname%>"><%=cdto.getCname() %></a></li>
          			
		 <%
          		}//for
          	}//if
          	else{
          		out.println("<li>카테고리 내용이 없음!!</li>");
          	}
          %>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="#">네비2</a></li>
            <li><a href="#">네비2</a></li>
            <li><a href="#">네비2</a></li>
            <li><a href="#">네비2</a></li>
            <li><a href="#">네비2</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="#">네비1</a></li>
            <li><a href="#">네비1</a></li>
            <li><a href="#">네비1</a></li>
          </ul>
        </div>