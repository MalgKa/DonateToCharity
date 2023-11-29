<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<header class="header--main-page">
    <jsp:include page="header.jsp"/>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                <spring:message code="homePage.slogan.start1Line"/><br />
                <spring:message code="homePage.slogan.start2Line"/>
            </h1>
        </div>
    </div>
</header>

<section class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${numberOfBags}</em>

            <h3><spring:message code="homePage.slogan.statisticsBags"/></h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius est beatae, quod accusamus illum
                tempora!</p>
        </div>

        <div class="stats--item">
            <em>${numberOfDonations}</em>
            <h3><spring:message code="homePage.slogan.statisticsDonations"/></h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam magnam, sint nihil cupiditate quas
                quam.</p>
        </div>

    </div>
</section>

<section id="steps" class="steps">
    <h2><spring:message code="homePage.slogan.steps"/></h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3><spring:message code="homePage.slogan.steps1/1"/></h3>
            <p><spring:message code="homePage.slogan.steps1/2"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3><spring:message code="homePage.slogan.steps2/1"/></h3>
            <p><spring:message code="homePage.slogan.steps2/2"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3><spring:message code="homePage.slogan.steps3/1"/></h3>
            <p><spring:message code="homePage.slogan.steps3/2"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3><spring:message code="homePage.slogan.steps4/1"/></h3>
            <p><spring:message code="homePage.slogan.steps4/2"/></p>
        </div>
    </div>
    <sec:authorize access="isAnonymous()">
        <a href="/register" class="btn btn--large"><spring:message code="homePage.btn.signUp"/></a>
    </sec:authorize>
</section>

<section class="about-us" id="about-us">
    <div class="about-us--text">
        <h2><spring:message code="homePage.btn.about"/></h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero
            optio esse quisquam illo omnis.</p>
        <img src="<c:url value="resources/images/signature.svg"/>" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><img src="<c:url value="resources/images/about-us.jpg"/>" alt="People in circle"/>
    </div>
</section>

<section id="help" class="help">
    <h2><spring:message code="homePage.slogan.help1Line"/></h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p><spring:message code="homePage.slogan.help2Line"/></p>

        <ul class="help--slides-items">
            <c:forEach items="${institutionList}" var="institution" varStatus="status">
                <c:if test="${status.count % 2 != 0}">
                    <li>
                </c:if>

                <div class="col">
                    <div class="title">Fundacja "${institution.name}"</div>
                    <div class="subtitle">Cel i misja: ${institution.description}</div>
                </div>

                <c:if test="${status.count % 2 == 0 or status.last}">
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</section>

<jsp:include page="footer.jsp"/>

<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
