<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>상세 게시판</title>
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<div class="wrapper">
    <div id="detailForm" class="form">
        <table border="1">
            <tr>
                <th>제목</th>
                <td>${brd.title}</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${brd.writer}</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>${brd.regDate}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea style="width: 100%" cols="100" rows="30">${brd.content}</textarea></td>
            </tr>
        </table>
    </div>

    <div id="detailBtn">
        <button><a href="/list">목록</a></button>
        <button><a href="/modify?brdIdx=${brd.brdIdx}">수정</a></button>
        <button><a href="/delete?brdIdx=${brd.brdIdx}">삭제</a></button>
    </div>

    <form id="cmtWriterForm" action="/cmtwriter" method="post">
        <div style="margin-bottom: 3px">comment</div>
        <div id="cmtWriter">
            <input style="width: 90%" type="text">
            <button style="width: 10%">등록</button>
        </div>
    </form>

    <div id="cmtWrapper">
        <c:forEach var="brdCmt" items="${brdCmtList}">
            <div id="cmtBox" style="margin-left: ${brdCmt.cmtLvl}00px">
                <span>작성자 : ${brdCmt.cmtWriter} / </span>
                <span>작성일 : ${brdCmt.cmtRegDate}</span>
                <span><a style="color: blue">수정  </a><a style="color: red">삭제</a></span>
                <p>내용 : ${brdCmt.cmtContent}</p>

            </div>
        </c:forEach>
    </div>
</div>

<script>
    const url = '/cmtwriter';
    let paramObj = new Object();
    paramObj.content = content;
    let headerObj = new Headers();
    headerObj.append("content-type", "application/json");
    fetch(url, {
        method: "post",
        headers: headerObj,
        body: JSON.stringify(paramObj)
    }).then(response => {
        if (response.ok) {
            return response.text();
        }
        throw new AsyncPageError(response.text());
    }).then((text) => {
        if (text == 'success') {
            location.href = "/cmtwriter";
        } else {
        }
    }).catch(error => {
        error.alertMessage();
    });

    }
</script>
</body>
</html>
