<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="shoppingMall.*,com.oreilly.servlet.*" %>
<!--  
	1. ���� ���ε� ���̺귯�� �ٿ�ε�
	http:// www.servlets.com
	com.oreilly.servlets
	cos-26Des2008.zip


	WebConten ���� ���� ��������
-->

<%
	request.setCharacterEncoding("euc-kr");
	String msg="", url="";

	String uploadPath = request.getSession().getServletContext().getRealPath("uploadFile");
	int maxSize = 1024*1024*10; // 10mb;
	String filename = "";
	String originFile ="";

	
	try{
		//���� ���ε��� �� ����ϴ� request  �ΰ�����
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "euc-kr", new DefaultFileRenamePolicy());
		
		ProductDAO pdao = ProductDAO.getInstance();
		int n = pdao.registerProduct(multi);
		
		if(n>0){
			msg="��ǰ��� �Ϸ�Ǿ����ϴ�.";
			url ="prodList.jsp";
		}else{
			msg="��ǰ��� �����߽��ϴ�.";
			url ="prod_input.jsp";
		}
	}catch(Exception e){
		msg = "�̹��� ���� ���ε� ����";
		url ="prod_input.jsp";
		e.printStackTrace();
	}
%>


<script type="text/javascript">
	alert("<%= msg %>");
	location.href="<%=url%>";
</script>


