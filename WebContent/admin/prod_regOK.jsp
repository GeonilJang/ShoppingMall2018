<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="shoppingMall.*" %>
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

	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "euc-kr", new DefaultFileRenamePolicy());
	
	ProductDAO pdao = ProductDAO.getInstance();
	pdao.registerProduct(multi);
	
	
	
	
	
	
	
	
%>