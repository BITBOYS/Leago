<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <%@include file="link_list.jsp" %>

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
