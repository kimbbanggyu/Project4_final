<%--
  Created by IntelliJ IDEA.
  User: 김영규
  Date: 2023-11-21
  Time: 오전 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.example.code.MenuDAO, com.example.code.MenuVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        .menu_board{
            display: block;
            background-color: red;
            border: 6px dashed yellow;
            animation: 1s mymove infinite;
        }
        @keyframes mymove{
            0%{border: 6px dashed yellow;}
            100%{border: 6px dashed yellowgreen;}
        }

        .dragon{
            width: 125px;
            height: 125px;;
        }
        .dragon1{
            width: 125px;
            height: 125px;;
            position: absolute;
            right: 10px;
        }
        #name{
            top: 40px;;
            bottom:0;
            left: 724px;
            position: absolute;
            color: goldenrod;
            font-weight: bold;
            text-align: center;
            height: fit-content;
        }
        .phone_number{
            display: block;
            text-align: center;
            margin-top: 30px;
            color: black;

        }
        #autoby{
            position: absolute;
            left:300px;
            width: 200px;
            height: 150px;
            animation: 3s mymove1 infinite;
        }
        @keyframes mymove1{
            0%{left: 150px;}
            100%{left: 0px;}
        }
        #phone_num{
            margin-left: 112px;
        }
        #phone_num1{
            margin-left: 166px;
        }
        #list {
            margin-top: 50px;
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align:center;
        }
        #list tr:nth-child(even){background-color: #f2f2f2;}
        #list td:nth-child(odd){background-color: #cd2121; font-style: italic; color: blanchedalmond; font-size: x-large}
        #list tr:hover {background-color: #ddd;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #cd2121;
            color: white;
        }
        #button1{
            margin-left: 724px;
        }
    </style>

    <title>Title</title>
</head>
<body>
<%
    MenuDAO boardDAO = new MenuDAO();
    String id=request.getParameter("id");
    MenuVO u=boardDAO.getBoard(Integer.parseInt(id));
    request.setAttribute("vo",u);
%>
<script>
    function delete_ok(id){
        var a = confirm("정말로 삭제하겠습니까?");
        if(a) location.href='deletepost.jsp?id=' + id;
    }
</script>
    <div class="menu_board">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE5ug4EKR9PJRTCQ4OVga2yy2c00_TwZzLKw&usqp=CAU" class="dragon"/>
        <h1 id = "name">${vo.getMenu()}</h1>
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE5ug4EKR9PJRTCQ4OVga2yy2c00_TwZzLKw&usqp=CAU" class="dragon1"/>
    </div>
    <table table id="list" width="90%">
        <tr><td>번호</td><td>${vo.getId()}</td></tr>
        <tr><td>메뉴</td><td>${vo.getMenu()}</td></tr>
        <tr><td>이미지</td><td><c:if test="${vo.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" style="height:300px; width:300px"></c:if></td></tr>
        <tr><td>가격</td><td>${vo.getPrice()}</td></tr>
        <tr><td>원산지</td><td>${vo.getOrigin()}</td></tr>
        <tr><td>손님 후기</td><td>${vo.getReview()}</td></tr>
        <tr><td>등록일자</td><td>${vo.getRegdate()}</td></tr>

    </table>
    <a href="index.jsp" class="btn btn-info" id="button1">홈</a>
    <a href="editform.jsp?id=${vo.getId()}" class="btn btn-info" id="button2">수정하기</a>
    <a href="javascript:delete_ok('${vo.getId()}')" class="btn btn-info" id="button3">삭제하기</a>
</body>
</html>
