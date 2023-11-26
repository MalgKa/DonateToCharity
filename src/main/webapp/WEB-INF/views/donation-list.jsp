<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table cellspacing="10">
    <tr>
        <th>nazwa instytucji</th>
        <th>wiadomosc dla kuriera</th>
        <th>data odbioru</th>
        <th>czas odbioru</th>
        <th>miasto odbioru</th>
        <th>ilość worków</th>
        <th>kod pocztowy</th>
        <th>kategorie</th>

    </tr>

    <c:forEach items="${donationList}" var="donation">
        <tr>
            <td>${donation.institution.name ne null ? donation.institution.name:  "instytucja usunięta z bazy " }</td>
            <td>${donation.pickUpComment}</td>
            <td>${donation.pickUpDate}</td>
            <td>${donation.pickUpTime}</td>
            <td>${donation.city}</td>
            <td>${donation.quantity}</td>
            <td>${donation.zipCode}</td>
            <td>
                <c:forEach items="${donation.categories}" var="category" varStatus="loop">
                    ${category.name}
                    <c:if test="${not loop.last}">, </c:if>
                </c:forEach>
            </td>
        </tr>

    </c:forEach>

</table>
</body>
</html>

