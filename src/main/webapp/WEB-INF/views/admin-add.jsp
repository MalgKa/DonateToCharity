<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header class="header--admin-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj ${loggedUser.firstName}
                <ul class="dropdown">
                    <li><a href="/logout">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="/#steps" class="btn btn--without-border active">O co chodzi?</a></li>
            <li><a href="/admin/users#users" class="btn btn--without-border">użytkownicy</a></li>
            <li><a href="/admin/users#help" class="btn btn--without-border">lista fundacji</a></li>
            <li><a href="/form" class="btn btn--without-border">Przekaż dary</a></li>
            <li><a href="/#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
    <section class="about-us" id="users">
        <div class="about-us--text div-admin">
            <div class="slogan container container--20">
                <div class="card-admin">
                    <h2>dodaj admina</h2>
                    <form:form modelAttribute="admin" method="post" class="form-admin">
                        <div class="form-box">
                            <label>Imię</label>
                            <form:input path="firstName" placeholder="imię"/>
                        </div>
                        <div class="form-box">
                            <label>Nazwisko</label>
                            <form:input path="lastName" placeholder="nazwisko"/>
                        </div>
                        <div class="form-box">
                            <label>Email</label>
                            <form:input path="username" placeholder="email"/>
                        </div>
                        <div class="form-box">
                            <label>Password</label>
                            <form:input path="password" type="password" placeholder="password"/>
                        </div>
                        <form:hidden path="active" value="true"/>
                        <form:hidden path="role" value="ROLE_ADMIN"/>
                        <div class="form-box">
                            <form:button>zapisz</form:button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
        <div class="about-us--image-admin"><img src="<c:url value="/resources/images/about-us.jpg"/>"
                                                alt="People in circle"/>
        </div>
    </section>
</header>
</body>
</html>
