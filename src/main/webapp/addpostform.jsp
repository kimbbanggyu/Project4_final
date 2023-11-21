<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
            left: 300px;
            position: absolute;
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
    <div class="menu_board">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE5ug4EKR9PJRTCQ4OVga2yy2c00_TwZzLKw&usqp=CAU" class="dragon"/>
        <h1 id = "name">메뉴 추가하기 페이지(for 싸장님)</h1>
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE5ug4EKR9PJRTCQ4OVga2yy2c00_TwZzLKw&usqp=CAU" class="dragon1"/>
    </div>

    <middle class="middle">
        <form name = "form1" action="addpost.jsp" onsubmit="return validateform()" method="post" enctype="multipart/form-data" >
        <table id="list" width="90%">
            <tr><td>메뉴 이름: </td>
            <td><input type="text" name="menu" id="menu" style="width: 600px; height: 30px;"></td></tr>
            <tr><td>메뉴 이미지: </td>
            <td><input type="file" name="photo"/></td></tr>
            <tr><td>가격</td>
            <td><input type="text" name="price" id="price" style="width: 600px; height: 30px;"></td></tr>
            <tr><td>원산지</td>
            <td><input type="text" name="origin" id="origin" style="width: 600px; height: 30px;"></td></tr>
            <tr><td>손님 후기</td>
                <td><textarea name="review" rows="5" style="width: 600px; "></textarea></td>
            </table>
            <input type="submit"value="추가하기"> <input type="reset"value="다시입력">
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