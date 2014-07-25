<div class="row" style="padding-top: 80px;">

    <div align="center" class="col-sm-6 col-md-4 col-md-offset-4"> 
        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><h2>Sign Up <small> Zum Turniererfolg mit Leago!</small></h2></div>
            <div class="panel-body">
                <form action="${pageContext.request.contextPath}/register/create" method="post" class="form" role="form">

                    <div class="form-group">
                        <input class="form-control" name="name" placeholder="Name" type="text" required autofocus />
                    </div>
                    <div class="form-group">
                        <input class="form-control" name="email" placeholder="Email" type="email" required/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" name="password" placeholder="Password" type="password" required/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" name="reenter_password" placeholder="Re-enter Password" type="password" required/>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-lg btn-leago btn-block" type="submit">Sign me up!</button>
                    </div>
                </form>
                <a href="${pageContext.request.contextPath}/faq" class="pull-right need-help">Do you need help? </a><span class="clearfix"></span>
                <hr>
                <p class="text-center">Have an account? <b><a href="${pageContext.request.contextPath}/login" class="text-center new-account">Log in!</a></b></p>
            </div>
        </div>
    </div>
</div><!-- /.row -->