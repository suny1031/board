<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시판 목록</title>
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<div class="wrapper">
    <button id="writerBnt"><a href="/upload">글쓰기</a></button>
    <div id="listForm" class="form">
        <table border="1">
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성일</th>
            <c:forEach var="brd" items="${brdList}">
                <tr>
                    <td><a href="/detail?brdIdx=${brd.brdIdx}">${brd.brdIdx}</a></td>
                    <td>${brd.title}</td>
                    <td>${brd.content}</td>
                    <td>${brd.writer}</td>
                    <td>${brd.regDate}</td>
                </tr>
            </c:forEach>
        </table>

    </div>
</div>
</body>
</html>
