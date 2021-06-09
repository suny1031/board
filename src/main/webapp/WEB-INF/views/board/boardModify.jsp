<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시글 수정</title>
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<div class="wrapper">
    <form class="form" action="/modifyimpl" method="post">
        <table border="1">
                <input type="hidden" name="brdIdx" value="${brd.brdIdx}">
            <tr>
                <th>제목</th>
                <td><input name="title" placeholder="${brd.title}"/></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input name = "writer" readonly value="${brd.writer}"/></td>
            </tr>
            <tr>
                <th>게시일</th>
                <td><input name="regDate" readonly value="${brd.regDate}"/></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name ="content" style="width: 100%;" cols="100" rows="30" placeholder="${brd.content}"></textarea></td>
            </tr>
        </table>
        <button id = "modifyBtn">확인</button>
    </form>
</div>
</body>
</html>
