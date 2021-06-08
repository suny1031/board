<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시판 작성</title>
    <link rel="stylesheet" href="/resources/css/main.css">
<body>
<div class="wrapper">
    <form id="uploadForm" class="form" action="/uploadimpl" method="post">
        <label>제목 : <input style="width: 800px" type="text" name = "title"></label>
        <label>내용 : <textarea name = "content" required="required" rows="20" cols="100"></textarea></label>
        <button type="submit">작성</button>
    </form>
</div>

</body>
</html>
