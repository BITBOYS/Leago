<!DOCTYPE html>
<html lang="${language}">

    <head>        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
        <title>Leago - About Page</title>

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
            <div class="col-lg-12">
                <h1 class="page-header">About Us <small>Das sind wir!</small></h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}">Home</a></li>
                    <li class="active">About Us</li>
                </ol>
            </div>


            <div class="row">

                <div class="col-md-6">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/team.jpg">
                </div>
                <div class="col-md-6">
                    <h2>Welcome to Leago</h2>
                    <p>Wir sind ein junges Developer Team aus Hamburg und haben unglaublich viel Spa&szlig; am Kickern. Deshalb haben wir erkannt, dass die Welt ein Kicker-Tool braucht.</p>
                    <p>Und genau hier kommt Leago ins Spiel. Aus einer scherzhaften Idee wurde ein Konzept. Leago ist in unserer Freizeit entstanden und dient keinen kommerziellen Zwecken. Wer uns trotzdem etwas Gutes tun möchte, kann uns gerne mal einen Kaffee ausgeben.</p>
                </div>

            </div>

            <!-- Team Member Profiles -->

            <div class="row">

                <div class="col-sm-12">
                    <h2 class="page-header">Das Team</h2>
                </div>

                <div class="col-sm-4">
                    <img class="img-circle img-responsive" src="${pageContext.request.contextPath}/resources/img/maik.png" width="200px" height="200px">
                    <h3>Maik Schmaddebeck <small>Backend Developer und System Designer</small></h3>
                    <p>Maik mag Kappies.</p>
                    <ul class="list-unstyled list-inline list-social-icons">
                        <li class="tooltip-social"><a href="#xing-profile" data-toggle="tooltip" target="blank" data-placement="bottom" title="Xing"><i class="fa fa-xing fa-2x"></i></a></li>
                        <li class="tooltip-social linkedin-link"><a href="#linkedin-profile" target="blank" data-toggle="tooltip" data-placement="bottom" title="LinkedIn"><i class="fa fa-linkedin-square fa-2x"></i></a></li>
                        <li class="tooltip-social facebook-link"><a href="#facebook-profile" target="blank" data-toggle="tooltip" data-placement="bottom" title="Facebook"><i class="fa fa-facebook-square fa-2x"></i></a></li>
                        <li class="tooltip-social google-plus-link"><a href="#google-plus-profile" target="blank" data-toggle="tooltip" data-placement="bottom" title="Google+"><i class="fa fa-google-plus-square fa-2x"></i></a></li>
                    </ul>
                </div>

                <div class="col-sm-4">
                    <img class="img-circle img-responsive" src="${pageContext.request.contextPath}/resources/img/malte.png" width="200px" height="200px">
                    <h3>Malte Dammann <small>Web/Backend Developer</small></h3>
                    <p>Malte mag Haxe.</p>
                    <ul class="list-unstyled list-inline list-social-icons">
                        <li class="tooltip-social"><a href="https://www.xing.com/profiles/Malte_Dammann2" target="_blank" data-toggle="tooltip" data-placement="bottom" title="Xing"><i class="fa fa-xing fa-2x"></i></a></li>
                        <li class="tooltip-social linkedin-link"><a href="https://de.linkedin.com/in/mdammann" target="_blank" data-toggle="tooltip" data-placement="bottom" title="LinkedIn"><i class="fa fa-linkedin-square fa-2x"></i></a></li>
                        <li class="tooltip-social facebook-link"><a href="https://www.facebook.com/malte.da.3" target="_blank" data-toggle="tooltip" data-placement="bottom" title="Facebook"><i class="fa fa-facebook-square fa-2x"></i></a></li>
                        <li class="tooltip-social google-plus-link"><a href="https://google.com/+MalteDa" target="_blank" data-toggle="tooltip" data-placement="bottom" title="Google+"><i class="fa fa-google-plus-square fa-2x"></i></a></li>
                    </ul>
                </div>

                <div class="col-xs-3"></div>                
                <div class="col-sm-4 col-xs-10">
                    <img class="img-circle img-responsive" src="${pageContext.request.contextPath}/resources/img/alex.png" width="200px" height="200px">
                    <h3>Alexander Spottka <small>Backend Devoloper</small></h3>
                    <p>Alex mag Dota.</p>
                    <ul class="list-unstyled list-inline list-social-icons">
                        <li class="tooltip-social"><a href="#xing-profile" target="blank" data-toggle="tooltip" data-placement="bottom" title="Xing"><i class="fa fa-xing fa-2x"></i></a></li>
                        <li class="tooltip-social linkedin-link"><a href="#linkedin-profile" target="blank" data-toggle="tooltip" data-placement="bottom" title="LinkedIn"><i class="fa fa-linkedin-square fa-2x"></i></a></li>
                        <li class="tooltip-social facebook-link"><a href="#facebook-profile" target="blank" data-toggle="tooltip" data-placement="bottom" title="Facebook"><i class="fa fa-facebook-square fa-2x"></i></a></li>
                        <li class="tooltip-social google-plus-link"><a href="#google-plus-profile" target="blank" data-toggle="tooltip" data-placement="bottom" title="Google+"><i class="fa fa-google-plus-square fa-2x"></i></a></li>
                    </ul>
                </div>

            </div><!-- /.row -->
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