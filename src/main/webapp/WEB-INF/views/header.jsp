<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAnonymous()">
    <nav class="container container--70">
        <div class="language">
            <a href="?lang=en">EN</a>
            <a href="?lang=de">DE</a>
            <a href="?lang=pl">PL</a>
        </div>
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
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj ${loggedUser.firstName}
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="/donations">Moje zbiórki</a></li>
                    <li><a href="/logout">Wyloguj</a></li>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li><a href="/admin/users">panel admina</a></li>
                    </sec:authorize>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active">Start</a></li>
            <li><a href="/#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="/#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="/#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="/form" class="btn btn--without-border">Przekaż dary</a></li>
            <li><a href="/#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
</sec:authorize>
