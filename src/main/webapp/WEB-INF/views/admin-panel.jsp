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
                    <li><a href="/update/profile"><spring:message code="logged.user.dropdown.profile"/></a></li>
                    <li><a href="/donations"><spring:message code="logged.user.dropdown.donationList"/></a></li>
                    <li><a href="/logout"><spring:message code="logged.user.dropdown.logout"/></a></li>
                    <li><a href="/admin/users"><spring:message code="logged.user.dropdown.adminPanel"/></a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="/#steps" class="btn btn--without-border active">O co chodzi?</a></li>
            <li><a href="#users" class="btn btn--without-border">użytkownicy</a></li>
            <li><a href="#help" class="btn btn--without-border">lista fundacji</a></li>
            <li><a href="/form" class="btn btn--without-border">Przekaż dary</a></li>
            <li><a href="/#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
    <section class="about-us" id="users">
        <div class="about-us--text div-admin">

            <p class="admin-user--text">LISTA UŻYTKOWNIKÓW:</p>
            <h2>ROLA: USER</h2>
            <table>
                <tr>
                    <th>id</th>
                    <th>imię</th>
                    <th>nazwisko</th>
                    <th>email</th>
                    <th>rola</th>
                    <th>aktywny</th>
                    <th>zmień/usuń</th>
                </tr>
                <c:forEach items="${mapOfUsers.get('ROLE_USER')}" var="user">
                    <tr>
                        <c:choose>

                            <c:when test="${userToEdit !=null and userToEdit.id==user.id}">
                                <form:form action="/admin/user/update" method="post" modelAttribute="userToEdit">
                                    <td>${user.id}</td>
                                    <td><form:input path="firstName"/></td>
                                    <td><form:input path="lastName"/></td>
                                    <td><form:input path="username"/></td>
                                    <td><form:input path="role"/></td>
                                    <td><form:input path="active"/></td>
                                    <form:hidden path="id"/>
                                    <form:hidden path="password"/>
                                    <td><form:button name="edit">zapisz</form:button>
                                        <a href="/admin/users">zrezygnuj</a>
                                    </td>
                                </form:form>
                            </c:when>

                            <c:otherwise>
                                <td>${user.id}</td>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.username}</td>
                                <td>${user.role}</td>
                                <td>${user.active}</td>
                                <td><a href="/admin/users?userToEditId=${user.id}" class="custom-btn update">zmień</a>
                                    <a href="/admin/user/remove?userId=${user.id}" class="custom-btn remove">usuń</a>
                                </td>
                            </c:otherwise>

                        </c:choose>
                    </tr>

                </c:forEach>
            </table>

            <h2>ROLA: ADMIN</h2>
            <table>
                <tr>
                    <th>id</th>
                    <th>imię</th>
                    <th>nazwisko</th>
                    <th>email</th>
                    <th>rola</th>
                    <th>aktywny</th>
                    <th>zmień/usuń</th>


                </tr>
                <c:forEach items="${mapOfUsers.get('ROLE_ADMIN')}" var="user">
                    <tr>
                        <c:choose>

                            <c:when test="${userToEdit !=null and userToEdit.id==user.id}">
                                <form:form action="/admin/user/update" method="post" modelAttribute="userToEdit">
                                    <td>${user.id}</td>
                                    <td><form:input path="firstName"/></td>
                                    <td><form:input path="lastName"/></td>
                                    <td><form:input path="username"/></td>
                                    <td><form:input path="role"/></td>
                                    <td><form:input path="active"/></td>
                                    <form:hidden path="id"/>
                                    <form:hidden path="password"/>
                                    <td><form:button name="edit">zapisz</form:button>
                                        <a href="/admin/users">zrezygnuj</a>
                                    </td>
                                </form:form>
                            </c:when>

                            <c:otherwise>
                                <td>${user.id}</td>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.username}</td>
                                <td>${user.role}</td>
                                <td>${user.active}</td>
                                <td><a href="/admin/users?userToEditId=${user.id}" class="custom-btn update">zmień</a>
                                    <a href="/admin/user/remove?userId=${user.id}" class="custom-btn remove">usuń</a>
                                </td>
                            </c:otherwise>

                        </c:choose>
                    </tr>
                </c:forEach>
            </table>
            <c:if test="${not empty error}">
                <p style="color: red;">${error}</p>
            </c:if>
            <a href="/admin/admin/add" class="custom-btn add-admin">dodaj admina</a>
        </div>
        <div class="about-us--image-admin"><img src="<c:url value="/resources/images/about-us.jpg"/>" alt="People in circle"/>
        </div>
    </section>
</header>
<jsp:include page="institutions.jsp"/>
</body>
</html>
