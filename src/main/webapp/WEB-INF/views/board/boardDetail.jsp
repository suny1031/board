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
            <input id="brdIdx" type="hidden" value="${brd.brdIdx}">
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

    <div id="cmtWriterForm">
        <div style="margin-bottom: 3px">comment</div>
        <div id="cmtWriterBox">
            <input id="cmtContent" type="text">
            <button id="cmtWriterBtn">등록</button>
        </div>
    </div>

    <div id="cmtWrapper">
        <c:forEach var="brdCmt" items="${brdCmtList}">
            <div id="cmtBox${brdCmt.cmtIdx}" class="box" style="margin-left: ${brdCmt.cmtLvl}00px">
                <span><b>작성자</b> : ${brdCmt.cmtWriter} / </span>
                <span><b>작성일</b> : ${brdCmt.cmtRegDate}</span>
                <span>
                    <a id="RcmtWriterBtn" onclick="RcmtWriter(${brdCmt.cmtIdx})" style="color: green">[답글]</a>
                    <a id="cmtModifyBtn" onclick="cmtModify(${brdCmt.cmtIdx})" style="color: blue">수정</a>
                    <a id="cmtDeleteBtn" onclick="cmtDelete(${brdCmt.cmtIdx},${brdCmt.cmtGrp},${brdCmt.cmtLvl})"style="color: red">삭제</a>
                </span>
                <p><b>내용</b> : ${brdCmt.cmtContent}</p>
            </div>

            <div id="cmtModifyBox${brdCmt.cmtIdx}" class="box" style="display: none">
                <form action="/cmtmodify" method="post">
                    <input type="hidden" name="cmtIdx" value="${brdCmt.cmtIdx}">
                    <input type="hidden" name="brdIdx" value="${brdCmt.brdIdx}">

                    <span>작성자 : ${brdCmt.cmtWriter} / </span>
                    <span>작성일 : ${brdCmt.cmtRegDate}</span>
                    <p style="display: flex">
                        <textarea id="cmtContentModify" name="cmtContent" cols="40"
                                  placeholder="${brdCmt.cmtContent}"></textarea>
                        <button id="cmtWriterModifyBtn">수정</button>
                    </p>
                </form>
            </div>

            <div id="RcmtWriterBox${brdCmt.cmtIdx}" style="display: none">
                <form action="/rcmtupload" method="post">
                    <input type="hidden" name="cmtIdx" value="${brdCmt.cmtIdx}">
                    <input type="hidden" name="brdIdx" value="${brdCmt.brdIdx}">
                    <input type="hidden" name="cmtGrp" value="${brdCmt.cmtGrp}">
                    <input type="hidden" name="cmtSeq" value="${brdCmt.cmtSeq}">
                    <input type="hidden" name="cmtLvl" value="${brdCmt.cmtLvl}">
                    L<input id="RcmtContent" name="cmtContent" type="text">
                    <button id="RcmtUploadBtn">등록</button>
                </form>
            </div>

        </c:forEach>
    </div>
</div>

<script>

    document.querySelector("#cmtWriterBtn").addEventListener('click', (e) => {

        let cmtContent = document.querySelector("#cmtContent").value;
        let brdIdx = document.querySelector("#brdIdx").value;

        console.log(cmtContent);
        const url = '/cmtuploadimpl';
        let paramObj = new Object();
        paramObj.cmtContent = cmtContent;
        paramObj.brdIdx = brdIdx;

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
                location.href = "/detail?brdIdx=" + brdIdx;
            } else {
            }
        }).catch(error => {
            error.alertMessage();
        });

    })

</script>
<script>
    let cmtDelete = (cmtIdx, cmtGrp, cmtLvl) => {

        if (confirm('정말 삭제하시겠습니까?')) {

            let brdIdx = document.querySelector("#brdIdx").value;

            const url = '/cmtdelete';
            let paramObj = new Object();
            paramObj.cmtIdx = cmtIdx;
            paramObj.cmtGrp = cmtGrp;
            paramObj.cmtLvl = cmtLvl;


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
                    alert("댓글 삭제가 완료되었습니다.")
                    location.href = "/detail?brdIdx=" + brdIdx;
                } else {
                }
            }).catch(error => {
                error.alertMessage();
            });
        }

    }
</script>

<script>
    let RcmtWriter = (cmtIdx) => {
        document.querySelector('#RcmtWriterBox' + cmtIdx).style.display = "block";
    }


</script>
<script>
    let cmtModify = (cmtIdx) => {
        document.querySelector('#cmtBox' + cmtIdx).style.display = "none";
        document.querySelector('#cmtModifyBox' + cmtIdx).style.display = "block";
    }
</script>


<script>
    let cmtWriterModify = (cmtIdx) => {

        let brdIdx = document.querySelector("#brdIdx").value;
        let cmtContent = document.querySelector("#cmtContentModify").value;
        const url = '/cmtmodify';
        let paramObj = new Object();
        paramObj.cmtIdx = cmtIdx;
        paramObj.cmtContent = cmtContent;

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
                alert("댓글 수정이 완료되었습니다.")
                location.href = "/detail?brdIdx=" + brdIdx;
            } else {
            }
        }).catch(error => {
            error.alertMessage();
        });
    }
</script>
<script>
    let RcmtUpload = (cmtIdx) => {

        let brdIdx = document.querySelector("#brdIdx").value;
        let cmtContent = document.querySelector("#RcmtContent").value;
        let cmtGrp = document.querySelector("#RcmtGrp").value;
        let cmtSeq = document.querySelector("#RcmtSeq").value;
        let cmtLvl = document.querySelector("#RcmtLvl").value;

        const url = '/rcmtupload';

        let paramObj = new Object();
        paramObj.cmtIdx = cmtIdx;
        paramObj.brdIdx = brdIdx;
        paramObj.cmtContent = cmtContent;
        paramObj.cmtGrp = cmtGrp;
        paramObj.cmtSeq = cmtSeq;
        paramObj.cmtLvl = cmtLvl;

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
                location.href = "/detail?brdIdx=" + brdIdx;
            } else {
            }
        }).catch(error => {
            error.alertMessage();
        });
    }
</script>
</body>
</html>
