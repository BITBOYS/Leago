<!DOCTYPE html>
<html lang="${language}">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="HandheldFriendly" content="true" />
        
        <title>Leago</title>
        
        <!-- favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/leago3.ico">
               
        <!-- CSS -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/animate.css"  rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/landing-page.css" rel="stylesheet">

        <!-- Custom Google Web Font -->
        <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
        
        <!-- JS -->
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
                <section class="wow bounceInUp" data-wow-delay="1s"> 
                    <a href="#about" class="btn-lg btn-default"><fmt:message key="index.button.start"/></a>
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
                        <h2><fmt:message key="index.h2.info"/></h2>
                        <p style="font-size: 20px;"><fmt:message key="index.p.info"/></p>
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
                                        <strong style="font-size: 26px">${amount_tournaments}</strong> <br> <fmt:message key="index.text.tournament"/>
                                    </h4>
                                    <a class="btn btn-leago-index" href="${pageContext.request.contextPath}/new/tournament"><fmt:message key="index.link.tournament"/></a>
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
                                        <strong style="font-size: 26px">${amount_teams}</strong> <br> <fmt:message key="index.text.team"/>
                                    </h4>
                                    <a class="btn btn-leago-index" href="${pageContext.request.contextPath}/new/team"><fmt:message key="index.link.team"/></a>
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
                                        <strong style="font-size: 26px">${amount_user}</strong> <br> <fmt:message key="index.text.user"/>
                                    </h4>
                                    <a class="btn btn-leago-index" href="${pageContext.request.contextPath}/register"><fmt:message key="index.link.user"/></a>
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

        <script>
            $(function() {
                $('a[href*=#]:not([href=#])').click(function() {
                    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                        var target = $(this.hash);
                        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                        if (target.length) {
                            $('html,body').animate({
                                scrollTop: target.offset().top
                            }, 1000);
                            return false;
                        }
                    }
                });
            });
        </script>

    </body>

</html>
