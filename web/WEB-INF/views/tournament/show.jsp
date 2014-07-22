<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Turnier Profil <small>Alles &uuml;ber ${tournament.name}</small></h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li class="active">Turnier Profil</li>
        </ol>
    </div><!-- /.col -->
</div><!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#news" data-toggle="tab">Aktuelles</a></li>
            <li><a href="#table" data-toggle="tab">Tabelle</a></li>
            <li><a href="#user" data-toggle="tab">Spielerstatistiken</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">

            <div class="tab-pane fade in active" id="news">
                <i class="fa fa-gamepad pull-left fa-4x"></i>
                <p>${tournament.description}</p>
                <div class="row">
                    <div class="col-lg-5">
                        <p>Leader: <b><a href="${pageContext.request.contextPath}/user/${tournament.leader.name}"> ${tournament.leader.name} </a></b></p>
                        <p>Zeitraum: <b> ${tournament.start_date} ${tournament.start_time}</b> bis <b>${tournament.end_date} ${tournament.end_time}</b></p>
                        <p>Anmeldefrist: 
                            <c:choose>
                                <c:when test="${tournament.term_of_application != null}"> 
                                    <b>${tournament.term_of_application}</b>, <b></b>
                                </c:when>
                                <c:otherwise> Keine Anmeldefrist
                                </c:otherwise>
                            </c:choose> 
                        </p>
                        <p>Spieltage: <b>${tournament.nr_matchdays}</b></p>
                        <p>Austragungsort: <b><a href="https://maps.google.com/maps?q=${tournament.venue}&hl=de&sll=28.149503,-71.71875&sspn=88.855059,173.144531&hnear=${tournament.venue}&t=m&z=10" target="_blank">${tournament.venue}</a></b></p>
                    </div>
                    <div class="col-lg-5">
                        <iframe width="100%" height="200dpx" frameborder="2" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.de/maps?hl=de&q=${tournament.venue}+(${tournament.venue})&ie=UTF8&t=&z=12&iwloc=B&output=embed"></iframe>
                    </div>
                </div><!-- /.row -->

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
                                        <%--<c:forEach items="${tournament.matches}" var="match">--%>
                                        <tr>  
                                            <td>1</td>  
                                            <td>1</td>  
                                            <td>10</td>  
                                            <td>2</td> 
                                        </tr>  
                                        <%--</c:forEach>--%>
                                    </tbody>  
                                </table>  
                            </div>
                        </div><!-- /.panel -->  
                    </div><!-- /.col -->
                </div><!-- /.row -->

            </div><!-- /.tab-pane -->


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
                                        <c:forEach items="${tournament.table}" var="placement" varStatus="status">
                                            <tr>  
                                                <td>#<c:out value="${status.count}" /></td> 
                                                <td><a href="${pageContext.request.contextPath}/team?team=${placement.team}">${placement.team}</a></td>  
                                                <td>${placement.tournament_team_matches}</td>  
                                                <td>${placement.tournament_team_winrate}</td>  
                                                <td>${placement.tournament_team_wins}</td>  
                                                <td>${placement.tournament_team_defeats}</td>  
                                                <td>${placement.tournament_team_goals}</td> 
                                                <td>${placement.tournament_team_goals_conceded}</td> 
                                                <td>${placement.tournament_team_goal_difference}</td>                                         
                                            </tr>  
                                        </c:forEach>
                                    </tbody>  
                                </table>  
                            </div>
                        </div><!-- /.panel -->  
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.tab-pane -->

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
                                        <c:forEach items="${tournament.member}" var="user">
                                            <tr>  
                                                <td>.</td>  
                                                <td>${user.name}</td>  
                                                <td>${user.statistics.wins}</td> 
                                                <td>${user.statistics.goals}</td>  
                                                <td>kp</td> 
                                            </tr> 
                                        </c:forEach>
                                    </tbody>  
                                </table>  
                            </div>
                        </div><!-- /.panel -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.tab-pane -->

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
                                        <c:forEach items="${tournament.teams}" var="team">
                                            <tr>
                                                <td>
                                                    <div class="col-md-9">
                                                        <ul class="nav nav-pills">
                                                            <li class="caption"><a href="${tournament.start_time}/team?team=${team.name}">${team.name}</a> 
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <form method="post" action="${pageContext.request.contextPath}/team?action=kick" id="${team.name}">
                                                            <input type="text" value="${team.name}" name="kick_team" style="display:none">
                                                            <a onclick="document.getElementById('${team.name}').submit();" class="btn btn-danger">Entfernen <i class="fa fa-angle-right"></i></a>
                                                        </form>
                                                    </div>
                                                </td> 
                                            </tr>  
                                        </c:forEach>
                                        <c:if test="${empty tournament.teams}">
                                            <tr>
                                        <p>
                                            Kein Teams im Turnier
                                        </p> 
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>     
                        </div><!-- /.caption -->
                    </div>
                </div><!-- /.row -->
            </div><!-- /.tab-pane -->
        </div><!-- /.tab-content -->
    </div><!-- /.col -->
</div><!-- /.row -->