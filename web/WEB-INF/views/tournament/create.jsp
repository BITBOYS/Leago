<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row" style="margin-top: 30px;">
    
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-sitemap"></i> Neues Turnier</div>
            <div class="panel-body">
                <div class="col-xs-12">
                    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/new/tournament/create" method="post">

                        <div class="form-group">
                            <label class="control-label">Turniername *</label>
                            <input type="text" class="form-control" name="tournament_name" required autofocus value="${name}">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Anzahl Runden<small> In jeder Runde spielen alle Teams einmal gegeneinander</small></label>
                            <input type="number" min="1" class="form-control" name="tournament_rounds" value="${rounds}">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Location</label>
                            <input type="text" class="form-control" name="tournament_venue" value="${venue}">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Startdatum</label>
                            <input type="datetime-local" class="form-control" name="tournament_startdate" value="${startdate}">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Enddatum</label>
                            <input type="datetime-local" class="form-control" name="tournament_enddate" value="${enddate}">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Anmeldefrist</label>
                            <input type="datetime-local" class="form-control" name="tournament_deadline" value="${deadline}">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Beschreibung</label>
                            <textarea class="form-control" style="max-width: 100%; resize: vertical" name="tournament_description" maxlength="255" placeholder="Beschreibe dein Turnier mit maximal 255 Zeichen..." rows="5"></textarea>
                        </div>

<!--                        <div class="form-group">
                            <label class="control-label">Teams hinzuf&uuml;gen</label>
                            <input list="teamAuswahl" name="teamList" autocomplete="off" class="form-control" >
                            <datalist id="teamAuswahl">
                                <c:forEach items="${all_teams}" var="team">
                                    <option value="${team.name}"> 
                                    </c:forEach>
                            </datalist>
                        </div>
                        <div class="form-group">
                            <a href="#"><i class="pull-right fa fa-plus-square fa-2x"></i></a>
                        </div>-->
                        <div class="form-group ">
                            <small>*Nur der Turniername ist Pflicht. Alles andere kanns auf dem Turnierdashboard bearbeitet werden.</small>
                        </div>
                        <br>
                        <div class="form-group">
                            <button class="btn btn-primary btn-leago pull-right" type="submit"><span class="fa fa-pencil"></span> Erstellen</button>
                        </div>
                    </form>
                </div>
            </div><!-- /.panel-body -->
        </div><!-- /.panel -->
    </div><!-- /.col -->

</div><!-- /.row -->
