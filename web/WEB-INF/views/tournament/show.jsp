<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Turnier Profil <small>Alles &uuml;ber ${tournament.name}</small></h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li class="active">Turnier Profil</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#news" data-toggle="tab">Aktuelles</a></li>
            <li><a href="#table" data-toggle="tab">Tabelle</a></li>
            <li><a href="#user" data-toggle="tab">Spielerstatistiken</a></li>
                <c:if test="${user.name == profileuser.name}">
                <li><a href="#account" data-toggle="tab">Turniereinstellungen</a></li>
                </c:if>
        </ul>
        <div id="myTabContent" class="tab-content">

            <div class="tab-pane fade in active" id="news">
                <i class="fa fa-gamepad pull-left fa-4x"></i>
                <p>${tournament.description}</p>
                <div class="row">
                    <div class="col-lg-5">
                        <p>Leader: <b><a href="${pageContext.request.contextPath}/user/profile?user=${tournament.leader_name}> ${tournament.leader_name} </a></b></p>
                        <p>Zeitraum: <b> ${tournament.start_date} ${tournament.start_time}</b> bis <b>${tournament.end_date} ${tournament.end_time}</b></p>
                        <p>Anmeldefrist: 
                            <c:choose>
                                <c:when test="${tournament.term_of_application != null}"> 
                                    <b>${tournament.term_of_application}</b>, <b>${tournament.countdown}</b></p>
                                </c:when>
                                <c:otherwise> Keine Anmeldefrist
                            </c:otherwise>
                        </c:choose>
                        <p>Spieltage: <b>${tournament.matchdays}</b></p>
                        <p>Austragungsort: <b><a href="https://maps.google.com/maps?q=<%=tournament.getVenue()%>&hl=de&sll=28.149503,-71.71875&sspn=88.855059,173.144531&hnear=${tournament.venue}&t=m&z=10" target="_blank">${tournament.venue}</a></b></p>
                    </div>
                    <div class="col-lg-5">
                        <iframe width="100%" height="200dpx" frameborder="2" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.de/maps?hl=de&q=${tournament.venue}+(${tournament.venue})&ie=UTF8&t=&z=12&iwloc=B&output=embed"></iframe>
                    </div>
                </div>
                <div class="row">

                    <div class="col-sm-12">
                        <h2 class="page-header">Spielplan f&uuml;r "${tournament.name}"</h2>

                        <div class="panel panel-default">
                            <!-- Default panel contents -->
                            <div class="panel-heading">Spielplan</div>

                            <!-- Table -->
                            <div class="table-responsive">                                               
                                <table class="table table-hover">  
                                    <thead>  
                                        <tr>  
                                            <th><span class="label label-success">Datum</span></th> 
                                            <th><span class="label label-success">Heim</span></th> 
                                            <th><span class="label label-success">Gast</span></th> 
                                            <th><span class="label label-success">Ergebnis</span></th> 
                                        </tr>  
                                    </thead>  
                                    <tbody>  
                                        <%for (int idx = 0; idx < 10; idx++) {%>
                                        <tr>  
                                            <td>1</td>  
                                            <td>1</td>  
                                            <td>10</td>  
                                            <td>2</td> 
                                        </tr>  
                                        <%}%>
                                    </tbody>  
                                </table>  
                            </div>
                        </div>  
                    </div>
                </div><!-- /.row -->
            </div>


            <div class="tab-pane fade" id="table">
                <i class="fa fa-table pull-left fa-4x"></i>
                <p>Hier steht die aktuelle Tabelle</p>
                <div class="row">  

                    <div class="col-sm-12">
                        <h2 class="page-header">Tabelle f&uuml;r "${tournament.name}"</h2>

                        <div class="panel panel-default">
                            <!-- Default panel contents -->
                            <div class="panel-heading">Tabelle</div>

                            <!-- Table -->
                            <div class="table-responsive">                                               
                                <table class="table table-hover">  
                                    <thead>  
                                        <tr>   
                                            <th><a href="#" data-toggle="tooltip" data-placement="top" title="Platz" class="label label-default">Platz</a></th> 
                                            <th><a href="#" data-toggle="tooltip" data-placement="top" title="Teamname" class="label label-default">Teamname</a></th> 
                                            <th><a href="#" data-toggle="tooltip" data-placement="top" title="Spiele" class="label label-default">Spiele</a></th> 
                                            <th><a href="#" data-toggle="tooltip" data-placement="top" title="Win-Rate in %" class="label label-primary">Win-Rate in %</a></th> 
                                            <th><a href="#" data-toggle="tooltip" data-placement="top" title="Siege" class="label label-success">Siege</a></th> 
                                            <th><a href="#" data-toggle="tooltip" data-placement="top" title="Niederlagen" class="label label-danger">Niederlagen</a></th> 
                                            <th><a href="#" data-toggle="tooltip" data-placement="top" title="Tore" class="label label-success">Tore</a></th> 
                                            <th><a href="#" data-toggle="tooltip" data-placement="top" title="Gegentore" class="label label-warning">Gegentore</a></th> 
                                            <th><a href="#" data-toggle="tooltip" data-placement="top" title="Tordifferenz" class="label label-default">Tordifferenz</a></th> 
                                        </tr>  
                                    </thead>  
                                    <tbody>  
                                        <%for (int idx = 0; idx < tournament.getTable().size(); idx++) {%>
                                        <tr>  
                                            <td><%=idx + 1%>.</td> 
                                            <td><a href="/KMitSystem/team/profile?team=<%=tournament.getTable().get(idx).getTeam()%>"><%=tournament.getTable().get(idx).getTeam()%></a></td>  
                                            <td><%=tournament.getTable().get(idx).getTournament_team_matches()%></td>  
                                            <td><%=tournament.getTable().get(idx).getTournament_team_winrate()%></td>  
                                            <td><%=tournament.getTable().get(idx).getTournament_team_wins()%></td>  
                                            <td><%=tournament.getTable().get(idx).getTournament_team_defeats()%></td>  
                                            <td><%=tournament.getTable().get(idx).getTournament_team_goals()%></td> 
                                            <td><%=tournament.getTable().get(idx).getTournament_team_goals_conceded()%></td> 
                                            <td><%=tournament.getTable().get(idx).getTournament_team_goal_difference()%></td>                                         
                                        </tr>  
                                        <%}%>
                                    </tbody>  
                                </table>  
                            </div>
                        </div>  
                    </div>
                </div><!-- /.row -->
            </div>

            <div class="tab-pane fade" id="user">
                <i class="fa fa-arrow-circle-o-up pull-left fa-4x"></i>
                <p>Hier siehst du das Ranking alle am Turnier teilnehmenden Spieler.</p>
                <div class="row">

                    <div class="col-lg-12">
                        <h2 class="page-header">Userstatistik f&uuml;r "${tournament.name}"</h2>

                        <div class="panel panel-default">
                            <!-- Default panel contents -->
                            <div class="panel-heading">Userstatistik</div>

                            <!-- Table -->
                            <div class="table-responsive">                                               
                                <table class="table table-hover">  
                                    <thead>  
                                        <tr>  
                                            <th><span class="label label-default">Platz</span></th> 
                                            <th><span class="label label-default">Spieler</span></th> 
                                            <th><span class="label label-default">Siege</span></th>
                                            <th><span class="label label-default">Tore</span></th> 
                                            <th><span class="label label-default">Team</span></th> 
                                        </tr>  
                                    </thead>  
                                    <tbody>  
                                        <%for (int idx = 0; idx < member.size(); idx++) {%>
                                        <tr>  
                                            <td><%=idx + 1%>.</td>  
                                            <td><%=member.get(idx).getUsername()%></td>  
                                            <td><%=member.get(idx).getStatistics().getWins()%></td> 
                                            <td><%=member.get(idx).getStatistics().getGoals()%></td>  
                                            <td>kp</td> 
                                        </tr>  
                                        <%}%>
                                    </tbody>  
                                </table>  
                            </div>
                        </div>
                    </div>
                </div><!-- /.row -->
            </div>

            <div class="tab-pane fade" id="dashboard">
                <i class="fa fa-gears pull-left fa-4x"></i>
                <p>&Auml;ndere dein Turnier</p>

                <div class="col-lg-offset-10 col-md-offset-10 col-sm-offset-10">
                    <!-- modal caller -->
                    <a href="#modal-dialog-tournament" class="modal-toggle btn btn-danger" data-toggle="modal" data-modal-type="confirm" data-modal-title="Delete Property" data-modal-text="Are you sure you want to delete the tournament?" data-modal-confirm-url="#"><span class="fa fa-warning"> Turnier l&ouml;schen <i class="fa fa-angle-right"></i></span></a>
                </div>


                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Turnier-Teams</h3>
                    </div>

                    <div class="col-sm-4 col-lg-offset-2 col-md-6 hero-feature">
                        <div class="caption">
                            <div class="panel panel-default">
                                <!-- Default panel contents -->
                                <div class="panel-heading">Turniermitglieder</div>

                                <!-- Table -->
                                <table class="table">
                                    <tbody>
                                        <% for (int idx = 0; idx < teams.size(); idx++) {%>
                                        <tr>
                                            <td>
                                                <div class="col-md-9">
                                                    <ul class="nav nav-pills">
                                                        <li class="caption"><a href="${tournament.start_time}/team/profile?team=<%=teams.get(idx).getName()%>"><%=teams.get(idx).getName()%></a> 
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-sm-3">
                                                    <form method="post" action="<%=link%>/team/profile?action=kick" id="<%=teams.get(idx).getName()%>">
                                                        <input type="text" value="<%=teams.get(idx).getName()%>" name="kick_team" style="display:none">
                                                        <a onclick="document.getElementById('<%=teams.get(idx).getName()%>').submit();" class="btn btn-danger">Entfernen <i class="fa fa-angle-right"></i></a>
                                                    </form>
                                                </div>
                                            </td> 
                                        </tr>  
                                        <% } %>
                                        <% if (teams.size() == 0) { %>
                                        <tr>
                                    <p>Kein Teams im Turnier</p> 
                                    </tr>
                                    <% }%>
                                    </tbody>
                                </table>
                            </div>     
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Name &auml;ndern</h3>
                        <form class="form-horizontal" role="form" name="change_name" action="${tournament.start_time}/tournament/profile" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Name</label>
                                <div class="col-sm-6 ">
                                    <input type="text" class="form-control" name="name_new" placeholder="'${tournament.name}'" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary btn-default" type="submit">
                                        &Auml;ndern <i class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div> 
                </div>


                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Passwort &auml;ndern</h3>
                        <form class="form-horizontal" role="form" name="change_password" action="<%=link%>/tournament/profile">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Passwort</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" name="password_old" placeholder="altes Passwort">
                                </div>
                                <div class="col-sm-6 col-md-offset-2">
                                    <input type="password" class="form-control" name="password_new" placeholder="neues Passwort">
                                    <input type="password" class="form-control" name="password_new2" placeholder="neues Passwort">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary btn-default" type="submit">
                                        &Auml;ndern <i class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Turnierleiter &auml;ndern</h3>
                        <form class="form-horizontal" role="form" name="change_leader" action="${tournament.start_time}/tournament/profile" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Turnierleiter</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" name="password" placeholder="Turnier-Passwort">
                                </div>
                                <div class="col-lg-6 col-md-offset-2">
                                    <input list="leaderAuswahl" name="leader_new" class="form-control" autocomplete="off" placeholder="Neuer Leader" required>
                                    <datalist id="userAuswahl">
                                        <option value=""> 
                                    </datalist>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary btn-default" type="submit">
                                        &Auml;ndern <i class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Beschreibung &auml;ndern</h3>
                        <form class="form-horizontal" role="form" name="change_description" action="${tournament.start_time}/tournament/profile">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Neuer Turnierbeschreibung</label>
                                <div class="col-sm-6">
                                    <textarea style="width:100%" rows="10" class="form-control" name="description_new" placeholder="'${tournament.description}'" maxlength="255"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary btn-default" type="submit">
                                        &Auml;ndern <i class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>     
                </div>


                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Austragungsort &auml;ndern</h3>
                        <form class="form-horizontal" role="form" name="change_venue" action="${tournament.start_time}/tournament/profile">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Neuer Ort</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" name="venue_new" placeholder="'${tournament.venue}'">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary btn-default" type="submit">
                                        &Auml;ndern <i class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>     
                </div>


                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Spieltage &auml;ndern</h3>
                        <form class="form-horizontal" role="form" name="change_matchdays" action="${tournament.start_time}/tournament/profile">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Spieltage</label>
                                <div class="col-sm-6">
                                    <input type="number" min="0" class="form-control" name="nr_matchdays_new" placeholder="${tournament.matchdays} Spieltage">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary btn-default" type="submit">
                                        &Auml;ndern <i class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>     
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">Datum &auml;ndern</h3>
                        <form class="form-horizontal" role="form" name="change_start" action="${tournament.start_time}/tournament/profile">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Startdatum</label>
                                <div class="col-sm-6">
                                    <input type="date" class="form-control" name="start_date_new">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary btn-default" type="submit">
                                        &Auml;ndern <i class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                        <form class="form-horizontal" role="form" name="change_end" action="${tournament.start_time}/tournament/profile">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Enddatum</label>
                                <div class="col-sm-6">
                                    <input type="date" class="form-control" name="end_date_new">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary btn-default" type="submit">
                                        &Auml;ndern <i class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                        <form class="form-horizontal" role="form" name="change_term" action="${tournament.start_time}/tournament/profile">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Anmeldefrist</label>
                                <div class="col-sm-6">
                                    <input type="date" class="form-control" name="term_date_new">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary btn-default" type="submit">
                                        &Auml;ndern <i class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>     
                </div>

            </div><!-- /.row -->

        </div>
    </div>

</div><!-- /.row -->