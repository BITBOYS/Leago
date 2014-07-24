<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row" style="padding-top: 50px;">

    <div class="col-md-3">
        <div class="list-group">
            <a href="${pageContext.request.contextPath}/team/${team.name}/settings/profile" class="list-group-item"><span class="fa fa-info"> </span> Teameinstellungen</a>
            <a href="${pageContext.request.contextPath}/team/${team.name}/settings/member" class="list-group-item"><span class="fa fa-users"> </span> Mitglieder</a>
            <a href="${pageContext.request.contextPath}/team/${team.name}/settings/tournaments" class="list-group-item active"><span class="fa fa-sitemap"> </span> Aktuelle Turniere</a>
        </div>
        <a href="${pageContext.request.contextPath}/team/${team.name}"><span class="fa fa-long-arrow-left"></span> zurück zum Teamprofil</a>
    </div>
            
    <div class="col-md-8 ">
        <!-- Default panel contents -->
        <div class="panel panel-default">
            <div class="panel-heading">Turniere</div>
            <ul class="list-group">
                <c:forEach var="tournament" items="${team.tournaments}">
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/tournament/${tournament.name}">${tournament.name}</a></li>
                </c:forEach>
            </ul>
        </div> <!-- /.panel--> 
    </div> <!-- /.grid 8 --> 
</div> <!-- /.row --> 