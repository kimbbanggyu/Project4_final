<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.code.MenuDAO"%>
<%@ page import="com.example.code.FileUpload" %>
<%@ page import="com.example.code.MenuVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	MenuDAO boardDAO = new MenuDAO();
	FileUpload upload = new FileUpload();
	MenuVO u = upload.uploadPhoto(request);

	int i=boardDAO.updateBoard(u);
	response.sendRedirect("index.jsp");
%>