<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row" style="padding-top: 50px;">

    <div class="col-md-3">
        <div class="list-group">
            <a href="${pageContext.request.contextPath}/team/${team.name}/settings/profile" class="list-group-item"><span class="fa fa-info"> </span> Teameinstellungen</a>
            <a href="${pageContext.request.contextPath}/team/${team.name}/settings/member" class="list-group-item active"><span class="fa fa-users"> </span> Mitglieder</a>
            <a href="${pageContext.request.contextPath}/team/${team.name}/settings/tournaments" class="list-group-item"><span class="fa fa-sitemap"> </span> Aktuelle Turniere</a>
        </div>
        <a href="${pageContext.request.contextPath}/team/${team.name}"><span class="fa fa-long-arrow-left"></span> zurück zum Teamprofil</a>
    </div>
            
    <c:forEach var="member" items="${team.member}" varStatus="loop">
        <c:if test="${member.name != team.leader.name}">
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
                            <div class="panel-heading"><span class="glyphicon glyphicon-remove"></span> User aus dem Team entfernen</div>
                            <div class="panel-body">
                                <div class="col-xs-12">
                                    <p><b><a href="${pageContext.request.contextPath}/user/${member.name}">${member.name}</a></b> aus 
                                    <b><a href="${pageContext.request.contextPath}/team/${team.name}">${team.name}</a></b> entfernen</p>
                                    <p>Der User kann nur per neuer Einladung wieder in das Team eintreten.</p>
                                    <form role="form" name="leave_${team.name}" method="post" action="${pageContext.request.contextPath}/team/${team.name}/settings/member">
                                        <input type="hidden" name="action" value="kick">
                                        <input type="hidden" name="member" value="${loop.index}">
                                        <button type="submit" class="btn btn-primary btn-danger">${member.name} entfernen</button>
                                    </form>
                                </div>
                            </div>
                        </div> <!-- /.panel--> 
                    </div> <!-- /.grid 8 --> 
        </c:if>
    </c:forEach>
    <c:if test="${fn:length(team.member) eq 1}">
        <div class="col-md-8 ">
            Es kann kein Mitglied entfernt werden.
        </div>
    </c:if>
</div>