<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="leago.i18n.bundle" />


<div class="row">
    <div class="col-md-4 text-center">
        <h2><b>${profileuser.name}</b></h2>
        <p><fmt:message key="user.info.member_since"/> ${profileuser.create_date_web}</p>
        <img src="http://placehold.it/250x150">
        <hr>
    </div>

    <div class="col-md-4 text-center">
        <h2><fmt:message key="user.stats.match"/></h2>
        <c:choose>
            <c:when test="${profileuser.statistics.goal_difference != 0 && profileuser.statistics.goals != 0}">    
                <br>
                <div class="stats" style="margin-left: auto; margin-right: auto">
                    <canvas id="matches"  width="200" height="150"></canvas>
                </div>
            </c:when>
            <c:when test="${profileuser.statistics.goal_difference == 0 && profileuser.statistics.goals == 0}">
                <p style="margin-top: 30px; margin-left: auto; margin-right: auto"><fmt:message key="user.stats.no"/></p>
            </c:when>
        </c:choose>
        <hr>
    </div>

    <div class="col-md-4 text-center">
        <h2><fmt:message key="user.stats.goal"/></h2>
        <c:choose>
            <c:when test="${profileuser.statistics.wins != 0 && profileuser.statistics.defeats != 0}">    
                <br>
                <div class="stats" style="margin-left: auto; margin-right: auto">
                    <canvas id="goals" width="200" height="150"></canvas>
                </div>
            </c:when>
            <c:when test="${profileuser.statistics.goal_difference == 0 && profileuser.statistics.goals == 0}">
                <p style="margin-top: 30px; margin-left: auto; margin-right: auto"><fmt:message key="user.stats.no"/></p>
            </c:when>
        </c:choose>   
        <hr>
    </div>
</div>


<div class="row">
    <div class="col-md-12">
        <h2 class="page-header"><fmt:message key="user.info.teams1"/> ${profileuser.name} <fmt:message key="user.info.teams2"/></h2>
        <c:choose>
            <c:when test="${!empty profileuser.teams}">    
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
            </c:when>
            <c:otherwise>
                <p style="margin-top: 30px; margin-left: auto; margin-right: auto"><fmt:message key="user.teams.no"/></p>
            </c:otherwise>
        </c:choose>
    </div>
</div>   

<div class="row">       
    <div class="col-md-12">
        <h2 class="page-header"><fmt:message key="user.info.tournaments1"/> ${profileuser.name} <fmt:message key="user.info.tournaments2"/></h2>
        <c:choose>
            <c:when test="${!empty profileuser.tournaments}">
                <!-- Schleife zum Anzeigen aller Teams in denen man sich befindet -->
                <c:forEach var="tournament" items="${profileuser.tournaments}">
                    <div class="col-md-2" style="margin: 0 0 20px -15px;">
                        <a href="${pageContext.request.contextPath}/tournament/${tournament.name}">
                            <div class="caption">  
                                <h4>${tournament.name}</h4>  
                                <p><i class="fa fa-trophy fa-4x"></i></p>  
                            </div>
                        </a>
                    </div>
                </c:forEach> <!-- /.forEach teams -->
            </c:when>
            <c:otherwise>
                <p style="margin-top: 30px; margin-left: auto; margin-right: auto"><fmt:message key="user.tournaments.no"/></p>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    // pie chart data
    var matchesData = [
        {value: ${profileuser.statistics.matches}, color: "#2271BB", label: "<fmt:message key="user.stats.matches"/>"},
        {value: ${profileuser.statistics.wins}, color: "#68C999", label: "<fmt:message key="user.stats.wins"/>"},
        {value: ${profileuser.statistics.defeats}, color: "#D66464", label: "<fmt:message key="user.stats.defeats"/>"}
    ];
    // pie chart options
    var matchesOptions = {
        segmentShowStroke: false,
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
        {value: ${profileuser.statistics.goal_difference}, color: "#2271BB", label: "<fmt:message key="user.stats.goal_difference"/>"},
        {value: ${profileuser.statistics.goals}, color: "#68C999", label: "<fmt:message key="user.stats.goals"/>"},
        {value: ${profileuser.statistics.goals_conceded}, color: "#D66464", label: "<fmt:message key="user.stats.goals_conceded"/>"}
    ];

    // pie chart options
    var goalsOptions = {
        segmentShowStroke: false,
        animateScale: true
    }
    // get pie chart canvas
    var goals = document.getElementById("goals").getContext("2d");
    // draw pie chart
    new Chart(goals).Doughnut(goalsData, goalsOptions);
</script>