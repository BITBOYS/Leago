<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="leago.i18n.bundle" />

<div class="row">
    <%@include file="link_list.jsp" %>
    
   
    <div class="col-md-8">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-user"></i> <fmt:message key="user_settings.header.name"/></div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="name_form" action="${pageContext.request.contextPath}/settings/profile" method="POST">

                        <div class="form-group">
                            <label><fmt:message key="user_settings.label.name"/></label>
                            <input type="text" class="form-control" name="input_name_new1" required>
                        </div>

                        <div class="form-group">
                            <label><fmt:message key="user_settings.label.reenter_name"/></label>
                            <input type="text" class="form-control" name="input_name_new2" required>
                        </div>

                        <button class="btn btn-primary btn-leago" type="submit"><fmt:message key="user_settings.submit.name"/></button>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel --> 
    </div> <!-- /.grid 12 -->

</div> 

<div class="row">
    <div class="col-md-8 col-md-offset-4">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-envelope-o"></i> <fmt:message key="user_settings.header.email"/></div>
            <div class="panel-body">
                <div class="col-xs-8">
                
                    <form role="form" name="email_form" action="${pageContext.request.contextPath}/settings/profile" method="POST">

                        <div class="form-group">
                            <label><fmt:message key="user_settings.label.email"/></label>
                            <input type="email" class="form-control" name="input_email_new1" required>
                        </div>

                        <div class="form-group">
                            <label><fmt:message key="user_settings.label.reenter_email"/></label>
                            <input type="email" class="form-control" name="input_email_new2" required>
                        </div>

                        <button class="btn btn-primary btn-leago" type="submit"><fmt:message key="user_settings.submit.email"/></button>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel --> 
    </div> <!-- /.grid 8 --> 
</div>
        


<div class="row">
    <div class="col-md-8 col-md-offset-4">
        
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-lock"></i> <fmt:message key="user_settings.header.password"/></div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="password_form" action="${pageContext.request.contextPath}/settings/profile" method="POST">

                        <div class="form-group">
                            <label><fmt:message key="user_settings.label.old_password"/></label>
                            <input type="password" class="form-control" name="input_password_old" required>
                        </div>

                        <div class="form-group">
                            <label><fmt:message key="user_settings.label.password"/></label>    
                            <input type="password" class="form-control" name="input_password_new1" required>
                        </div>

                        <div class="form-group">
                            <label><fmt:message key="user_settings.label.reenter_password"/></label>
                            <input type="password" class="form-control" name="input_password_new2" required>
                        </div>

                        <button class="btn btn-primary btn-leago" type="submit"><fmt:message key="user_settings.submit.password"/></button>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.grid 8 --> 
</div>
            
<div class="row">
    <div class="col-md-8 col-md-offset-4">
        <!-- Default panel contents -->
        <div class="panel panel-danger">
            <div class="panel-heading"><span class="fa fa-trash-o"></span> <fmt:message key="user_settings.header.delete"/></div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <p><fmt:message key="user_settings.label.delete"/></p>
                    <a class="btn btn-primary btn-danger" href="${pageContext.request.contextPath}/settings/delete"><fmt:message key="user_settings.submit.delete"/></a>
                </div>
            </div>
        </div> <!-- /.panel--> 
    </div> <!-- /.grid 8 --> 
</div>