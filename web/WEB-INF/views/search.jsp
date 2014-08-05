<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="${pageContext.request.contextPath}/resources/js/active_toggle.js"></script>

<div class="row">

    <div class="col-md-3">
        <div class="list-group" id="searchList">
            <a onclick="changeClass('link_user')" id="link_user" href="#user" class="list-group-item active" data-toggle="tab">
                <span class="glyphicon glyphicon-user"></span> Benutzer <span class="badge">${fn:length(user_found)}</span>
            </a>
            
            <a onclick="changeClass('link_teams')" id="link_teams" href="#teams" class="list-group-item" data-toggle="tab">
                <span class="fa fa-users"></span> Teams <span class="badge">${fn:length(teams_found)}</span>
            </a>
            
            <a onclick="changeClass('link_tournaments')" id="link_tournaments" href="#tournaments" class="list-group-item" data-toggle="tab">
                <span class="fa fa-sitemap"></span> Turniere <span class="badge">${fn:length(tournaments_found)}</span>
            </a>
        </div>
    </div>
            
            
            
   <div id="searchListContent" class="tab-content">
       
        <div class="fade in active search-tab" id="user">
            <div class="col-md-8">
                <c:forEach var="user_entry" items="${user_found}" >
                    <h3><a href="${pageContext.request.contextPath}/user/${user_entry.name}">${user_entry.name}</a></h3>
                    <hr>
                </c:forEach>
                    
                <c:if test="${fn:length(user_found) == 0}">
                    <div class="well">
                        Es wurden keine zu "${parameter}" passenden Benutzer gefunden.
                    </div>
                </c:if>
            </div> <!-- /.grid 8 -->
        </div>
       
        <div class="fade search-tab" id="teams">
            <div class="col-md-8">
                <c:forEach var="team_entry" items="${teams_found}" >
                    <h3><a href="${pageContext.request.contextPath}/team/${team_entry.name}">${team_entry.name}</a></h3>
                    <hr>
                </c:forEach>
                    
                <c:if test="${fn:length(teams_found) == 0}">
                    <div class="well">
                        Es wurden keine zu "${parameter}" passenden Teams gefunden.
                    </div>
                </c:if>
            </div> <!-- /.grid 8 -->
        </div>
       
        <div class="fade search-tab" id="tournaments">
            <div class="col-md-7">
                <c:forEach var="tournament_entry" items="${tournaments_found}" >
                    <h3><a href="${pageContext.request.contextPath}/tournament/${tournament_entry.name}">${tournament_entry.name}</a></h3>
                    <p>${tournament_entry.description}</p>
                    <hr>
                </c:forEach>
                    
                <c:if test="${fn:length(tournaments_found) == 0}">
                    <div class="well">
                        Es wurden keine zu "${parameter}" passenden Turniere gefunden.
                    </div>
                </c:if>
            </div> <!-- /.grid 8 -->
        </div>
                            
   </div>

</div>