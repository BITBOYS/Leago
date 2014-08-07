<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <%@include file="link_list.jsp" %>

    <div class="col-md-8">

        <div class="panel panel-danger">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-user"></i> Leader &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="leader_form" action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/danger" method="POST">

                        <div class="form-group">
                            <label class="control-label">Neuer Leader</label>
                            <p>&Uuml;bergibt die Besitzerrechte an einen anderen User, der bereits Leader eines Turnier-Teams ist.</p> 

                            <select class="form-control" name="input_leader_new">
                                <c:forEach var="team" items="${tournament.teams}">
                                    <option>${team.leader.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-danger" type="submit">Leader aktualisieren</button>
                        </div>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.col --> 

    <div class="col-md-8">
        <!-- Default panel contents -->
        <div class="panel panel-danger">
            <div class="panel-heading"><span class="fa fa-trash-o"></span> Turnier l&ouml;schen</div>
            <div class="panel-body">
                <div class="col-xs-12">
                    <p>Das L&ouml;schen des Turniers kann <b>nicht</b> r&uuml;ckg&auml;ngig gemacht werden!</p> 
                    <p>Alle Statistiken gehen <b>unwiderruflich</b> verloren!</p>
                    <a class="btn btn-primary btn-danger" href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/delete">"${tournament.name}" l&ouml;schen</a> 
                </div>
            </div>
        </div> <!-- /.panel--> 
    </div> <!-- /.grid 8 --> 
</div> <!-- /.row --> 
