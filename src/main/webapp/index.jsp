<%@page import="com.example.code.MenuDAO, com.example.code.MenuVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Menu_index.jsp</title>
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
            left: 600px;
            position: absolute;
            color: goldenrod;
            font-weight: bold;
            height: fit-content;
        }
        .phone_num{

            text-align: center;
            margin-top: 30px;
            color: black;
            
        }
        #star1{
            color: gold;
            top:220px;
            right:60px;
            position:absolute;
            box-shadow: 3px 3px 3px gold;
        }
        #star2{
            color: gold;
            top:220px;
            right:110px;
            position:absolute;
            box-shadow: 3px 3px 3px gold;
        }
        #star3{
            color: gold;
            top:220px;
            right:160px;
            position:absolute;
            box-shadow: 3px 3px 3px gold;
        }
        #star4{
            color: gold;
             top:220px;
             right:210px;
             position:absolute;
            box-shadow: 3px 3px 3px gold;
         }
        #star5{
            color: gold;
            top:220px;
            right:260px;
            position:absolute;
            box-shadow: 3px 3px 3px gold;
        }
        #star{
            color: dimgrey;
            top:260px;
            right:60px;
            position:absolute;
        }



        #autoby{
            position: absolute;
            left:300px;
            width: 200px;
            height: 150px;
            animation: 2.5s mymove1 infinite;
        }
        @keyframes mymove1{
            0%{left: 290px;}
            100%{left: 0px;}
        }
        #phone_num{
            margin-left: 112px;
        }
        #phone_num1{
            margin-left: 166px;
        }
        #list {
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
        #list tr:hover {background-color: #ddd;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #cd2121;
            color: white;
        }
    </style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='deletepost.jsp?id=' + id;
        }

    </script>
</head>
<body>
<%
    MenuDAO boardDAO = new MenuDAO();
    List<MenuVO> list = boardDAO.getBoardList();
    request.setAttribute("list",list);
%>
    <div class="menu_board">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE5ug4EKR9PJRTCQ4OVga2yy2c00_TwZzLKw&usqp=CAU" class="dragon"/>
        <h1 id = "name">쌍용원 중국집입니다.</h1>
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE5ug4EKR9PJRTCQ4OVga2yy2c00_TwZzLKw&usqp=CAU" class="dragon1"/>
    </div>
    <div class="phone_number">
        <img src="https://image.kmib.co.kr/online_image/2012/1031/121031_22_2.jpg" id="autoby"/>
        <h1 class="phone_num">전화 끊자마자 배달 도착!!!</h1>
        <h1 class="phone_num"> 모토: 신속 정확~</h1>
        <h1 class="phone_num">전화번호: <a href="phone.jsp"> 031-692-1881</a></h1>
        <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 25 25" id="star1">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 25 25" id="star2">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 25 25" id="star3">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 25 25" id="star4">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 25 25" id="star5">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
        </svg>
        <h1 id="star">별이 다섯개!!!</h1>
    </div>
    <br>
    <table id="list" width="90%">
        <tr>
            <th>Id</th>
            <th>Menu</th>
            <th>Img</th>
            <th>Price</th>
            <th>Origin</th>
            <th>Review</th>
            <th>Regdate</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    <c:forEach items="${list}" var="u">
        <tr href="#" onclick="location.href='view.jsp?id=${u.getId()}'">
            <td>${u.getId()}</td>
            <td>${u.getMenu()}</td>
<%--            <td>${u.getPhoto()}</td>--%>
            <td><c:if test="${u.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" style="height:150px; width:150px"></c:if></td>
            <td>${u.getPrice()}</td>
            <td>${u.getOrigin()}</td>
            <td>${u.getReview()}</td>
            <td>${u.getRegdate()}</td>
            <td><a href="editform.jsp?id=${u.getId()}">Edit</a></td>
            <td><a href="javascript:delete_ok('${u.getId()}')">Delete</a></td>
        </tr>
    </c:forEach>
    </table>
    <br>

    <a href="addpostform.jsp" class="btn btn-info">추가하기</a>
</body>
</html>