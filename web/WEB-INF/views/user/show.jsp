<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            
<div class="row">
    <div class="col-md-2">
        <h2>${profileuser.name}</h2>
        <img src="http://placehold.it/150x150">
    </div>

    <div class="col-md-4">
        <p style="margin-top: 50px;">Mitglied seit ${profileuser.create_date_web}</p>
    </div>
    
    <div class="col-md-6">
        <c:choose>
            <c:when test="${profileuser.statistics.goal_difference != 0 && profileuser.statistics.goals != 0}">    
                <div class="pull-right text-center stats">
                    <h2>Match Stats</h2>
                    <canvas id="matches" width="200" height="150"></canvas>
                </div>
            </c:when>
            <c:when test="${profileuser.statistics.goal_difference == 0 && profileuser.statistics.goals == 0}">
                <div class="pull-right text-center stats">
                    <h2>Match Stats</h2>
                    <p style="margin-top: 30px">No stats recorded</p>
                </div>
            </c:when>
        </c:choose>

        <c:choose>
            <c:when test="${profileuser.statistics.wins != 0 && profileuser.statistics.defeats != 0}">    
                <div class="pull-right text-center stats">
                    <h2>Goal Stats</h2>
                    <canvas id="goals" width="200" height="150"></canvas>
                </div>
            </c:when>
            <c:when test="${profileuser.statistics.goal_difference == 0 && profileuser.statistics.goals == 0}">
                <div class="pull-right text-center stats">
                    <h2>Goal Stats</h2>
                    <p style="margin-top: 30px">No stats recorded</p>
                </div>
            </c:when>
        </c:choose>        
    </div>
    


    
</div>

<div class="row">
    <div class="col-md-12">
        <h2 class="page-header">Teams in denen ${profileuser.name} Mitglied ist</h2>
        <!-- Schleife zum Anzeigen aller Teams in denen man sich befindet -->
        <c:forEach var="team" items="${profileuser.teams}">
            <div class="col-md-2" style="margin: 0 0 20px -15px;">
                <a href="${pageContext.request.contextPath}/team/${team.name}">
                    <div class="caption">
                        <h4>${team.name}</h4>  
                        <p><i class="fa fa-group fa-4x"></i></p>  
                    </div>
                </a>
            </div>
        </c:forEach> <!-- /.forEach teams -->
    </div>
</div>   

<div class="row">       
    <div class="col-md-12">
        <h2 class="page-header">Turniere an denen ${profileuser.name} teilnimmt</h2>
        <!-- Schleife zum Anzeigen aller Teams in denen man sich befindet -->
        <c:forEach var="tournament" items="${profileuser.tournaments}">
            <div class="col-md-3" style="margin: 0 0 20px -15px;">
                <a href="${pageContext.request.contextPath}/tournament/${tournament.name}">
                    <div class="caption">  
                        <h4>${tournament.name}</h4>  
                        <p><i class="fa fa-trophy fa-4x"></i></p>  
                    </div>
                </a>
            </div>
        </c:forEach> <!-- /.forEach teams -->
    </div>
</div>
                    
<script>
    // pie chart data
    var matchesData = [
        { value: ${profileuser.statistics.matches}, color: "#6B69E0", label: "Matches"},
        { value: ${profileuser.statistics.wins}, color: "#68C999", label: "Wins"},
        { value : ${profileuser.statistics.defeats}, color : "#D66464", label: "Defeats" }
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
        { value: ${profileuser.statistics.goal_difference}, color: "#6B69E0", label: "Goal difference"},
        { value: ${profileuser.statistics.goals}, color: "#68C999", label: "Goals"},
        { value : ${profileuser.statistics.goals_conceded}, color : "#D66464", label: "Goals conceded" }
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