<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setBundle basename="leago.i18n.bundle" />

<div class="row" style="padding-top: 80px;">
    <div align="center" class="col-sm-6 col-md-4 col-md-offset-4"> 
        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><h2> <fmt:message key="login.header.login"/> <small> <fmt:message key="login.header.small"/></small></h2></div>
            <div class="panel-body">
                <form class="form" action="${pageContext.request.contextPath}/login" method="post" role="form">
                    <input type="hidden" name="action" value="create">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="<fmt:message key="login.label.username"/>" name="id" required autofocus>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="<fmt:message key="login.label.password"/>" name="password" required>
                    </div>
                    <div class="form-group">
                        <!-- modal caller -->
                        <div class="links effect-1">
                            <a href="#modal-dialog-user" data-toggle="modal" data-modal-title="Reset Password" data-modal-text="Enter your email" data-modal-confirm-url="#" data-modal-type="confirm" class="model-toggle pull-right need-help"><fmt:message key="login.link.password"/> </a><span class="clearfix"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-lg btn-leago btn-block" type="submit"><fmt:message key="login.button.submit"/></button>
                    </div>
                </form>
                <div class="links effect-1">
                    <a href="${pageContext.request.contextPath}/faq.jsp" class="pull-right need-help"><fmt:message key="login.link.help"/> </a><span class="clearfix"></span>
                </div>
                <hr>
                <p class="text-center"><fmt:message key="login.info.new"/> <b><a href="${pageContext.request.contextPath}/register"><fmt:message key="login.link.signup"/> </a></b></p>
            </div>
        </div>
    </div>

    <%@include file="../snipplets/forgotPassword.jspf" %>   

</div><!-- /.row -->
