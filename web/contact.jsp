<!DOCTYPE html>
<html lang="${language}">

    <head>        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Kontaktinformationen">
        <meta name="author" content="Malte Dammann">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="HandheldFriendly" content="true" />
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
        <title>Leago - Contact</title>

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

    <body style="padding-top: 50px;">
        <div class="container">

            <div class="row">

                <div class="col-lg-12">
                    <h1 class="page-header">Contact <small>We'd Love to Hear From You!</small></h1>
                </div>

                <div class="col-lg-12">
                    <!-- Embedded Google Map using an iframe - to select your location find it on Google maps and paste the link as the iframe src. If you want to use the Google Maps API instead then have at it! -->
                    <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.de/maps?hl=de&q=hamburg+(Hamburg City Bitch)&ie=UTF8&t=&z=12&iwloc=B&output=embed"></iframe>
                </div>

            </div><!-- /.row -->
            <hr>
            <div class="row">

                <div class="col-sm-8">
                    <h3>Let's Get In Touch!</h3>
                    <p>Wenn du Fragen zum Tool oder uns hast, einfach mal 'Hallo' sagen willst oder dir was auf dem Herzen liegt, schreib uns! Das kannst du einfach über das Formaular machen. Wir w&uuml;rden uns sehr &uuml;ber Anregungen oder W&uuml;nsche freuen! Nat&uuml;rlich trefft ihr uns auch auf Facebook und Konsorten. Aber nicht auf Twiddrr! </p>
                    <p>Euer Leago-Team <strong> Malte, Maik und Alex</strong></p>
                    <form role="form" name="contact_form" method="POST" action="#">
                        <div class="row">
                            <div class="form-group col-lg-4">
                                <label for="input1">Name</label>
                                <input type="text" name="contact_name" class="form-control" id="input1" required>
                            </div>
                            <div class="form-group col-lg-4">
                                <label for="input2">E-mail Adresse</label>
                                <div class="input-group">
                                    <span class="input-group-addon">@</span>
                                    <input type="email" name="contact_email" class="form-control" id="input2" required>
                                </div>
                            </div>
                            <div class="form-group col-lg-4">
                                <label for="input3">Telefonnummer</label>
                                <input type="phone" name="contact_phone" class="form-control" id="input3">
                            </div>
                            <div class="clearfix"></div>
                            <br>
                            <div class="form-group col-lg-12">
                                <label for="input4">Message</label>
                                <textarea style="max-width: 100%; resize: vertical" name="contact_message" class="form-control" rows="6" id="input4" required></textarea>
                            </div>
                            <div class="form-group col-lg-12">
                                <input type="hidden" name="save" value="contact">
                                <button type="submit" class="fa fa-mail btn btn-leago"><i class="fa fa-mail"></i> Senden <i class="fa fa-angle-double-right"></i></button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-sm-4">
                    <h4>B1TB0YS, Inc.</h4>
                    <p>
                        Hamburg City No1<br>
                        Hamburg, D-20097<br>
                    </p>
                    <p><i class="fa fa-phone"></i> <abbr title="Phone">P</abbr>: (555) 984-3600</p>
                    <p><i class="fa fa-envelope-o"></i> <abbr title="Email">E</abbr>: <a href="mailto:maik.schmaddebeck@generali.de">leago@bitboys.com</a></p>
                    <p><i class="fa fa-clock-o"></i> <abbr title="Hours">H</abbr>: Samstag - Sonntag: 10:00 bis 15:00 Uhr</p>
                    <ul class="list-unstyled list-inline list-social-icons">
                        <li class="tooltip-social facebook-link"><a target="_blank" href="#facebook-page" data-toggle="tooltip" data-placement="bottom" title="Facebook"><i class="fa fa-facebook-square fa-2x"></i></a></li>
                        <li class="tooltip-social google-plus-link"><a target="_blank" href="#google-plus-page" data-toggle="tooltip" data-placement="bottom" title="Google+"><i class="fa fa-google-plus-square fa-2x"></i></a></li>
                        <li class="tooltip-social"><a target="_blank" href="https://github.com/BITBOYS" data-toggle="tooltip" data-placement="bottom" title="GitHub"><i class="fa fa-github fa-2x"></i></a></li>
                    </ul>
                </div>

            </div><!-- /.row -->

        </div><!-- /.container -->

            <footer>
                <%@include file="WEB-INF/snipplets/footer.jspf" %>
            </footer>

        <!-- JavaScript -->
        <script src="resources/js/jquery-1.10.2.js"></script>
        <script src="resources/js/bootstrap.js"></script>

    </body>

</html>