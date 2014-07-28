<div class="row" style="margin-top: 30px;"> 
    <div class="col-md-6 col-md-offset-3">

        <div class="panel panel-leago">
            <div class="panel-heading"><i class="fa fa-users"></i> Team erstellen</div>
            <div class="panel-body">
                <div class="col-xs-12">
                    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/new/team/create" method="post">

                        <div class="form-group">
                            <label>Name*</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>

                        <div class="form-group">
                            <label>Tag*</label>
                            <input type="text" class="form-control" name="tag" required>
                        </div>

                        <div class="form-group">
                            <small>* Pflichtfelder die ausgef&uuml;llt werden m&uuml;ssen</small>
                        </div>
                        
                        <div class="form-group pull-right">
                            <button type="submit" class="btn btn-leago"><span class="fa fa-pencil"></span> Erstellen <i class="fa fa-angle-right"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>



    </div>
</div>
