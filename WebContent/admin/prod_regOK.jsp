<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="shoppingMall.*" %>
<!--  
	1. 파일 업로드 라이브러리 다운로드
	http:// www.servlets.com
	com.oreilly.servlets
	cos-26Des2008.zip


	WebConten 폴더 내에 포더생성
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