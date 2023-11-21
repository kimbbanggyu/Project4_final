<%--
  Created by IntelliJ IDEA.
  User: 김영규
  Date: 2023-11-17
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form method="post" action="fileupload_ok.jsp" enctype="multipart/form-data">
        이미지 선택: <input type="file" name="img"/>
        <input type="submit" value="업로드"/>
    </form>
</body>
</html>
