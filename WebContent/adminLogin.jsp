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
	 <form class="form-signin" action="loginOk.jsp" method="post">
	   <h2 class="form-signin-heading">������ ������ �α���</h2>
	   <label for="inputEmail" class="sr-only">���̵�</label>
	   <input type="text" name="id" class="form-control" placeholder="������ ���̵�" value="<%if(session.getAttribute("id") !=null) out.println(session.getAttribute("id")); %>"  required autofocus>
	    <label for="inputPassword" class="sr-only">��й�ȣ</label>
	    <input type="password" id="inputPassword" class="form-control" placeholder="������ ��й�ȣ" name="pw" required>
	    <div class="checkbox">
	      <label>
	        <input type="checkbox" value="remember-me"> ���̵� �����ϱ�
	      </label>
	    </div>
	    <button class="btn btn-lg btn-primary btn-block" type="submit">�α���</button>
	  </form>
	</div> 
</body>
</html>