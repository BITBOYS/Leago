<div class="row">

    <div class="col-lg-12">
        <h1 class="page-header">Login <small>Hier einloggen!</small></h1>
    </div>

    <div align="center" class="col-sm-6 col-md-4 col-md-offset-4 thumbnail">  
        <form class="form" action="${pageContext.request.contextPath}/login" method="post" role="form">
            <input type="hidden" name="action" value="create">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Username" name="id" required autofocus>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Password" name="password" required>
            </div>
            <div class="form-group">
                <a href="#" class="pull-right need-help">Passwort vergessen? </a><span class="clearfix"></span>
            </div>
            <div class="form-group">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Log me in!</button>
            </div>
        </form>
        <a href="#" class="pull-right need-help">Brauchst du Hilfe? </a><span class="clearfix"></span>
        <hr>
        <p class="text-center">New to Leago? <b><a href="#">Sign up! </a></b></p>
    </div>

</div><!-- /.row -->