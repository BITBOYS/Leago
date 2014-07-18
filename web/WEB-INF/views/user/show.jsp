<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">User-Profil <small>Alles &uuml;ber ${profileuser.name}</small></h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li class="active">Profil</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#statistics" data-toggle="tab">Statistik</a></li>
            <li><a href="#teams" data-toggle="tab">Teams</a></li>
            <li><a href="#tournaments" data-toggle="tab">Turniere</a></li>
            <c:if test="${user.name == profileuser.name}">
                <li><a href="#account" data-toggle="tab">Accounteinstellungen</a></li>
            </c:if>
        </ul>
        <div id="myTabContent" class="tab-content">
            
            
            
        <div class="tab-pane fade in active" id="statistics">
            <i class="fa fa-user pull-left fa-4x"></i>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus tristique, non posuere neque iaculis. Fusce aliquet dui ut felis rhoncus, vitae molestie mauris auctor. Donec pellentesque feugiat leo a adipiscing. Pellentesque quis tristique eros, sed rutrum mauris.</p>
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">${profileuser.name}s pers&ouml;nliche Statistik</h2>
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading">&Uuml;bersicht</div>
                        <!-- Table -->
                        <div class="table-responsive">                                               
                            <table class="table table-hover">  
                                <thead>  
                                    <tr>  
                                        <th><span class="label label-primary">Turnierteilnahmen</span></th> 
                                        <th><span class="label label-success">Turniersiege</span></th>  
                                        <th><span class="label label-primary">Matches</span></th>  
                                        <th><span class="label label-success">Gesmatsiege</span></th>  
                                        <th><span class="label label-danger">Niederlagen</span></th>  
                                        <th><span class="label label-primary">Tordifferenz</span></th> 
                                        <th><span class="label label-success">Tore</span></th>  
                                        <th><span class="label label-danger">Gegentore</span></th> 
                                    </tr>  
                                </thead>  
                                <tbody>  
                                    <tr>  
                                        <td>${profileuser.statistics.tournament_participations}</td> 
                                        <td>${profileuser.statistics.tournament_wins}</td> 
                                        <td>${profileuser.statistics.matches}</td>   
                                        <td>${profileuser.statistics.wins}</td>  
                                        <td>${profileuser.statistics.defeats}</td>  
                                        <td>${profileuser.statistics.goal_difference}</td>  
                                        <td>${profileuser.statistics.goals}</td>  
                                        <td>${profileuser.statistics.goals_conceded}</td> 
                                    </tr>  
                                </tbody>  
                            </table> 
                        </div> <!-- /.table-reponsive --> 
                    </div> <!-- /.panel --> 
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
        </div><!-- /.tab statistik -->

        
        
        <div class="tab-pane fade" id="teams">
            <i class="fa fa-beer pull-left fa-4x"></i>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus tristique, non posuere neque iaculis. Fusce aliquet dui ut felis rhoncus, vitae molestie mauris auctor. Donec pellentesque feugiat leo a adipiscing. Pellentesque quis tristique eros, sed rutrum mauris.</p>
            <div class="row">  
                <div class="col-lg-12">
                    <h2 class="page-header">${profileuser.name}s Teams</h2>
                </div>
                <!-- Schleife zum Anzeigen aller Teams in denen man sich befindet -->
                <c:forEach var="team" items="${profileuser.teams}">
                    <div class="col-lg-4 col-md-4 hero-feature">
                        <div class="thumbnail">
                            <div class="caption">
                                <h3>${team.name} <small> Leader: <a href="${pageContext.request.contextPath}/user/${team.leader.name}">${team.leader.name}</a></small></h3>
                            </div>
                            <div class="caption">
                                <div class="panel panel-default">
                                    <!-- Default panel contents -->
                                    <div class="panel-heading">Stats</div>
                                    <!-- Table -->
                                    <div class="table-responsive">                                               
                                        <table class="table table-hover">   
                                            <thead>  
                                                <tr>  
                                                    <th class="tooltip-social"><a href="#" data-toggle="tooltip" data-placement="top" title="Turniersiege" class="label label-success">TS</a></th>  
                                                    <th><span title="Gesamtsiege" class="label label-success">GS</span></th>  
                                                    <th><span title="Niederlagen" class="label label-danger">N</span></th>  
                                                    <th><span title="Tore" class="label label-success">T</span></th>  
                                                    <th><span title="Gegentore" class="label label-danger">GT</span></th>  
                                                    <th><span title="Tordifferenz" class="label label-primary">TD</span></th> 
                                                </tr>  
                                            </thead>  
                                            <tbody>  
                                                <tr>  
                                                    <td>${team.statistics.tournament_wins}</td>  
                                                    <td>${team.statistics.wins}</td>  
                                                    <td>${team.statistics.defeats}</td>  
                                                    <td>${team.statistics.goals}</td>  
                                                    <td>${team.statistics.goals_conceded}</td>  
                                                    <td>${team.statistics.goal_difference}</td> 
                                                </tr>  
                                            </tbody>  
                                        </table> 
                                    </div>
                                </div>  
                                <p>
                                    <a href="${pageContext.request.contextPath}/team/${team.name}" class="btn btn-primary">Zum Teamprofil <i class="fa fa-angle-right"></i></a>
                                    <a onclick="" class="btn btn-danger">Team verlassen <i class="fa fa-angle-right"></i></a>
                                </p>
                            </div>
                        </div><!-- /.thumbnail -->
                        <br>
                    </div> <!-- /.col-lg-4 -->
                </c:forEach> <!-- /.forEach teams -->
            </div> <!-- /.row -->
        </div> <!-- /.tab team -->
        
        

        <div class="tab-pane fade" id="tournaments">
            <i class="fa fa-flag pull-left fa-4x"></i>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus tristique, non posuere neque iaculis. Fusce aliquet dui ut felis rhoncus, vitae molestie mauris auctor. Donec pellentesque feugiat leo a adipiscing. Pellentesque quis tristique eros, sed rutrum mauris.</p>
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">${profileuser.name}s Turniere</h2>
                </div>
                <c:forEach var="tournament" items="${profileuser.tournaments}">
                    <div class="col-lg-4 col-md-4 hero-feature">
                        <div class="thumbnail">
                            <div class="caption">
                                <h3>${tournament.name} <small> Leader: <a href="${pageContext.request.contextPath}/user/${tournament.leader.name}">${tournament.leader.name}</a></small></h3>
                            </div>
                            <div class="caption">
                                <p>${tournament.description}</p>
                                <div class="panel panel-default">
                                    <!-- Default panel contents -->
                                    <div class="panel-heading">Daten</div>
                                    <!-- Table -->
                                    <div class="table-responsive">                                               
                                        <table class="table table-hover">  
                                            <thead>  
                                                <tr>  
                                                    <th>Startdatum</th>  
                                                    <th>Enddatum</th>  
                                                    <th>Status</th>   
                                                </tr>  
                                            </thead>  
                                            <tbody>  
                                                <tr>  
                                                    <td>${tournament.start_date}</td>  
                                                    <td>${tournament.end_date}</td>
                                                    <c:choose>
                                                        <c:when test="${tournament.password == null}">
                                                            <td>&Ouml;ffentlich</td>  
                                                        </c:when>
                                                        <c:when test="${tournament.password != null}">
                                                            <td>Privat</td> 
                                                        </c:when>
                                                    </c:choose>
                                                </tr>  
                                            </tbody>  
                                        </table>  
                                    </div>
                                </div>  
                                <p><a href="${pageContext.request.contextPath}/tournament/${tournament.name}" class="btn btn-primary">Zum Turnierprofil <i class="fa fa-angle-right"></i></a></p>
                            </div>
                        </div> <!-- /.thumbnail -->
                        <br>
                    </div> <!-- /.col-lg-4 --> 
                </c:forEach> <!-- /.forEach teams -->
            </div> <!-- /.row -->
        </div> <!-- /.tab tournament -->       
        
        
        
        
        <div class="tab-pane fade" id="account">
            <i class="fa fa-gear pull-left fa-4x"></i>

            <div class="row">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus tristique, non posuere neque iaculis. Fusce aliquet dui ut felis rhoncus, vitae molestie mauris auctor. Donec pellentesque feugiat leo a adipiscing. Pellentesque quis tristique eros, sed rutrum mauris.</p>
                <div class="col-lg-12">
                    <form class="form-horizontal" role="form" name="profile_form" action="${pageContext.request.contextPath}/user/${user.name}" method="POST">
                        
                        
                        <h2 class="page-header">E-Mail &auml;ndern</h2>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">E-Mail</label>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input type="email" class="form-control" name="input_email_old" placeholder="alte E-Mail" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" name="input_email_new1" placeholder="neue E-Mail" required>
                                </div>
                                <div class="form-group">
                                 <input type="email" class="form-control" name="input_email_new2" placeholder="neue E-Mail" required>
                                </div>
                            </div>
                        </div>
                        
                        
                        <h2 class="page-header">Name &auml;ndern</h2>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="input_name_old" placeholder="alter Name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="input_name_new1" placeholder="neuer Name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="input_name_new2" placeholder="neuer Name">
                                </div>
                            </div>
                        </div>
                        
                        
                        <h2 class="page-header">Passwort &auml;ndern</h2>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Passwort</label>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input type="password" class="form-control" name="input_password_old" placeholder="altes Passwort">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="input_password_new1" placeholder="neues Passwort">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="input_password_new2" placeholder="neues Passwort">
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button class="btn btn-primary btn-default" type="submit">
                                    Speichern <i class="fa fa-angle-right"></i></button>
                            </div>
                        </div>
                    </form>
                </div> <!-- /.col-lg-12 --> 
            </div> <!-- /.row -->
        </div> <!-- /.tab account -->
    </div>
</div>