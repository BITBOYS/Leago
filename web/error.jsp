<!DOCTYPE html>
<html lang="${language}">

    <head>        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
        <title>Leago</title>

        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
        <!-- Custom Google Web Font -->
        <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
        <!-- Add custom CSS here -->
        <link href="${pageContext.request.contextPath}/resources/css/landing-page.css" rel="stylesheet">
    </head>

    <header>
        <%@include file="WEB-INF/snipplets/navigation.jspf" %>
    </header>

    <body style="padding-top: 60px;">
        <div class="container">
            <div class="row">

                <div class="col-md-12">
                    <h1 class="page-header">Error <small>${pageContext.exception}</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="../">Home</a></li>
                        <li class="disabled"><a href="#">Other Pages</a></li>
                        <li class="active">${pageContext.errorData.statusCode}</li>
                    </ol>
                </div>

            </div>

            <div class="row">

                <div class="col-lg-12">
                    <p class="error-404">MHMM! - ${pageContext.errorData.statusCode}</p>

                    <c:choose>
                        <c:when test="${message == null}">
                            <p class="lead">Es ist ein Fehler aufgetreten.</p>
                        </c:when>
                        <c:when test="${message != null}">
                            <p class="lead">${message.message}</p>
                        </c:when>
                    </c:choose>

                    <p>Das tut uns leid! Hast du das hier gesucht:</p>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                        <li><a href="${pageContext.request.contextPath}/register">Sign Up</a></li>
                        <li><a href="${pageContext.request.contextPath}/about.jsp">About Us</a></li>
                        <li><a href="${pageContext.request.contextPath}/terms.jsp">Terms of use</a></li>
                        <li><a href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>
                        <li><a href="${pageContext.request.contextPath}/faq.jsp">FAQ</a></li>
                    </ul>
                </div>

            </div>

        </div>
        <!-- /.banner -->

        <footer>
            <%@include file="WEB-INF/snipplets/footer.jspf" %>
        </footer>

        <!-- JavaScript -->
        <script src="resources/js/jquery-1.10.2.js"></script>
        <script src="resources/js/bootstrap.js"></script>

    </body>

</html>
