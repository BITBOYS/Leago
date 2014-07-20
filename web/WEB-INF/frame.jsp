<!DOCTYPE html>
<html>
    <%@include file="snipplets/head.jspf" %>
    
    <header>
        <%@include file="snipplets/navigation.jspf" %>
    </header>
    
    <body style="padding-top: 60px;">
        <div class="container">
            <%@include file="snipplets/error.jspf" %>
            <div style="margin-top: -30px;">
            <jsp:include page="views/${page}.jsp" flush="true">
                <jsp:param name="user" value="${user}"/>
            </jsp:include>
            <div>
        </div>
    </body>
    
    <!-- JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
</html> 