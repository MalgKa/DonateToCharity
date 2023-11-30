<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<footer>
    <div id="contact" class="contact">
        <h2><spring:message code="homePage.slogan.contact"/></h2>
        <h3><spring:message code="homePage.slogan.contactForm"/></h3>
        <form class="form--contact">
            <div class="form-group form-group--50"><input type="text" name="name" placeholder="<spring:message code="homePage.slogan.contactFormName"/>"/></div>
            <div class="form-group form-group--50"><input type="text" name="surname" placeholder="<spring:message code="homePage.slogan.contactFormSurname"/>"/></div>

            <div class="form-group"><textarea name="message" placeholder="<spring:message code="homePage.slogan.contactFormMessage"/>" rows="1"></textarea></div>

            <button class="btn" type="submit"><spring:message code="homePage.slogan.contactBtnSend"/></button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2023</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small">
                <img src="<c:url value="/resources/images/icon-facebook.svg"/>"/></a><a href="#" class="btn btn--small">
            <img src="<c:url value="/resources/images/icon-instagram.svg"/>"/></a>
        </div>
    </div>
</footer>