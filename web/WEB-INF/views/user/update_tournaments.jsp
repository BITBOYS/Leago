<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">

    <div class="col-md-3">
        <div class="list-group">
            <a href="${pageContext.request.contextPath}/settings/profile" class="list-group-item"><span class="glyphicon glyphicon-user"> </span> Accounteinstellungen</a>
            <a href="${pageContext.request.contextPath}/settings/teams" class="list-group-item"><span class="fa fa-users"> </span> Meine Teams</a>
            <a href="${pageContext.request.contextPath}/settings/tournaments" class="list-group-item active"><span class="fa fa-sitemap"> </span> Meine Turniere</a>
        </div>
    </div>
            
    <div class="col-md-8 ">
        <!-- Default panel contents -->
        <div class="panel panel-default">
            <div class="panel-heading">Turniere</div>
            <ul class="list-group">
                <c:forEach var="tournament" items="${user.tournaments}">
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/tournament/${tournament.name}">${tournament.name}</a></li>
                </c:forEach>
            </ul>
        </div> <!-- /.panel--> 
    </div> <!-- /.grid 8 --> 
</div> <!-- /.row --> 