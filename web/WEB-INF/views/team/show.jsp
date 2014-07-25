<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="row">

    <div class="col-lg-12">

        <div class="pull-right need-help">
            <c:if test="${user.name == team.leader.name}">
                <a href="${pageContext.request.contextPath}/team/${team.name}/settings/profile" class="btn btn-leago"><i class="fa fa-pencil"></i> Turnier bearbeiten</a>
            </c:if>
        </div>

        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#member" data-toggle="tab">Mitglieder</a></li>
            <li><a href="#tournaments" data-toggle="tab">Turniere</a></li>
            <li><a href="#statistics" data-toggle="tab">Statistiken</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">


            <!-- M E M B E R  -->
            <div class="tab-pane fade in active" id="member">
                <i class="fa fa-beer pull-left fa-4x"></i>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus tristique, non posuere neque iaculis. Fusce aliquet dui ut felis rhoncus, vitae molestie mauris auctor. Donec pellentesque feugiat leo a adipiscing. Pellentesque quis tristique eros, sed rutrum mauris.</p>
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Mitglieder</h2>
                        <div class="panel panel-default">
                            <!-- Default panel contents -->
                            <div class="panel-heading">Teammitglieder</div>
                            <div class="list-group">
                                <c:forEach var="member" items="${team.member}" >
                                    <a href="${pageContext.request.contextPath}/user/${member.name}" class="list-group-item">${member.name}
                                        <c:if test="${member.name == team.leader.name}">
                                            <i class="fa fa-star-o"></i>
                                        </c:if>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </div><!-- /.row -->
            </div>


            <!-- T O U R N A M E N T -->
            <div class="tab-pane fade" id="tournaments">
                <i class="fa fa-flag pull-left fa-4x"></i>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus tristique, non posuere neque iaculis. Fusce aliquet dui ut felis rhoncus, vitae molestie mauris auctor. Donec pellentesque feugiat leo a adipiscing. Pellentesque quis tristique eros, sed rutrum mauris.</p>
                <div class="row">

                    <div class="col-lg-12">
                        <h2 class="page-header">Aktuelle Turniere</h2>
                    </div>

                    <c:forEach var="tournament" items="${team.tournaments}">
                        <div class="col-lg-4 col-md-4 hero-feature">
                            <div class="thumbnail">
                                <h3>${tournament.name} <small> Leader: <a href="${pageContext.request.contextPath}/user/${tournament.leader.name}">${tournament.leader.name}</a></small></h3>
                                <img src="http://placehold.it/800x500" alt="">
                                <div class="caption">
                                    <p>${tournament.description}</p>
                                    <div class="panel panel-default">
                                        <!-- Default panel contents -->
                                        <div class="panel-heading">Daten</div>

                                        <!-- Table -->
                                        <table class="table">  
                                            <thead>  
                                                <tr>  
                                                    <th>Startdatum</th>  
                                                    <th>Enddatum</th>
                                                </tr>  
                                            </thead>  
                                            <tbody>  
                                                <tr>  
                                                    <td>${tournament.start_date}</td>  
                                                    <td>${tournament.end_date}</td>
                                                </tr>  
                                            </tbody>  
                                        </table>  
                                    </div>  
                                    <p><a href="${pageContext.request.contextPath}/tournament/${tournament.name}" class="btn btn-primary">Zum Turnierprofil <i class="fa fa-angle-right"></i></a></p>
                                </div>
                            </div>
                        </div> 
                    </c:forEach>
                </div><!-- /.row -->
            </div>


            <!-- S T A T I S T I C S -->
            <div class="tab-pane fade in" id="statistics">
                <i class="fa fa-gear pull-left fa-4x"></i>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus tristique, non posuere neque iaculis. Fusce aliquet dui ut felis rhoncus, vitae molestie mauris auctor. Donec pellentesque feugiat leo a adipiscing. Pellentesque quis tristique eros, sed rutrum mauris.</p>
                <div class="row">

                    <div class="col-lg-12">
                        <h2 class="page-header">Statistik</h2>

                        <div class="panel panel-default">
                            <!-- Default panel contents -->
                            <div class="panel-heading">&Uuml;bersicht</div>

                            <!-- Table -->
                            <table class="table">  
                                <thead>  
                                    <tr>  
                                        <th>Turniersiege</th> 
                                        <th>Turnierteilnahmen</th> 
                                        <th>Gesmatsiege</th>  
                                        <th>Niederlagen</th>  
                                        <th>Tore</th>  
                                        <th>Gegentore</th>
                                    </tr>  
                                </thead>  
                                <tbody>  
                                    <tr>  
                                        <td>${team.statistics.tournament_wins}</td>
                                        <td>${team.statistics.tournament_participations}</td>  
                                        <td>${team.statistics.wins}</td>  
                                        <td>${team.statistics.defeats}</td>  
                                        <td>${team.statistics.goals}</td>  
                                        <td>${team.statistics.goals_conceded}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><!-- /.row -->
            </div>
        </div><!-- /Tab closed -->                            
    </div><!-- /Column closed -->
</div>

