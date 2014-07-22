<!DOCTYPE html>
<html lang="${language}">

    <head>        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Kontaktinformationen">
        <meta name="author" content="Malte Dammann">
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

    <body style="padding-top: 60px;">

        <div class="container">
            
            <div class="row">

                <div class="col-lg-12">
                    <h1 class="page-header">Impressum <small>Terms of use</small></h1>
                    <ol class="breadcrumb">
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li class="disabled"><a href="#">Other Pages</a></li>
                        <li class="active">Impressum</li>
                    </ol>
                </div>

            </div><!--./row -->

            <div class="well col-sm-12">
                <h3>Betreiber dieser Webseite</h3>
                <p><b>B1TB0YS</b><br>Hamburg<br>Germany</p>
                <p>E-Mail: <a href="mailto:dede@kms.de">leago@bitboys.de</a></p>
                <hr>

                <h3>Nutzungsbedingungen</h3>
                <p>dede de de d  ed ed ede d ededede d ed ed e de d eded<br>Euer Leago Team</p>
                <hr>

                <h3>Datenschutzhinweis</h3>
                <p>Von Ihnen per Kontaktformular gesendete Daten werden bei uns im Hause nur f�r Kontaktzwecke eingesetzt (z.B. um Ihre Anfrage zu bearbeiten). Ihre Daten werden nicht an andere Unternehmen weitergegeben. Wenn Sie w�nschen l�schen wir Ihre Daten unverz�glich aus unserem System, senden Sie uns dazu bitte eine e-Mail</p>
                <hr>

                <h3>Disclaimer</h3>
                <p>Unsere Webseiten sind urheberrechtlich gesch�tzt. Jede Verwertung zu kommerziellen oder politischen Zwecken, sei es ganz oder teilweise, auch in ver�nderter Form bedarf der vorherigen Zustimmung. Zul�ssig ist der Ausdruck, die Kopie oder das Herunterladen von Dateien zu Informationszwecken sowie zum Zwecke der privaten Nutzung. Die in unseren Webseiten enthaltenen Links k�nnen dazu f�hren, dass Sie auf die Webseiten Dritter gelangen. Wir weisen darauf hin, dass wir auf diese Webseiten keinen Einfluss haben, und daher auch nicht f�r deren Inhalt verantwortlich sind. Die Existenz von Links zu Webseiten Dritter stellt keine Empfehlung f�r diese Seiten, die sie betreibenden Unternehmen oder deren Produkte und Leistungen dar. Unsere Webseiten haben wir sehr sorgf�ltig zusammengestellt. F�r die Richtigkeit und Vollst�ndigkeit der Angaben k�nnen wir dennoch keine Haftung �bernehmen. Die Inhalte k�nnen �berdies ohne vorherige Ank�ndigung aktualisiert, erweitert, gek�rzt oder anderweitig angepasst oder ge�ndert werden.</p>
                <hr>

                <h3>Datenschutzerkl�rung</h3>
                <p>Diese Website benutzt Google Analytics, einen Webanalysedienst der Google Inc. (?Google?). Google Analytics verwendet sog. ?Cookies?, Textdateien, die auf Ihrem Computer gespeichert werden und die eine Analyse der Benutzung der Website durch Sie erm�glichen. Die durch den Cookie erzeugten Informationen �ber Ihre Benutzung dieser Website werden in der Regel an einen Server von Google in den USA �bertragen und dort gespeichert. Im Falle der Aktivierung der IP-Anonymisierung auf dieser Webseite, wird Ihre IP-Adresse von Google jedoch innerhalb von Mitgliedstaaten der Europ�ischen Union oder in anderen Vertragsstaaten des Abkommens �ber den Europ�ischen Wirtschaftsraum zuvor gek�rzt. Nur in Ausnahmef�llen wird die volle IP-Adresse an einen Server von Google in den USA �bertragen und dort gek�rzt. Im Auftrag des Betreibers dieser Website wird Google diese Informationen benutzen, um Ihre Nutzung der Website auszuwerten, um Reports �ber die Websiteaktivit�ten zusammenzustellen und um weitere mit der Websitenutzung und der Internetnutzung verbundene Dienstleistungen gegen�ber dem Websitebetreiber zu erbringen. Die im Rahmen von Google Analytics von Ihrem Browser �bermittelte IP-Adresse wird nicht mit anderen Daten von Google zusammengef�hrt. Sie k�nnen die Speicherung der Cookies durch eine entsprechende Einstellung Ihrer Browser-Software verhindern; wir weisen Sie jedoch darauf hin, dass Sie in diesem Fall gegebenenfalls nicht s�mtliche Funktionen dieser Website vollumf�nglich werden nutzen k�nnen. Sie k�nnen dar�ber hinaus die Erfassung der durch das Cookie erzeugten und auf Ihre Nutzung der Website bezogenen Daten (inkl. Ihrer IP-Adresse) an Google sowie die Verarbeitung dieser Daten durch Google verhindern, indem sie das unter dem folgenden Link verf�gbare Browser-Plugin herunterladen und installieren: http://tools.google.com/dlpage/gaoptout</p>
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