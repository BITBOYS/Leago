<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row" style="padding-top: 50px;">
    <div class="col-md-12">
        <h1 class="page-header">Danger Zone <small>Achtung, nach dem l&ouml;schen von '${profileuser.name}' kann das Turnier nicht wieder hergestellt werden!</small></h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/${tournament.name}">${tournament.name}</a></li>
            <li class="active">Settings/Danger Zone</li>
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
            <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/team" class="list-group-item">
                <h4><span class="fa fa-users"></span> Teams settings</h4> 
                <p class="list-group-item-text">Kick od add individual Teams</p>
            </a>
            <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/danger" class="list-group-item active"> 
                <h4 class="list-group-item-heading"><span class="fa fa-exclamation-triangle"></span> Danger zone</h4> 
                <p class="list-group-item-text">Delete the tournament ${tournament.name}</p>
            </a>
        </div>
    </div>

    <div class="col-md-8">
        <!-- Default panel contents -->
        <div class="panel panel-danger">
            <div class="panel-heading"><span class="fa fa-trash-o"></span> Account l&ouml;schen</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <p>Das L&ouml;schen des Accounts kann <b>nicht</b> r&uuml;ckg&auml;ngig gemacht werden!</p>
                    <a class="btn btn-primary btn-danger" href="${pageContext.request.contextPath}/settings/delete">Deinen Account l&ouml;schen</a>
                </div>
            </div>
        </div> <!-- /.panel--> 
    </div> <!-- /.grid 8 --> 
</div> <!-- /.row --> 
