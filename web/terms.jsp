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
                <p>Von Ihnen per Kontaktformular gesendete Daten werden bei uns im Hause nur für Kontaktzwecke eingesetzt (z.B. um Ihre Anfrage zu bearbeiten). Ihre Daten werden nicht an andere Unternehmen weitergegeben. Wenn Sie wünschen löschen wir Ihre Daten unverzüglich aus unserem System, senden Sie uns dazu bitte eine e-Mail</p>
                <hr>

                <h3>Disclaimer</h3>
                <p>Unsere Webseiten sind urheberrechtlich geschützt. Jede Verwertung zu kommerziellen oder politischen Zwecken, sei es ganz oder teilweise, auch in veränderter Form bedarf der vorherigen Zustimmung. Zulässig ist der Ausdruck, die Kopie oder das Herunterladen von Dateien zu Informationszwecken sowie zum Zwecke der privaten Nutzung. Die in unseren Webseiten enthaltenen Links können dazu führen, dass Sie auf die Webseiten Dritter gelangen. Wir weisen darauf hin, dass wir auf diese Webseiten keinen Einfluss haben, und daher auch nicht für deren Inhalt verantwortlich sind. Die Existenz von Links zu Webseiten Dritter stellt keine Empfehlung für diese Seiten, die sie betreibenden Unternehmen oder deren Produkte und Leistungen dar. Unsere Webseiten haben wir sehr sorgfältig zusammengestellt. Für die Richtigkeit und Vollständigkeit der Angaben können wir dennoch keine Haftung übernehmen. Die Inhalte können überdies ohne vorherige Ankündigung aktualisiert, erweitert, gekürzt oder anderweitig angepasst oder geändert werden.</p>
                <hr>

                <h3>Datenschutzerklärung</h3>
                <p>Diese Website benutzt Google Analytics, einen Webanalysedienst der Google Inc. (?Google?). Google Analytics verwendet sog. ?Cookies?, Textdateien, die auf Ihrem Computer gespeichert werden und die eine Analyse der Benutzung der Website durch Sie ermöglichen. Die durch den Cookie erzeugten Informationen über Ihre Benutzung dieser Website werden in der Regel an einen Server von Google in den USA übertragen und dort gespeichert. Im Falle der Aktivierung der IP-Anonymisierung auf dieser Webseite, wird Ihre IP-Adresse von Google jedoch innerhalb von Mitgliedstaaten der Europäischen Union oder in anderen Vertragsstaaten des Abkommens über den Europäischen Wirtschaftsraum zuvor gekürzt. Nur in Ausnahmefällen wird die volle IP-Adresse an einen Server von Google in den USA übertragen und dort gekürzt. Im Auftrag des Betreibers dieser Website wird Google diese Informationen benutzen, um Ihre Nutzung der Website auszuwerten, um Reports über die Websiteaktivitäten zusammenzustellen und um weitere mit der Websitenutzung und der Internetnutzung verbundene Dienstleistungen gegenüber dem Websitebetreiber zu erbringen. Die im Rahmen von Google Analytics von Ihrem Browser übermittelte IP-Adresse wird nicht mit anderen Daten von Google zusammengeführt. Sie können die Speicherung der Cookies durch eine entsprechende Einstellung Ihrer Browser-Software verhindern; wir weisen Sie jedoch darauf hin, dass Sie in diesem Fall gegebenenfalls nicht sämtliche Funktionen dieser Website vollumfänglich werden nutzen können. Sie können darüber hinaus die Erfassung der durch das Cookie erzeugten und auf Ihre Nutzung der Website bezogenen Daten (inkl. Ihrer IP-Adresse) an Google sowie die Verarbeitung dieser Daten durch Google verhindern, indem sie das unter dem folgenden Link verfügbare Browser-Plugin herunterladen und installieren: http://tools.google.com/dlpage/gaoptout</p>
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