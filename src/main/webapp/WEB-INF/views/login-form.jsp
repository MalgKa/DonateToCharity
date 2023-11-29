<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<header>
    <jsp:include page="header.jsp"/>
</header>

<section class="login-page">
    <h2><spring:message code="homePage.btn.signIn"/></h2>
    <form action="/login" method="post">
        <div class="form-group">
            <input type="email" name="username" placeholder="Email" />
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="<spring:message code='login.page.password'/>" />
            <a href="#" class="btn btn--small btn--without-border reset-password"><spring:message code="login.page.password.remind"/></a>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/register" class="btn btn--without-border"><spring:message code="homePage.btn.signUp"/></a>
            <button class="btn" type="submit"><spring:message code="homePage.btn.signIn"/></button>
        </div>
    </form>
</section>

<jsp:include page="footer.jsp"/>
</body>