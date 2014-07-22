<div class="row" style="padding-top: 50px;">

    <div class="col-md-3">
        <div class="list-group">
            <a href="#" class="list-group-item active"><span class="glyphicon glyphicon-user"> </span> Namen &auml;ndern</a>
            <a href="#" class="list-group-item"><span class="fa fa-users"> </span> Passwort </a>
        </div>
    </div>

    <div class="col-md-8">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-sitemap"></i> Name &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="name_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/name" method="POST">

                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="input_name_new1">
                        </div>

                        <div class="form-group">
                            <label>Name wiederholen</label>
                            <input type="text" class="form-control" name="input_name_new2">
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Name aktualisieren</button>
                        </div>

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
            <div class="panel-heading"><i class="fa fa-lock"></i> Passwort &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="password_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/password" method="POST">

                        <div class="form-group">
                            <label>Altes Passwort</label>
                            <input type="password" class="form-control" name="input_password_old">
                        </div>

                        <div class="form-group">
                            <label>Neues Passwort</label>    
                            <input type="password" class="form-control" name="input_password_new1">
                        </div>

                        <div class="form-group">
                            <label>Passwort wiederholen</label>
                            <input type="password" class="form-control" name="input_password_new2">
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Passwort aktualisieren</button>
                        </div>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.grid 8 --> 

</div>


<div class="row">
    <div class="col-md-8 col-md-offset-3">

        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-lock"></i> Passwort &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <!-- Table -->
                    <table class="table">
                        <tbody>
                        <c:forEach items="${tournament.teams}" var="team">
                            <tr>
                                <td>
                                    <div class="col-md-9">
                                        <ul class="nav nav-pills">
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
                            </foreach>
                            <c:if test="${empty tournament.teams}">
                                <tr>
                                <p>Kein Teams im Turnier</p> 
                                </tr>
                                </if>
                                </tbody>
                                </table>
                                </div>
                                </div> <!-- /.panel-body --> 
                                </div> <!-- /.panel -->  
                                </div> <!-- /.col --> 

                                </div><!-- /.row --> 


                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">

                                        <div class="panel panel-default">
                                            <!-- Default panel contents -->
                                            <div class="panel-heading"><i class="fa fa-lock"></i> Leader &auml;ndern</div>
                                            <div class="panel-body">
                                                <div class="col-xs-8">
                                                    <form role="form" name="leader_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/leader" method="POST">

                                                        <div class="form-group">
                                                            <label class="control-label">Dein User Passwort</label>
                                                            <input type="password" class="form-control" name="account_password" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <input list="leaderAuswahl" name="leader_new" class="form-control" autocomplete="off" required>
                                                            <datalist id="userAuswahl">
                                                                <c:forEach items="${tournament.teams}" var="team">
                                                                    <option value="${team.leader.name}"> 
                                                                </c:forEach>
                                                            </datalist>
                                                        </div>

                                                        <div class="form-group">
                                                            <button class="btn btn-primary btn-leago" type="submit">Leader aktualisieren</button>
                                                        </div>

                                                    </form>
                                                </div>
                                            </div> <!-- /.panel-body --> 
                                        </div> <!-- /.panel -->  
                                    </div> <!-- /.col --> 

                                </div><!-- /.row --> 



                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">

                                        <div class="panel panel-default">
                                            <!-- Default panel contents -->
                                            <div class="panel-heading"><i class="fa fa-lock"></i> Beschreibung &auml;ndern</div>
                                            <div class="panel-body">
                                                <div class="col-xs-8">
                                                    <form role="form" name="description_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/description" method="POST">

                                                        <div class="form-group">
                                                            <label>Beschreibung</label>
                                                            <textarea style="width:100%" rows="10" class="form-control" name="description_new" placeholder="'${tournament.description}'" maxlength="255"></textarea>
                                                        </div>

                                                        <div class="form-group">
                                                            <button class="btn btn-primary btn-leago" type="submit">Beschreibung aktualisieren</button>
                                                        </div>

                                                    </form>
                                                </div>
                                            </div> <!-- /.panel-body --> 
                                        </div> <!-- /.panel -->  
                                    </div> <!-- /.grid 8 --> 

                                </div>


                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">

                                        <div class="panel panel-default">
                                            <!-- Default panel contents -->
                                            <div class="panel-heading"><i class="fa fa-lock"></i> Austragungsort &auml;ndern</div>
                                            <div class="panel-body">
                                                <div class="col-xs-8">
                                                    <form role="form" name="password_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/venue" method="POST">

                                                        <div class="form-group">
                                                            <label>Ort</label>
                                                            <input type="text" class="form-control" name="input_venue_new" placeholder="'${tournamet.venue}'">
                                                        </div>

                                                        <div class="form-group">
                                                            <button class="btn btn-primary btn-leago" type="submit">Austragunsort aktualisieren</button>
                                                        </div>

                                                    </form>
                                                </div>
                                            </div> <!-- /.panel-body --> 
                                        </div> <!-- /.panel -->  
                                    </div> <!-- /.col --> 

                                </div><!-- /.row -->


                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">

                                        <div class="panel panel-default">
                                            <!-- Default panel contents -->
                                            <div class="panel-heading"><i class="fa fa-lock"></i> Spieltage &auml;ndern</div>
                                            <div class="panel-body">
                                                <div class="col-xs-8">
                                                    <form role="form" name="password_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/matchdays" method="POST">

                                                        <div class="form-group">
                                                            <label>Spieltage</label>
                                                            <input type="number" min="0" class="form-control" name="input_nr_matchdays_new" placeholder="${tournamet.nr_matchdays} Spieltage">
                                                        </div>

                                                        <div class="form-group">
                                                            <button class="btn btn-primary btn-leago" type="submit">Spieltage aktualisieren</button>
                                                        </div>

                                                    </form>
                                                </div>
                                            </div> <!-- /.panel-body --> 
                                        </div> <!-- /.panel -->  
                                    </div> <!-- /.col --> 

                                </div><!-- /.row -->


                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">

                                        <div class="panel panel-default">
                                            <!-- Default panel contents -->
                                            <div class="panel-heading"><i class="fa fa-lock"></i> Zeiten &auml;ndern</div>
                                            <div class="panel-body">
                                                <div class="col-xs-8">
                                                    <form role="form" name="password_form" action="${pageContext.request.contextPath}/${tournamet.name}/settings/password" method="POST">

                                                        <div class="form-group">

                                                        </div>

                                                        <div class="form-group">
                                                            <button class="btn btn-primary btn-leago" type="submit">Spieltage aktualisieren</button>
                                                        </div>

                                                    </form>
                                                </div>
                                            </div> <!-- /.panel-body --> 
                                        </div> <!-- /.panel -->  
                                    </div> <!-- /.col --> 

                                </div><!-- /.row -->