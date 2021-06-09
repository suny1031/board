<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시판 작성</title>
    <link rel="stylesheet" href="/resources/css/main.css">
<body>
<div class="wrapper">
    <form id="uploadForm" class="form" action="/uploadimpl" method="post">
        <table border="1">
            <tr>
                <th>제목</th>
                <td><input name="title" type="text"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" required="required" style="width: 100%"  rows="20" cols="100" ></textarea></td>
            </tr>
        </table>
        <button id ="writerBnt" type="submit">작성</button>
    </form>
</div>
</body>
</html>
