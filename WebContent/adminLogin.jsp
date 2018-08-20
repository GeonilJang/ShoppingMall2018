<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	if(session.getAttribute("valid") != null){
%>
	<<jsp:forward page="ad_main.jsp"/>

<%    		
	}


%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.js" integrity="sha256-fNXJFIlca05BIO2Y5zh1xrShK3ME+/lYZ0j+ChxX2DA=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<hr>
			<h2 align="center">관리자 로그인</h2>
			<hr>
			<form action="loginOk.jsp" method="post">
				<ul style="list-style:none;" align="center">
					<li>아이디 : <input type="text" name="id" value="<%if(session.getAttribute("id") !=null) out.println(session.getAttribute("id")); %>" ></li>
					<li>비밀번호 : <input type="text" name="pw"></li> 
					<li><input type="submit" value="로그인" class="btn btn-primary" style="margin-top:30px;"></li>
				</ul>
				
			</form>
		</div>
	</div>
</div>
</body>
</html>