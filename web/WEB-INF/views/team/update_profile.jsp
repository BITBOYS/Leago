<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">

    <div class="col-md-3">
        <div class="list-group">
            <a href="${pageContext.request.contextPath}/team/${team.name}/settings/profile" class="list-group-item active"><span class="fa fa-info"> </span> Teameinstellungen</a>
            <a href="${pageContext.request.contextPath}/team/${team.name}/settings/member" class="list-group-item"><span class="fa fa-users"> </span> Mitglieder</a>
            <a href="${pageContext.request.contextPath}/team/${team.name}/settings/tournaments" class="list-group-item"><span class="fa fa-sitemap"> </span> Aktuelle Turniere</a>
        </div>
        <a href="${pageContext.request.contextPath}/team/${team.name}"><span class="fa fa-long-arrow-left"></span> zurück zum Teamprofil</a>
    </div>
    
   
    <div class="col-md-8">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-info-circle"></i> Name &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="name_form" action="${pageContext.request.contextPath}/team/${team.name}/settings/profile" method="POST">

                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="input_name_new1">
                        </div>

                        <div class="form-group">
                            <label>Name wiederholen</label>
                            <input type="text" class="form-control" name="input_name_new2">
                        </div>

                        <button class="btn btn-primary btn-leago" type="submit">Name aktualisieren</button>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel --> 
    </div> <!-- /.grid 12 -->

</div> 

<div class="row">
    <div class="col-md-8 col-md-offset-3">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-tag"></i> Tag &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                
                    <form role="form" name="tag_form" action="${pageContext.request.contextPath}/team/${team.name}/settings/profile" method="POST">

                        <div class="form-group">
                            <label>Tag</label>
                            <input type="text" class="form-control" name="input_tag_new1" required>
                        </div>

                        <div class="form-group">
                            <label>Tag wiederholen</label>
                            <input type="text" class="form-control" name="input_tag_new2" required>
                        </div>

                        <button class="btn btn-primary btn-leago" type="submit">Tag aktualisieren</button>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel --> 
    </div> <!-- /.grid 8 --> 
</div>
                    
            
<div class="row">
    <div class="col-md-8 col-md-offset-3">
        <!-- Default panel contents -->
        <div class="panel panel-danger">
            <div class="panel-heading"><span class="fa fa-trash-o"></span> Danger Zone</div>
            <ul class="list-group">
                <li class="list-group-item ">
                    <h5><b>Besitzer ändern</b></h5>
                    <p>&Uuml;bergibt die Besitzerrechte an einen anderen User, der bereits Mitglied des Teams ist.</p>    

                    <form role="form" name="leader_form" action="${pageContext.request.contextPath}/team/${team.name}/settings/profile" method="POST">
                        <div class="form-group 8">
                            <select class="form-control" name="input_leader_new">
                                <c:forEach var="member" items="${team.member}">
                                    <option>${member.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        

                        <button class="btn btn-primary btn-danger" type="submit">Besitzer &auml;ndern</button>

                    </form>
                </li>
                <li class="list-group-item">
                    <h5><b>Team löschen</b></h5>
                    <p>Das L&ouml;schen des Teams kann <b>nicht</b> r&uuml;ckg&auml;ngig gemacht werden!</p>    
                    <a class="btn btn-primary btn-danger" href="${pageContext.request.contextPath}/team/${team.name}/settings/delete">"${team.name}" l&ouml;schen</a> 
                </li>
              </ul>
        </div> <!-- /.panel-->
    </div> <!-- /.grid 8 -->
</div>