<!DOCTYPE html>
<html lang="en">

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
        <link href="${pageContext.request.contextPath}/resources/css/stylish-portfolio.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">

        <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>

    </head>

    <header>
        <%@include file="WEB-INF/snipplets/navigation.jspf" %>
    </header>

    <body>

        <!-- Header -->
        <header id="top" class="header">
            <div class="text-vertical-center">
                <h1>Leago</h1>
                <h3><fmt:message key="index.h3.info"/></h3>
                <br>
                <section class="wow swing" data-wow-delay="1s"> 
                    <a href="#about" class="btn btn-default">Find Out More</a>
                </section>
            </div>
        </header>


        <!-- About -->
        <section id="about" class="about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center links effect-1">
                        <h2>Stylish Portfolio is the perfect theme for your next project!</h2>
                        <p class="lead">This theme features some wonderful photography courtesy of <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a>.</p>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </section>

        <!-- Services -->
        <section id="services" class="services bg-primary">
            <div class="container">
                <div class="row text-center">
                    <div class="col-lg-10 col-lg-offset-1">
                        <h2>Our Stats</h2>
                        <hr class="small">
                        <div class="row">
                            <div class="col-md-4 col-sm-6">
                                <div class="service-item">
                                    <section class="wow zoomIn" data-wow-offset="100"> 
                                        <span class="fa-stack fa-4x">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa fa-trophy fa-stack-1x text-default"></i>
                                        </span>
                                    </section>
                                    <h4>
                                        <strong>Tournaments</strong>
                                    </h4>
                                    <p>X Tournaments created.</p>
                                    <a class="btn btn-leago" href="${pageContext.request.contextPath}/new/tournament">Create Tournament</a>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="service-item">
                                    <section class="wow zoomIn" data-wow-offset="100"> 
                                        <span class="fa-stack fa-4x">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa fa-users fa-stack-1x text-default"></i>
                                        </span>
                                    </section>
                                    <h4>
                                        <strong>Teams</strong>
                                    </h4>
                                    <p>X Teams created.</p>
                                    <a class="btn btn-leago" href="${pageContext.request.contextPath}/new/team">Create Team</a>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="service-item">
                                    <section class="wow zoomIn" data-wow-offset="100"> 
                                        <span class="fa-stack fa-4x">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa fa-user fa-stack-1x text-default"></i>
                                        </span>
                                    </section>
                                    <h4>
                                        <strong>Player</strong>
                                    </h4>
                                    <p>X active User.</p>
                                    <a class="btn btn-leago" href="${pageContext.request.contextPath}/register">Create User</a>
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

        <!-- Callout -->
        <aside class="callout">
            <div class="text-vertical-center">
                <h1>Vertically Centered Text</h1>
            </div>
        </aside>

        <footer>
            <%@include file="WEB-INF/snipplets/footer.jspf" %>
        </footer>

        <!-- JavaScript -->
        <script src="resources/js/jquery-1.10.2.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script src="resources/js/offline.js"></script>

    </body>

</html>
