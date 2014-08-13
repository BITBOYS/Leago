<!DOCTYPE html>
<html lang="${language}">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="HandheldFriendly" content="true" />
        <title>Leago</title>

        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
        
        <!-- Custom Google Web Font -->
        <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
        <!-- Add custom CSS here -->
        <link href="${pageContext.request.contextPath}/resources/css/landing-page.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">

        <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>

    </head>

    <body>
        <header>
            <%@include file="WEB-INF/snipplets/navigation.jspf" %>
        </header>

        <!-- Header -->
        <div id="top" class="header">
            <div class="text-vertical-center">
                <h1>Leago</h1>
                <h3><fmt:message key="index.h3.info"/></h3>
                <br>
                <section class="wow swing" data-wow-delay="1s"> 
                    <a href="#about" class="btn btn-default">Find Out More</a>
                </section>
            </div>
        </div>


        <!-- About -->
        <section id="about" class="about">
            <div class="container">
                <div class="row">
                        
                        <div class="col-lg-6 text-center col-lg-offset-3"> 
                            <div class="col-md-4 col-sm-6">
                                <div class="service-item">
                                    <section class="wow zoomIn" data-wow-offset="100"> 
                                        <i class="fa fa-mobile fa-5x"></i>
                                    </section>
                                </div>
                            </div>
                            
                            <div class="col-md-4 col-sm-6">
                                <div class="service-item">
                                    <section class="wow zoomIn" data-wow-offset="100"> 
                                        <i class="fa fa-tablet fa-5x"></i>
                                    </section>
                                </div>
                            </div>
                            
                            <div class="col-md-4 col-sm-6">
                                <div class="service-item">
                                    <section class="wow zoomIn" data-wow-offset="100"> 
                                        <i class="fa fa-laptop fa-5x"></i>
                                    </section>
                                </div>
                            </div>
                        </div>
                    
                    <div class="col-lg-10 text-center col-lg-offset-1">    
                        <h2>Leago ist das perfekte Werkzeug für dein n&auml;chstes Turnier!</h2>
                        <p style="font-size: 20px;">Greife von &uuml;berall, egal ob vom Smartphone, deinem Tablet oder dem Computer, auf
                        dein Turnier zu.</p>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </section>

        <!-- Services -->
        <section id="services" class="services bg-primary" style="background-color: #68C999; color: white;">
            <div class="container">
                <div class="row text-center">
                    <div class="col-lg-10 col-lg-offset-1">
                        <div class="row">
                            <div class="col-md-4 col-sm-6">
                                <div class="service-item">
                                    <section class="wow zoomIn" data-wow-offset="100"> 
                                        <span class="fa-stack fa-4x">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa fa-trophy fa-stack-1x leago-color"></i>
                                        </span>
                                    </section>
                                    <h4>
                                        <strong style="font-size: 26px">${amount_tournaments}</strong> <br> erstellte Turniere
                                    </h4>
                                    <a class="btn btn-leago-index" href="${pageContext.request.contextPath}/new/tournament">Lege sofort los!</a>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="service-item">
                                    <section class="wow zoomIn" data-wow-offset="100"> 
                                        <span class="fa-stack fa-4x">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa fa-users fa-stack-1x leago-color"></i>
                                        </span>
                                    </section>
                                    <h4>
                                        <strong style="font-size: 26px">${amount_teams}</strong> <br> gegründete Teams
                                    </h4>
                                    <a class="btn btn-leago-index" href="${pageContext.request.contextPath}/new/team">Gr&uuml;nde Dein eigenes!</a>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="service-item">
                                    <section class="wow zoomIn" data-wow-offset="100"> 
                                        <span class="fa-stack fa-4x">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa fa-user fa-stack-1x leago-color"></i>
                                        </span>
                                    </section>
                                    <h4>
                                        <strong style="font-size: 26px">${amount_user}</strong> <br> aktive Spieler
                                    </h4>
                                    <a class="btn btn-leago-index" href="${pageContext.request.contextPath}/register">Registriere Dich jetzt!</a>
                                </div>
                            </div>
                        </div>
                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.col-lg-10 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </section>

        <footer>
            <%@include file="WEB-INF/snipplets/footer.jspf" %>
        </footer>


        <!-- JavaScript -->
        <script src="resources/js/jquery-1.10.2.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script src="resources/js/offline.js"></script>

       
    </body>

</html>
