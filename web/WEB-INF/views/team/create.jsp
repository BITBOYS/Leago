<div class="row">
    <div class="col-md-8">
        <h1 class="page-header">Team erstellen <small>Erstelle Teams und lade Freunde ein!</small></h1>
    </div>
</div><!-- /.row -->


<div class="row"> 
    <div class="col-md-8 col-md-offset-2">

        
        <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/new/team/create" method="post">
                <div class="form-group">
                    <label for="inputTeamname" class="col-sm-3 control-label">Name*</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="name" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputTurniername" class="col-sm-3 control-label">Tag*</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="tag" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputUsername" class="col-sm-3 control-label">Passwort</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="password" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputUsername" class="col-sm-3 control-label">Passwort wiederholen</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="reenter_password">
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-7 col-sm-offset-3">
                        <small>* Pflichtfeld das ausgefüllt werden muss</small>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-7 col-sm-offset-3">
                        <button type="submit" class="btn btn-leago"><span class="fa fa-pencil"></span> Erstellen <i class="fa fa-angle-right"></i></button>
                    </div>
                </div>
        </form>
    </div>
</div>
