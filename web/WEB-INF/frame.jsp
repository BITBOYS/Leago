<!DOCTYPE html>
<html>
    <%@include file="snipplets/head.jspf" %>

        <body>
            <div class="wrapper">
                <header>
                    <%@include file="snipplets/navigation.jspf" %>
                </header>

                <div class="body">
                    <div class="container">
                        <%@include file="snipplets/error.jspf" %>
                        <jsp:include page="views/${page}.jsp" flush="true">
                            <jsp:param name="user" value="${user}"/>
                        </jsp:include>
                    </div>
                </div>

                <footer>
                    <%@include file="snipplets/footer.jspf" %>
                </footer>
            </div>
        </body>
    
    <!-- JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
</html> 