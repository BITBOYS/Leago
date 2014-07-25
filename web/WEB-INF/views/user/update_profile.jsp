<div class="row">

    <div class="col-md-3">
        <div class="list-group">
            <a href="${pageContext.request.contextPath}/settings/profile" class="list-group-item active"><span class="glyphicon glyphicon-user"> </span> Accounteinstellungen</a>
            <a href="${pageContext.request.contextPath}/settings/teams" class="list-group-item"><span class="fa fa-users"> </span> Meine Teams</a>
            <a href="${pageContext.request.contextPath}/settings/tournaments" class="list-group-item"><span class="fa fa-sitemap"> </span> Meine Turniere</a>
        </div>
    </div>
    
   
    <div class="col-md-8">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-user"></i> Name &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="name_form" action="${pageContext.request.contextPath}/settings/profile" method="POST">

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
            <div class="panel-heading"><i class="fa fa-envelope-o"></i> E-Mail &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                
                    <form role="form" name="email_form" action="${pageContext.request.contextPath}/settings/profile" method="POST">

                        <div class="form-group">
                            <label>E-Mail</label>
                            <input type="email" class="form-control" name="input_email_new1" required>
                        </div>

                        <div class="form-group">
                            <label>E-Mail wiederholen</label>
                            <input type="email" class="form-control" name="input_email_new2" required>
                        </div>

                        <button class="btn btn-primary btn-leago" type="submit">E-Mail aktualisieren</button>

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
                    <form role="form" name="password_form" action="${pageContext.request.contextPath}/settings/profile" method="POST">

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

                        <button class="btn btn-primary btn-leago" type="submit">Passwort aktualisieren</button>

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
            <div class="panel-heading"><span class="fa fa-trash-o"></span> Account l&ouml;schen</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <p>Das L&ouml;schen des Accounts kann <b>nicht</b> r&uuml;ckg&auml;ngig gemacht werden!</p>
                    <a class="btn btn-primary btn-danger" href="${pageContext.request.contextPath}/settings/delete">Deinen Account l&ouml;schen</a>
                </div>
            </div>
        </div> <!-- /.panel--> 
    </div> <!-- /.grid 8 --> 
</div>