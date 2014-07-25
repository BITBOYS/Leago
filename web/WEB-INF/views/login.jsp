<div class="row" style="padding-top: 80px;">

    <div align="center" class="col-sm-6 col-md-4 col-md-offset-4"> 
        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><h2> Login <small> Hier einloggen!</small></h2></div>
            <div class="panel-body">
                <form class="form" action="${pageContext.request.contextPath}/login" method="post" role="form">
                    <input type="hidden" name="action" value="create">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Username" name="id" required autofocus>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Password" name="password" required>
                    </div>
                    <div class="form-group">
                        <!-- modal caller -->
                        <a href="#modal-dialog-user" data-toggle="modal" data-modal-title="Reset Password" data-modal-text="Enter your email" data-modal-confirm-url="#" data-modal-type="confirm" class="model-toggle pull-right need-help">Forgot password? </a><span class="clearfix"></span>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-lg btn-leago btn-block" type="submit">Log me in!</button>
                    </div>
                </form>
                <a href="${pageContext.request.contextPath}/faq.jsp" class="pull-right need-help">Do you need help? </a><span class="clearfix"></span>
                <hr>
                <p class="text-center">New to Leago? <b><a href="${pageContext.request.contextPath}/register">Sign up! </a></b></p>
            </div>
        </div>
    </div>

    <%@include file="../snipplets/forgotPassword.jspf" %>   

</div><!-- /.row -->
