<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">

    <div class="col-md-3">
        <div class="list-group">
            <a href="${pageContext.request.contextPath}/settings/profile" class="list-group-item"><span class="glyphicon glyphicon-user"> </span> Accounteinstellungen</a>
            <a href="${pageContext.request.contextPath}/settings/teams" class="list-group-item active"><span class="fa fa-users"> </span> Meine Teams</a>
            <a href="${pageContext.request.contextPath}/settings/tournaments" class="list-group-item"><span class="fa fa-sitemap"> </span> Meine Turniere</a>
        </div>
    </div>
            
    <c:forEach var="team" items="${user.teams}" varStatus="loop">
        <c:choose>
            <c:when test="${loop.index == 0}">
                <div class="col-md-8 ">
            </c:when>
            <c:when test="${loop.index > 0}">  
                <div class="col-md-8 col-md-offset-3">
            </c:when>
        </c:choose> 
                    <!-- Default panel contents -->
                    <div class="panel panel-default">
                        <div class="panel-heading"><span class="glyphicon glyphicon-remove"></span> Team verlassen</div>
                        <div class="panel-body">
                            <div class="col-xs-12">
                                <p>Austreten aus dem Team: <b><a href="${pageContext.request.contextPath}/team/${team.name}">${team.name}</a></b></p>
                                <p>Das Austreten aus dem Team kann <b>nicht</b> r&uuml;ckg&auml;ngig gemacht werden!</p>
                                <c:choose>
                                    <c:when test="${user.name == team.leader.name}">
                                            <button class="btn btn-primary btn-danger" disabled>${team.name} verlassen</button>
                                            <i class="fa fa-exclamation-triangle"></i> Du kannst das Team nicht verlassen, solange du der Teamleiter bist!
                                    </c:when>
                                    <c:when test="${user.name != team.leader.name}">
                                        <form role="form" name="leave_${team.name}" method="post" action="${pageContext.request.contextPath}/settings/teams">
                                            <input type="hidden" name="action" value="exit">
                                            <input type="hidden" name="team" value="${loop.index}">
                                            <button type="submit" class="btn btn-primary btn-danger">${team.name} verlassen</button>
                                        </form>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div> <!-- /.panel--> 
                </div> <!-- /.grid 8 --> 
    </c:forEach>
</div>