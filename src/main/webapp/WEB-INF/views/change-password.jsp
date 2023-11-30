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
    <jsp:include page="header.jsp"/>

    <section class="about-us" id="users">
        <div class="about-us--text div-admin">
            <div class="slogan container container--20">
                <div class="card-admin">
                    <h2>Twoje dane</h2>
                    <form:form modelAttribute="loggedUser" method="post" class="form-admin">
                        <div class="form-box">
                            <label>Imię</label>
                            <form:input path="firstName" readonly="true"/>
                        </div>
                        <div class="form-box">
                            <label>Nazwisko</label>
                            <form:input path="lastName" readonly="true"/>
                        </div>
                        <div class="form-box">
                            <label>Email</label>
                            <form:input path="username" readonly="true"/>
                        </div>
                        <div class="form-box">
                            <label>change password</label>
                            <input type="text" name="newPassword">
                            <c:if test="${not empty error}">
                                <p style="color: red;">${error}</p>
                            </c:if>
                        </div>

                        <form:hidden path="active"/>
                        <form:hidden path="role"/>
                        <form:hidden path="id"/>
                        <div class="form-box">
                            <form:button>zapisz</form:button>
                            <a href="/update/profile" class="custom-btn update">anuluj</a>
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
<jsp:include page="footer.jsp"/>
</body>
</html>
