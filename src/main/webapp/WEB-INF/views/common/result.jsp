<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    let context = "${context}";
    <c:if test="${!empty alertMsg}">
    alert("${alertMsg}");
    </c:if>

    <%-- 뒤로가기는 history.back --%>
    <c:if test="${!empty back}">
    history.back();
    </c:if>

    <c:if test="${!empty url}">
    location.href = context + '${url}';
    </c:if>

</script>
</body>
</html>
