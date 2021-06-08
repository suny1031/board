<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>상세 게시판</title>
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<div class="wrapper">
    <div class="form">
        <table border="1">
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성일</th>
            <tr>
                <td>${brd.brdIdx}</td>
                <td>${brd.title}</td>
                <td>${brd.content}</td>
                <td>${brd.writer}</td>
                <td>${brd.regDate}</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
