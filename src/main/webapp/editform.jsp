<%@ page import="com.example.code.MenuDAO, com.example.code.MenuVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            left: 500px;
            position: absolute;
            text-align: center;
            color: goldenrod;
            font-weight: bold;
            height: fit-content;
        }
        #list {
            margin-top: 25px;
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            height: 500px;
        }
        #list td, #list th {
            border: 5px solid #ddd;
            padding: 8px;
            text-align:center;
        }
        #list tr {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: white;
        color: black;
        font-weight: bold;
        }
    </style>
</head>
<body>
<%
    MenuDAO boardDAO = new MenuDAO();
    String id=request.getParameter("id");
    System.out.println("edit의 id = " + id);
    MenuVO u=boardDAO.getBoard(Integer.parseInt(id));
    request.setAttribute("vo",u);
%>
    <div class="menu_board">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE5ug4EKR9PJRTCQ4OVga2yy2c00_TwZzLKw&usqp=CAU" class="dragon"/>
        <h1 id = "name">메뉴 수정하는 페이지(for 싸장님)</h1>
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE5ug4EKR9PJRTCQ4OVga2yy2c00_TwZzLKw&usqp=CAU" class="dragon1"/>
    </div>


        <form name="form1" action="edit.jsp" onsubmit="return validateform()" method="post" enctype="multipart/form-data">
        <table id="list" width="90%">
            <input type="hidden" name="id" value="<%=u.getId() %>"/>
            <tr><td>메뉴 이름: </td>
            <td><input type="text" name="menu" id="menu" style="width: 600px; height: 30px;" value="<%=u.getMenu() %>"></td></tr>
            <tr><td>메뉴 이미지: </td>
            <td><input type="file" name="photo" id="photo"  value="${vo.getPhoto()}"/><br>
                <c:if test="${vo.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" style="height:300px; width:300px"></c:if>
            </td></tr>
            <tr><td>가격</td>
            <td><input type="text" name="price" id="price" style="width: 600px; height: 30px;" value="<%=u.getPrice() %>"></td></tr>
            <tr><td>원산지</td>
            <td><input type="text" name="origin" id="origin" style="width: 600px; height: 30px;" value="<%=u.getOrigin() %>"></td></tr>
            <tr><td>손님 후기</td>
                <td><textarea name="review" rows="5" style="width: 600px; " ><%=u.getReview() %></textarea></td>
            </table><input type="submit" value="수정하기"/>
            <input type="button" value="취소하기" onclick="history.back()">
      </form>


    <script>
        function validateform(){
            var menu = document.form1.menu;
            if(menu.value ==""){
                alert("메뉴 이름을 입력해주세요!");
                return false;
            }
            var price = document.form1.price;
            if(price.value == ""){
                alert("상품의 가격을 입력해주세요!");
                return false;
            }


            alert("게시물이 추가됩니다.");
            return true;

        }
    </script>

</body>
</html>