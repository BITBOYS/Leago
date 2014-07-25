<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row col-md-12 page-header">
    <div class="col-md-10">
        <h1 >Turnier Profil <small>Alles &uuml;ber ${tournament.name}</small></h1>
    </div><!-- /.col -->
    <c:if test="${tournament.leader.name == user.name}">
        <div class="col-md-2">
            <a class="btn btn-leago pull-right" href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings"><span class="fa fa-wrench"> Settings <i class="fa fa-angle-double-right"></i></span></a>
        </div><!-- /.col -->
    </c:if>
</div><!-- /.row -->

<div class="row">
    <div class="col-md-12">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#news" data-toggle="tab"><i class="fa fa-gamepad pull-left fa-2x"></i> Spielplan</a></li>
            <li><a href="#table" data-toggle="tab"><i class="fa fa-table pull-left fa-2x"></i> Tabelle</a></li>
            <li><a href="#user" data-toggle="tab"> <i class="fa fa-arrow-circle-o-up pull-left fa-2x"></i> Spielerstatistiken</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">

            <div class="tab-pane fade in active" id="news">
                <div class="row">
                    <div class="col-md-6">
                        <p>${tournament.description}</p>
                        <p>Leader: <b><a href="${pageContext.request.contextPath}/user/${tournament.leader.name}"> ${tournament.leader.name} </a></b></p>
                        <p>Zeitraum: <b> ${tournament.start_date} ${tournament.start_time}</b> bis <b>${tournament.end_date} ${tournament.end_time}</b></p>
                        <p>Anmeldefrist: 
                            <c:choose>
                                <c:when test="${tournament.term_of_application != null}"> 
                                    <b>${tournament.term_of_application}</b>, <b>${countdown}</b>
                                </c:when>
                                <c:otherwise> Keine Anmeldefrist
                                </c:otherwise>
                            </c:choose> 
                        </p>
                        <p>Spieltage: <b>${tournament.rounds}</b></p>
                        <p>Austragungsort: <b><a href="https://maps.google.com/maps?q=${tournament.venue}&hl=de&sll=28.149503,-71.71875&sspn=88.855059,173.144531&hnear=${tournament.venue}&t=m&z=10" target="_blank">${tournament.venue}</a></b></p>
                    </div>
                    <div class="col-md-6">
                        <iframe width="100%" height="220dpx" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.de/maps?hl=de&q=${tournament.venue}+(${tournament.venue})&ie=UTF8&t=&z=12&iwloc=B&output=embed"></iframe>
                    </div>
                </div><!-- /.row -->

                <div class="row">
                    <div class="col-md-12">
                        <h2 class="page-header">Spielplan f&uuml;r "${tournament.name}"</h2>

                        <div class="panel panel-leago">
                            <!-- Default panel contents -->
                            <div class="panel-heading"><i class="fa fa-gamepad"></i> Spielplan</div>

                            <!-- Table -->
                            <div class="table-responsive">                                               
                                <table class="table table-hover">  
                                    <thead>  
                                        <tr>  
                                            <th><span class="label label-default">Datum</span></th> 
                                            <th><span class="label label-default">Heim</span></th> 
                                            <th><span class="label label-default">Gast</span></th> 
                                            <th><span class="label label-default">Ergebnis</span></th> 
                                        </tr>  
                                    </thead>  
                                    <tbody>  
                                        <c:forEach items="${tournament.schedule.rounds}" var="round">
                                            <c:forEach items="${round.matches}" var="match">
                                                <tr>  
                                                    <td>1</td>  
                                                    <td><a href="${pageContext.request.contextPath}/team/${match.team1.name}">${match.team1.name}</a></td>  
                                                    <td><a href="${pageContext.request.contextPath}/team/${match.team2.name}">${match.team2.name}</a></td>  
                                                    <td>2</td> 
                                                </tr>  
                                            </c:forEach>
                                        </c:forEach>
                                    </tbody>  
                                </table>  
                            </div>
                        </div><!-- /.panel -->  
                    </div><!-- /.col -->
                </div><!-- /.row -->

            </div><!-- /.tab-pane -->


            <div class="tab-pane fade" id="table">
                <p>Hier steht die aktuelle Tabelle</p>
                <div class="row">  

                    <div class="col-sm-12">
                        <h2 class="page-header">Tabelle f&uuml;r "${tournament.name}"</h2>

                        <div class="panel panel-leago">
                            <!-- Default panel contents -->
                            <div class="panel-heading"><i class="fa fa-table"></i> Tabelle</div>

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
                                                <td># <c:out value="${status.count}" /></td> 
                                                <td><a href="${pageContext.request.contextPath}/team/${placement.team}">${placement.team}</a></td>  
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
                <p>Hier siehst du das Ranking alle am Turnier teilnehmenden Spieler.</p>
                <div class="row">

                    <div class="col-lg-12">
                        <h2 class="page-header">Userstatistik f&uuml;r "${tournament.name}"</h2>

                        <div class="panel panel-leago">
                            <!-- Default panel contents -->
                            <div class="panel-heading"><i class="fa fa-arrow-circle-o-up"></i> Userstatistik</div>

                            <!-- Table -->
                            <div class="table-responsive">                                               
                                <table class="table table-hover">  
                                    <thead>  
                                        <tr>  
                                            <th><span class="label label-default">Platz</span></th> 
                                            <th><span class="label label-default">Spieler</span></th> 
                                            <th><span class="label label-default">Siege</span></th>
                                            <th><span class="label label-default">Tore</span></th> 
                                        </tr>  
                                    </thead>  
                                    <tbody>  
                                        <c:forEach items="${tournament.member}" var="user" varStatus="status">
                                            <tr>  
                                                <td># ${status.count}</td> 

                                                <td><a href="${pageContext.request.contextPath}/user/${user.name}">${user.name}</a></td>  
                                                <td>${user.statistics.wins}</td> 
                                                <td>${user.statistics.goals}</td>  
                                            </tr> 
                                        </c:forEach>
                                    </tbody>  
                                </table>  
                            </div>
                        </div><!-- /.panel -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.tab-pane -->
        </div><!-- /.tab-content -->
    </div><!-- /.col -->
</div><!-- /.row -->
