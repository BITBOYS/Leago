<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row" style="padding-top: 50px;">
    <div class="col-md-12">
        <h1 class="page-header">Turnier Member Settings <small>Einstellungnen zu ${profileuser.name}</small></h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/${tournament.name}">${tournament.name}</a></li>
            <li class="active">Settings/Tournament/Teams</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-md-4">
        <div class="list-group">
            <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/tournament" class="list-group-item">
                <h4><span class="fa fa-sitemap"></span> Tournament settings</h4>
                <p class="list-group-item-text">Change the Tournament values</p>
            </a>
            <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/team" class="list-group-item active">
                <h4><span class="fa fa-users"></span> Teams settings</h4> 
                <p class="list-group-item-text">Kick od add individual Teams</p>
            </a>
            <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/danger" class="list-group-item"> 
                <h4 class="list-group-item-heading"><span class="fa fa-exclamation-triangle"></span> Danger zone</h4> 
                <p class="list-group-item-text">Delete the tournament ${tournament.name}</p>
            </a>
        </div>
    </div>

    <div class="col-md-8">

        <div class="panel panel-danger">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-trash-o"></i> Teams entfernen</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <!-- Table -->
                    <table class="table">
                        <tbody>
                            <c:choose>
                                <c:when test="${empty tournament.teams}">
                                    <tr>
                                <p>Kein Teams im Turnier</p> 
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${tournament.teams}" var="team">
                                    <tr>
                                        <td>
                                            <div class="col-md-9">
                                                <ul class="nav nav-pills">
                                                    <p>Das L&ouml;schen des Turniers kann <b>nicht</b> r&uuml;ckg&auml;ngig gemacht werden!</p>
                                                    <li class="caption"><a href="${pageContext.request.contextPath}/team?team=${team.name}">${team.name}</a> 
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-3">
                                                <form method="post" action="${pageContext.request.contextPath}/team?action=kick" id="${team.name}">
                                                    <input type="text" value="${team.name}" name="kick_team" style="display:none">
                                                    <a onclick="document.getElementById('${team.name}').submit();" class="btn btn-danger btn-leago">Entfernen <i class="fa fa-angle-right"></i></a>
                                                </form>
                                            </div>
                                        </td> 
                                    </tr>  
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.col --> 
</div>

</div><!-- /.row --> 