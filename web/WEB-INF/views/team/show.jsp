<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-md-3">
        <h2><b>${team.name}</b></h2>
        <img src="http://placehold.it/150x150">
    </div>
        
    <div class="col-md-8 pull-right">
        
        <c:choose>
            <c:when test="${team.statistics.goal_difference != 0 && team.statistics.goals != 0}">    
                <div class="pull-right text-center stats">
                    <h2>Match Stats</h2>
                    <canvas id="matches" width="200" height="150"></canvas>
                </div>
            </c:when>
            <c:when test="${team.statistics.goal_difference == 0 && team.statistics.goals == 0}">
                <div class="pull-right text-center stats">
                    <h2>Match Stats</h2>
                    <p style="margin-top: 30px">No stats recorded</p>
                </div>
            </c:when>
        </c:choose>
        
        <c:choose>
            <c:when test="${team.statistics.wins != 0 && team.statistics.defeats != 0}">    
                <div class="pull-right text-center stats">
                    <h2>Goal Stats</h2>
                    <canvas id="goals" width="200" height="150"></canvas>
                </div>
            </c:when>
            <c:when test="${team.statistics.goal_difference == 0 && team.statistics.goals == 0}">
                <div class="pull-right text-center stats">
                    <h2>Goal Stats</h2>
                    <p style="margin-top: 30px">No stats recorded</p>
                </div>
            </c:when>
        </c:choose>        
        
        <c:choose>
            <c:when test="${team.statistics.tournament_wins != 0 && team.statistics.tournament_participations != 0}">    
                <div class="pull-right text-center stats">
                    <h2>Tournament Stats</h2>
                    <canvas id="tournaments" width="200" height="150"></canvas>
                </div>
            </c:when>
            <c:when test="${team.statistics.tournament_wins == 0 && team.statistics.tournament_participations == 0}">
                <div class="pull-right text-center stats">
                    <h2>Tournament Stats</h2>
                    <p style="margin-top: 30px">No stats recorded</p>
                </div>
            </c:when>
        </c:choose>
    </div>    
        
 
</div>
        
<div class="row">
    <div class="col-md-12">
        <div class="pull-right need-help">
            <c:if test="${user.name == team.leader.name}">
                <a href="${pageContext.request.contextPath}/team/${team.name}/settings/profile" class="btn btn-leago"><i class="fa fa-pencil"></i> Team bearbeiten</a>
            </c:if>
        </div>
        <h2 class="page-header">Mitgleider von ${team.name}</h2>
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
    </div>
</div>    
        
<div class="row">       
    <div class="col-md-12">
        <h2 class="page-header">Turniere an denen ${team.name} teilnimmt</h2>
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
    </div>
</div>
        
        
<div class="row">
    <div class="col-lg-12">
    </div>
</div>                 
                                                
<script>
    // pie chart data
    var matchesData = [
        { value: ${team.statistics.matches}, color: "#6B69E0", label: "Matches"},
        { value: ${team.statistics.wins}, color: "#68C999", label: "Wins"},
        { value : ${team.statistics.defeats}, color : "#D66464", label: "Defeats" }
    ];
    // pie chart options
    var matchesOptions = {
         segmentShowStroke : false,
         animateScale : true
    }
    // get pie chart canvas
    var matches= document.getElementById("matches").getContext("2d");
    // draw pie chart
    new Chart(matches).Doughnut(matchesData, matchesOptions);
</script>
        
<script>
    // pie chart data
    var goalsData = [
        { value: ${team.statistics.goal_difference}, color: "#6B69E0", label: "Goal difference"},
        { value: ${team.statistics.goals}, color: "#68C999", label: "Goals"},
        { value: ${team.statistics.goals_conceded}, color : "#D66464", label: "Goals conceded" }
    ];
    
    // pie chart options
    var goalsOptions = {
         segmentShowStroke : false,
         animateScale : true
    }
    // get pie chart canvas
    var goals = document.getElementById("goals").getContext("2d");
    // draw pie chart
    new Chart(goals).Doughnut(goalsData, goalsOptions);
</script>
        
<script>
    // pie chart data
    var tournamentData = [
        { value: ${team.statistics.tournament_participations}, color: "#6B69E0", label: "Participations"},
        { value: ${team.statistics.tournament_wins}, color: "#568C999", label: "Wins"}
    ];
    
    // pie chart options
    var tournamentOptions = {
         segmentShowStroke : false,
         animateScale : true
    }
    // get pie chart canvas
    var tournaments = document.getElementById("tournaments").getContext("2d");
    // draw pie chart
    new Chart(tournaments).Doughnut(tournamentData, tournamentOptions);
</script>

