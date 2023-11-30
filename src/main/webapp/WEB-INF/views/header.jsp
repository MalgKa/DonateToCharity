<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAnonymous()">
    <nav class="container container--70">
        <jsp:include page="language.jsp"/>
        <ul class="nav--actions">
            <li><a href="/login" class="btn btn--small btn--without-border"><spring:message code="homePage.btn.signIn"/></a></li>
            <li><a href="/register" class="btn btn--small btn--highlighted"><spring:message code="homePage.btn.signUp"/></a></li>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active"><spring:message code="homePage.btn.start"/></a></li>
            <li><a href="/#steps" class="btn btn--without-border"><spring:message code="homePage.btn.desc"/></a></li>
            <li><a href="/#about-us" class="btn btn--without-border"><spring:message code="homePage.btn.about"/></a></li>
            <li><a href="/#help" class="btn btn--without-border"><spring:message code="homePage.btn.institution"/></a></li>
            <li><a href="/form" class="btn btn--without-border"><spring:message code="homePage.btn.makeDonations"/></a></li>
            <li><a href="/#contact" class="btn btn--without-border"><spring:message code="homePage.btn.contact"/></a></li>
        </ul>
    </nav>
</sec:authorize>

<sec:authorize access="isAuthenticated()">

    <nav class="container container--70">
        <jsp:include page="language.jsp"/>
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj ${loggedUser.firstName}
                <ul class="dropdown">
                    <li><a href="/update/profile"><spring:message code="logged.user.dropdown.profile"/></a></li>
                    <li><a href="/donations"><spring:message code="logged.user.dropdown.donationList"/></a></li>
                    <li><a href="/logout"><spring:message code="logged.user.dropdown.logout"/></a></li>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li><a href="/admin/users"><spring:message code="logged.user.dropdown.adminPanel"/></a></li>
                    </sec:authorize>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active">Start</a></li>
            <li><a href="/#steps" class="btn btn--without-border"><spring:message code="homePage.btn.desc"/></a></li>
            <li><a href="/#about-us" class="btn btn--without-border"><spring:message code="homePage.btn.about"/></a></li>
            <li><a href="/#help" class="btn btn--without-border"><spring:message code="homePage.btn.institution"/></a></li>
            <li><a href="/form" class="btn btn--without-border"><spring:message code="homePage.btn.makeDonations"/></a></li>
            <li><a href="/#contact" class="btn btn--without-border"><spring:message code="homePage.btn.contact"/></a></li>
        </ul>
    </nav>
</sec:authorize>
