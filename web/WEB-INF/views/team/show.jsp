<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="leago.i18n.bundle" />

<div class="row">
    <div class="col-md-4 col-md-offset-4 text-center">
        <h2><b>${team.name}</b></h2>
        <p><fmt:message key="team.info.member_since"/> ${team.create_date_web}</p>
        <img class="img-circle" src="http://placehold.it/250x250">
        <hr>
    </div>
</div>

        <div class="row">
    <div class="col-md-4 text-center">
        <h2><fmt:message key="team.stats.match"/></h2>
        <c:choose>
            <c:when test="${team.statistics.goal_difference != 0 && team.statistics.goals != 0}">   
                <br>
                <div class="stats" style="margin-left: auto; margin-right: auto">
                    <canvas id="matches" width="200" height="150"></canvas>
                </div>
            </c:when>
            <c:when test="${team.statistics.goal_difference == 0 && team.statistics.goals == 0}">
                <div class="text-center">
                    <p style="margin-top: 30px; margin-left: auto; margin-right: auto"><fmt:message key="user.stats.no"/></p>
                </div>
            </c:when>
        </c:choose>
        <hr>
    </div>

    <div class="col-md-4 text-center">
        <h2><fmt:message key="team.stats.goal"/></h2>
        <c:choose>
            <c:when test="${team.statistics.wins != 0 && team.statistics.defeats != 0}"> 
                <br>
                <div class="stats" style="margin-left: auto; margin-right: auto">
                    <canvas id="goals" width="200" height="150"></canvas>
                </div>
            </c:when>
            <c:when test="${team.statistics.goal_difference == 0 && team.statistics.goals == 0}">
                <div class="text-center">
                    <p style="margin-top: 30px; margin-left: auto; margin-right: auto"><fmt:message key="user.stats.no"/></p>
                </div>
            </c:when>
        </c:choose>    
        <hr>
    </div>

    <div class="col-md-4 text-center">
        <h2><fmt:message key="team.stats.tournament"/></h2>
        <c:choose>
            <c:when test="${team.statistics.tournament_wins != 0 && team.statistics.tournament_participations != 0}">    
                <br>
                <div class="stats" style="margin-left: auto; margin-right: auto">
                    <canvas id="tournaments" width="200" height="150"></canvas>
                </div>
            </c:when>
            <c:when test="${team.statistics.tournament_wins == 0 && team.statistics.tournament_participations == 0}">
                <div class="text-center">
                    <p style="margin-top: 30px; margin-left: auto; margin-right: auto"><fmt:message key="user.stats.no"/></p>
                </div>
            </c:when>
        </c:choose>
        <hr>
    </div>    
</div>
<br>

<c:if test="${user.name == team.leader.name}">
    <div class="col-md-6 col-md-offset-3 text-center">
        <a style="width: 100%" href="${pageContext.request.contextPath}/team/${team.name}/settings/profile" class="btn btn-leago"><i class="fa fa-gear"></i> Team bearbeiten</a>
    </div>
    <br>
    <br>
</c:if>


<div class="row">
    <div class="col-md-12">
        <h2 class="page-header"><fmt:message key="team.header.member"/> ${team.name}</h2>
        <c:choose>
            <c:when test="${!empty team.member}">    
                <!-- Schleife zum Anzeigen aller Teams in denen man sich befindet -->
                <c:forEach var="member" items="${team.member}">
                    <div class="col-md-2" style="margin: 0 0 20px -15px;">
                        <a href="${pageContext.request.contextPath}/user/${member.name}">
                            <div class="caption">
                                <h4><c:if test="${member.name == team.leader.name}"><i class="fa fa-star-o"></i></c:if> ${member.name}</h4>  
                                    <p><i class="fa fa-user fa-4x"></i></p>  
                                </div>
                            </a>
                        </div>
                </c:forEach> <!-- /.forEach teams -->
            </c:when>
            <c:otherwise>
                <p style="margin-top: 30px; margin-left: auto; margin-right: auto"><fmt:message key="team.member.no"/></p>
            </c:otherwise>
        </c:choose>
    </div>
</div>    

<div class="row">       
    <div class="col-md-12">
        <h2 class="page-header"><fmt:message key="team.header.tournament1"/>  ${team.name} <fmt:message key="team.header.tournament2"/> </h2>
        <c:choose>
            <c:when test="${!empty team.tournaments}">    
                <!-- Schleife zum Anzeigen aller Teams in denen man sich befindet -->
                <c:forEach var="tournament" items="${team.tournaments}">
                    <div class="col-md-3" style="margin: 0 0 20px -15px;">
                        <a href="${pageContext.request.contextPath}/tournament/${tournament.name}" >
                            <div class="caption">  
                                <h4>${tournament.name}</h4>  
                                <p><i class="fa fa-trophy fa-4x"></i></p>  
                            </div>  
                        </a>
                    </div>
                </c:forEach> <!-- /.forEach teams -->
            </c:when>
            <c:otherwise>
                <p style="margin-top: 30px; margin-left: auto; margin-right: auto"><fmt:message key="team.tournaments.no"/></p>
            </c:otherwise>
        </c:choose>
    </div>
</div>


<div class="row">
    <div class="col-lg-12">
    </div>
</div>                 

<script>
    // pie chart data
    var matchesData = [
        {value: ${team.statistics.matches}, color: "#2271BB", label: "Matches"},
        {value: ${team.statistics.wins}, color: "#68C999", label: "Wins"},
        {value: ${team.statistics.defeats}, color: "#D66464", label: "Defeats"}
    ];
    // pie chart options
    var matchesOptions = {
        segmentShowStroke: true,
        animationSteps : 150,
        animateScale: true
    }
    // get pie chart canvas
    var matches = document.getElementById("matches").getContext("2d");
    // draw pie chart
    new Chart(matches).Doughnut(matchesData, matchesOptions);
</script>

<script>
    // pie chart data
    var goalsData = [
        {value: ${team.statistics.goal_difference}, color: "#2271BB", label: "Goal difference"},
        {value: ${team.statistics.goals}, color: "#68C999", label: "Goals"},
        {value: ${team.statistics.goals_conceded}, color: "#D66464", label: "Goals conceded"}
    ];

    // pie chart options
    var goalsOptions = {
        segmentShowStroke: true,
        animationSteps : 150,
        animateScale: true
    }
    // get pie chart canvas
    var goals = document.getElementById("goals").getContext("2d");
    // draw pie chart
    new Chart(goals).Doughnut(goalsData, goalsOptions);
</script>

<script>
    // pie chart data
    var tournamentData = [
        {value: ${team.statistics.tournament_participations}, color: "#2271BB", label: "Participations"},
        {value: ${team.statistics.tournament_wins}, color: "#68C999", label: "Wins"}
    ];

    // pie chart options
    var tournamentOptions = {
        segmentShowStroke: true,
        animationSteps : 150,
        animateScale: true
    }
    // get pie chart canvas
    var tournaments = document.getElementById("tournaments").getContext("2d");
    // draw pie chart
    new Chart(tournaments).Doughnut(tournamentData, tournamentOptions);
</script>

