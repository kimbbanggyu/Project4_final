<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.code.MenuDAO, com.example.code.MenuVO"%>
<%@ page import="com.example.code.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		MenuVO u = new MenuVO();
		u.setId(id);
		MenuDAO boardDAO = new MenuDAO();
		String filename = boardDAO.getPhotoFilename(id);
		if(filename != null) FileUpload.deleteFile(request,filename);
		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("index.jsp");
%>