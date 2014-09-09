<!DOCTYPE html>
<html lang="${language}">

    <head>        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="HandheldFriendly" content="true" />

        <title>Leago - Terms of Use</title>

        <!-- favicon -->
        <link href="${pageContext.request.contextPath}/resources/img/leago3.ico"  rel="shortcut icon"> 

        <!-- CSS -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/landing-page.css" rel="stylesheet">

        <!-- Custom Google Web Font -->
        <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
    </head>

    <header>
        <%@include file="WEB-INF/snipplets/navigation.jspf" %>
    </header>

    <body style="padding-top: 50px;">

        <div class="container">

            <div class="row">

                <div class="col-lg-12">
                    <h1 class="page-header"><fmt:message key="imprint.head"/></h1>
                </div>

            </div><!--./row -->

            <div class="col-md-12">
                <h3><fmt:message key="imprint.operator"/></h3>
                <p><b>BITB0YS UG - Maik Schmaddebeck, Malte Dammann</b><br>22305 Hamburg<br>Germany</p>
                <p>E-Mail: <a href="mailto:leago@bitboys.de">leago@bitboys.de</a></p>
                <hr>

                <h3><fmt:message key="imprint.terms.head"/></h3>
                <p><fmt:message key="imprint.terms"/></p>
                <hr>

                <h3><fmt:message key="imprint.privacy.head"/></h3>
                <p><fmt:message key="imprint.privacy"/></p>
                <hr>

                <h3><fmt:message key="imprint.disclaimer.head"/></h3>
                <p><fmt:message key="imprint.disclaimer"/></p>
                <hr>
                <h4><fmt:message key="imprint.footer"/></h4>
            </div><!-- /.row -->
        </div>

        <footer>
            <%@include file="WEB-INF/snipplets/footer.jspf" %>
        </footer>

        <!-- JavaScript -->
        <script src="resources/js/jquery-1.10.2.js"></script>
        <script src="resources/js/bootstrap.js"></script>

    </body>

</html>