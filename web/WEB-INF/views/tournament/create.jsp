<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">

    <div class="col-lg-12">
        <h1 class="page-header">Turnier erstellen <small>Erstelle Turniere und lade Teams ein!</small></h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li class="active">${pageContext.request.contextPath}/create/tournament</li>
        </ol>
    </div>

    <div class="col-md-8">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-sitemap"></i> Name &auml;ndern</div>
            <div class="panel-body">

                <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/creat/tournament" method="post">

                    <div class="form-group">
                        <label class="control-label">Turnier*</label>
                        <input type="text" class="form-control" name="tournament_name_create" required autofocus>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Runden</label>
                        <input type="number" min="1" class="form-control" name="tournament_matchdays_create">
                    </div>

                    <div class="form-group">
                        <label class="control-label">Location</label>
                        <input type="text" class="form-control" name="tournament_venue_create">
                    </div>

                    <div class="form-group">
                        <label class="control-label">Passwort</label>
                        <input type="password" class="form-control" name="tournament_password_create" placeholder="Passwort">
                    </div>

                    <div class="form-group">
                        <label class="control-label">Passwort</label>
                        <input type="password" class="form-control" name="tournament_password_reenter_create">
                    </div>

                    <div class="form-group">
                        <label class="control-label">Startdatum</label>
                        <input type="date" name="tournament_start_date_create">
                        <label class="control-label">Startzeit</label>
                        <input type="time" name ="tournament_start_time_create">
                    </div>

                    <div class="form-group">
                        <label class="control-label">Enddatum</label>
                        <input type="date" name="tournament_end_date_create">
                        <label class="control-label">Endzeit</label>
                        <input type="time" name ="tournament_end_time_create">
                    </div>

                    <div class="form-group">
                        <label class="control-label">Anmeldefrist</label>
                        <input type="date"  name="tournament_term_create">
                    </div>

                    <div class="form-group">
                        <label class="control-label">Beschreibung</label>
                        <textarea style="width:100%" name="tournament_description_create" maxlength="255" placeholder="Beschreibe dein Turnier mit maximal 255 Zeichen..." rows="5"></textarea>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Teams</label>
                            <input list="teamAuswahl" name="teamList" autocomplete="off" class="form-control" >
                            <datalist id="teamAuswahl">
                                <c:forEach items="${tournament.teams}" var="team">
                                    <option value="${team.name}"> 
                                    </c:forEach>
                            </datalist>
                            <a href="#">Team hinzuf&uuml;gen</a>
                    </div>
                    <div class="form-group">
                        <small>*Nur der Turniername ist Pflicht. Alles andere kannst du auf dem Turnierdashboard bearbeiten.</small>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-leago" type="submit"><span class="fa fa-pencil"> Erstellen <i class="fa fa-angle-right"></i></button>
                    </div>
                </form>
            </div><!-- /.panel-body -->
        </div><!-- /.panel -->
    </div><!-- /.col -->

</div><!-- /.row -->