<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>lista donacji</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header class="header--main-page">
    <jsp:include page="header.jsp"/>

    <div class="slogan container container--90">
        <div class="card-donation">
            <h2>lista Twoich donacji</h2>
            <c:if test="${empty donationList}">
                <p style="color: brown; font-size: 20px; font-weight: bold ">Nie masz jeszcze donacji.</p>
            </c:if>
            <div class="donation-list">
                <table cellspacing="10">
                    <tr>
                        <th>nazwa instytucji</th>
                        <th>kategorie</th>
                        <th>ilość worków</th>
                        <th>data odbioru</th>
                        <th>czas odbioru</th>
                        <th>miasto odbioru</th>
                        <th>kod pocztowy</th>
                        <th>wiadomosc dla kuriera</th>
                    </tr>
                    <c:forEach items="${donationList}" var="donation">
                        <tr>
                            <td>${donation.institution.name ne null ? donation.institution.name:  "instytucja usunięta z bazy " }</td>
                            <td>
                                <c:forEach items="${donation.categories}" var="category" varStatus="loop">
                                    ${category.name}
                                    <c:if test="${not loop.last}">, </c:if>
                                </c:forEach>
                            </td>
                            <td>${donation.quantity}</td>
                            <td>${donation.pickUpDate}</td>
                            <td>${donation.pickUpTime}</td>
                            <td>${donation.city}</td>
                            <td>${donation.zipCode}</td>
                            <td>${donation.pickUpComment}</td>

                        </tr>

                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</header>
</body>
</html>