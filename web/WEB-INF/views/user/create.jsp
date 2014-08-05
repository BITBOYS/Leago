<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setBundle basename="leago.i18n.bundle" />

<div class="row" style="padding-top: 80px;">

    <div align="center" class="col-sm-6 col-md-4 col-md-offset-4"> 
        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><h2><fmt:message key="register.header.register"/> <small><fmt:message key="register.header.small"/></small></h2></div>
            <div class="panel-body">
                <form action="${pageContext.request.contextPath}/register/create" method="post" class="form" role="form">

                    <div class="form-group">
                        <input class="form-control" name="name" placeholder="<fmt:message key="register.label.username"/>" type="text" required autofocus />
                    </div>
                    <div class="form-group">
                        <input class="form-control" name="email" placeholder="<fmt:message key="register.label.email"/>" type="email" required/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" name="password" placeholder="<fmt:message key="register.label.password"/>" type="password" required/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" name="reenter_password" placeholder="<fmt:message key="register.label.reenter_password"/>" type="password" required/>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-lg btn-leago btn-block" type="submit"><fmt:message key="register.button.submit"/></button>
                    </div>
                </form>
                <a href="${pageContext.request.contextPath}/faq" class="pull-right need-help"><fmt:message key="register.link.help"/> </a><span class="clearfix"></span>
                <hr>
                <p class="text-center"><fmt:message key="register.info.already"/> <b><a href="${pageContext.request.contextPath}/login" class="text-center new-account"><fmt:message key="register.link.signin"/></a></b></p>
            </div>
        </div>
    </div>
</div><!-- /.row -->
