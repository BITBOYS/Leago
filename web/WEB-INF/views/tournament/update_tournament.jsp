<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row" style="padding-top: 50px;">
     <div class="col-md-12">
        <h1 class="page-header">Turnier Settings <small>Einstellungnen zu ${profileuser.name}</small></h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li><a href="#">Tournaments</a></li>
            <li><a href="${pageContext.request.contextPath}/tournament/${tournament.name}">${tournament.name}</a></li>
            <li class="active">Settings</li>
        </ol>
    </div>


    <div class="col-md-4">
        <div class="list-group">
            <a href="#" class="list-group-item active">
                <h4><span class="fa fa-sitemap"></span> Tournament settings</h4>
                <p class="list-group-item-text">Change the Tournament values</p>
            </a>
            <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/team" class="list-group-item">
                <h4><span class="fa fa-users"></span> Teams settings</h4> 
                <p class="list-group-item-text">Kick od add individual Teams</p>
            </a>
            <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/danger" class="list-group-item"> 
                <h4 class="list-group-item-heading"><span class="fa fa-exclamation-triangle"></span> Danger zone</h4> 
                <p class="list-group-item-text">Delete the tournament ${tournament.name}</p>
            </a>
        </div>
    </div>


    <div class="col-md-8">
        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-sitemap"></i> Name &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="name_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/name" method="POST">

                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="input_name_new1" placeholder="'${tournament.name}'" required>
                        </div>

                        <div class="form-group">
                            <label>Name wiederholen</label>
                            <input type="text" class="form-control" name="input_name_new2" required>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Name aktualisieren</button>
                        </div>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel --> 
    </div> <!-- /.col --> 


    <div class="col-md-8 col-md-offset-4">

        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-lock"></i> Passwort &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="password_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/password" method="POST">

                        <div class="form-group">
                            <label>Altes Passwort</label>
                            <input type="password" class="form-control" name="input_password_old" required>
                        </div>

                        <div class="form-group">
                            <label>Neues Passwort</label>    
                            <input type="password" class="form-control" name="input_password_new1" required>
                        </div>

                        <div class="form-group">
                            <label>Neues Passwort wiederholen</label>
                            <input type="password" class="form-control" name="input_password_new2" required>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Passwort aktualisieren</button>
                        </div>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.grid 8 --> 


    <div class="col-md-8 col-md-offset-4">

        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-user"></i> Leader &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="leader_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/leader" method="POST">

                        <div class="form-group">
                            <label class="control-label">Dein User Passwort</label>
                            <input type="password" class="form-control" name="account_password" required>
                        </div>

                        <div class="form-group">
                            <label class="control-label">Neuer Leader</label>
                            <input list="leaderAuswahl" name="input_leader_new" class="form-control" autocomplete="off" required>
                            <datalist id="userAuswahl">
                                <c:forEach items="${tournament.teams}" var="team">
                                    <option value="${team.leader.name}"> 
                                    </c:forEach>
                            </datalist>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Leader aktualisieren</button>
                        </div>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.col --> 


    <div class="col-md-8 col-md-offset-4">

        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-code"></i> Beschreibung &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="description_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/description" method="POST">

                        <div class="form-group">
                            <label>Beschreibung</label>
                            <textarea style="max-width: 150%; resize: vertical"  rows="10" class="form-control" name="input_description_new" placeholder="'${tournament.description}'" maxlength="255" required></textarea>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Beschreibung aktualisieren</button>
                        </div>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.grid 8 --> 


    <div class="col-md-8 col-md-offset-4">

        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-globe"></i> Austragungsort &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="password_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/venue" method="POST">

                        <div class="form-group">
                            <label>Ort</label>
                            <input type="text" class="form-control" name="input_venue_new" placeholder="'${tournament.venue}'" required>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Austragunsort aktualisieren</button>
                        </div>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.col --> 


    <div class="col-md-8 col-md-offset-4">

        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-tags"></i> Spieltage &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="password_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/rounds" method="POST">

                        <div class="form-group">
                            <label>Spielrunden</label>
                            <input type="number" min="1" class="form-control" name="input_rounds_new" placeholder="${tournament.rounds} Runden" required>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Spieltage aktualisieren</button>
                        </div>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.col --> 


    <div class="col-md-8 col-md-offset-4">

        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-clock-o"></i> Zeiten &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="start_date_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/startdate" method="POST">
                        <div class="form-group">
                            <label>Startdatum</label>
                            <p class="text-muted">(alt: "${tournament.start_date})"</p>
                            <input type="date" class="form-control" name="input_startdate_new" required>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Datum aktualisieren</button>
                        </div>
                    </form>

                    <form role="form" name="start_time_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/starttime" method="POST">
                        <div class="form-group">
                            <label>Start-Uhrzeit</label>
                            <p class="text-muted">(alt: "${tournament.start_time})"</p>
                            <input type="time" class="form-control" name="input_starttime_new" required>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Uhrzeit aktualisieren</button>
                        </div>

                        <form role="form" name="end_date_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/enddate" method="POST">
                            <div class="form-group">
                                <label>Enddatum</label>
                                <p class="text-muted">(alt: "${tournament.end_date})"</p>
                                <input type="date" class="form-control" name="input_enddate_new" required>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary btn-leago" type="submit">Datum aktualisieren</button>
                            </div>
                        </form>

                    <form role="form" name="end_time_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/endtime" method="POST">
                        <div class="form-group">
                            <label>End-Uhrzeit</label>
                            <p class="text-muted">(alt: "${tournament.end_time})"</p>
                            <input type="time" class="form-control" name="input_endtime_new" required>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Uhrzeit aktualisieren</button>
                        </div>
                    </form>

                </div> <!-- /.col --> 
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.col --> 

</div><!-- /.row -->
