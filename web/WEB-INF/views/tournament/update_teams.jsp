<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row">
    <%@include file="link_list.jsp" %>

    <div class="col-md-8 ">
        <!-- Default panel contents -->
        <div class="panel panel-default">
            <div class="panel-heading"><span class="glyphicon glyphicon-plus"></span> Teams ins Turnier einladen</div>
            <div class="panel-body">

                <p>Lade ein Team ein, Mitglied in deinem Turnier zu werden. Der Leader wird im Anschluss benachrichtigt und kann die Einladung akzeptieren.</p> 

                <form role="form" name="invite_${tournament.name}" action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/teams" method="POST">
                    <input type="hidden" name="action" value="invite">

                    <div class="form-group">
                        <label>Team</label>
                        <input type="text" class="form-control" name="new_team" required>
                    </div>

                    <button class="btn btn-primary btn-leago" type="submit">Team einladen</button>
                </form>
            </div>
        </div> <!-- /.panel--> 
    </div> <!-- /.grid 8 -->

    <c:choose>
        <c:when test="${empty tournament.teams}">
            <div class="col-md-8 ">
                <blockquote>
                    <h2>Es ist kein Team im Turnier vorhanden</h2>                    
                </blockquote>
            </div>
        </c:when>
        <c:otherwise>

            <div class="col-md-8 ">
                <!-- Default panel contents -->
                <div class="panel panel-danger">
                    <div class="panel-heading"><span class="glyphicon glyphicon-remove"></span> Team aus dem Turnier '${tournament.name}' entfernen</div>
                    <ul class="list-group">
                        <c:forEach items="${tournament.teams}" var="team" varStatus="loop">
                            <li class="list-group-item">
                                <p>Entferne <a href="${pageContext.request.contextPath}/team/${team.name}">${team.name}</a> aus dem Turnier. Das Team kann nur per neuer Einladung wieder am Turnier teilnehmen.</p>
                                <form role="form" name="leave_${team.name}" method="post" action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/teams">
                                    <input type="hidden" name="action" value="kick">
                                    <input type="hidden" name="team" value="${loop.index}">
                                    <button type="submit" class="btn btn-primary btn-danger">${team.name} entfernen</button>
                                </form>
                            </li>
                        </c:forEach>
                    </ul>
                </div> <!-- /.panel--> 
            </div>

        </c:otherwise>
    </c:choose>

</div>