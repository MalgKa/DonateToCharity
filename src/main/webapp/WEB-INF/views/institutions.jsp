<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<section id="help" class="help">
    <h2>Lista Fundacji</h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p>Lista zweryfikowanych Fundacji, z którymi współpracujemy.
            Możesz dokanać zmian, usunąć lub dodać Fundację do bazy.</p>

        <ul class="help--slides-items">
            <c:forEach items="${institutionList}" var="institution" varStatus="status">
                <c:if test="${status.count % 2 != 0}">
                    <li>
                </c:if>

                <div class="col">
                    <div class="title">Fundacja "${institution.name}"</div>
                    <div class="subtitle">Cel i misja: ${institution.description}</div>
                    <div><a href="/admin/institution/update?institutionId=${institution.id}">zmień</a></div>
                    <div><a href="/admin/institution/remove?institutionId=${institution.id}">usuń</a></div>
                </div>

                <c:if test="${status.count % 2 == 0 or status.last}">
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <a href="/admin/institution/add" class="custom-btn">dodaj fundację</a>
</section>
