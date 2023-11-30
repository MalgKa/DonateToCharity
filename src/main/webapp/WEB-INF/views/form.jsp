<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<header class="header--form-page">
    <jsp:include page="header.jsp"/>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                <spring:message code="form.slogan1/2"/><br />
                <span class="uppercase"><spring:message code="form.slogan2/2"/></span>
            </h1>

            <div class="slogan--steps">
                <div class="slogan--steps-title"><spring:message code="homePage.slogan.steps"/></div>
                <ul class="slogan--steps-boxes">
                    <li>
                        <div><em>1</em><span><spring:message code="homePage.slogan.steps1/1"/></span></div>
                    </li>
                    <li>
                        <div><em>2</em><span><spring:message code="homePage.logged.step2"/></span></div>
                    </li>
                    <li>
                        <div><em>3</em><span><spring:message code="homePage.logged.step3"/></span></div>
                    </li>
                    <li>
                        <div><em>4</em><span><spring:message code="homePage.slogan.steps4/1"/></span></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3><spring:message code="form.donation.add.slogan.important1"/>!</h3>
            <p data-step="1">
                <spring:message code="form.donation.add.slogan.important2"/>
            </p>
            <p data-step="2">
                <spring:message code="form.donation.add.slogan.important2"/>
            </p>
            <p data-step="3">
                <spring:message code="form.donation.add.slogan.step3"/>
            </p>
            <p data-step="4"><spring:message code="form.donation.add.slogan.step4"/></p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter"><spring:message code="form.donation.add.slogan.step"/><span>1</span>/4</div>

        <form:form modelAttribute="donation" method="post">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1">
                <h3><spring:message code="form.donation.add.stuff"/></h3>
                <c:forEach items="${categories}" var="category">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input
                                    type="checkbox"
                                    name="categories"
                                    value="${category.id}"
                                    id="category"

                            />
                            <span class="checkbox"></span>
                            <span class="description">
                                    ${category.name}
                            </span>
                        </label>
                    </div>
                </c:forEach>
                    <%--                <form:checkboxes path="categories" items="${categories}" itemLabel="name" itemValue="id" name="selectedItem"/>--%>
                    <%--                <div class="form-group form-group--checkbox">--%>
                    <%--                    <label>--%>
                    <%--                        <input type="checkbox" name="categories" value="toys" />--%>
                    <%--                        <span class="checkbox"></span>--%>
                    <%--                        <span class="description">zabawki</span>--%>
                    <%--                    </label>--%>
                    <%--                </div>--%>


                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step"><spring:message code="form.donation.add.btnNext"/></button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2" class="active">
                <h3><spring:message code="form.donation.add.numberOfBags"/></h3>

                <div class="form-group form-group--inline">
                    <label>
                        <spring:message code="form.donation.add.numberOfBagsInput"/>
                        <form:input type="number" path="quantity" step="1" min="1" id="quantity"/>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step"><spring:message code="form.donation.add.btnPrevious"/></button>
                    <button type="button" class="btn next-step"><spring:message code="form.donation.add.btnNext"/></button>
                </div>
            </div>


            <!--INSTITUTIONS-->

            <!-- STEP 3 -->
            <div data-step="3">
                <h3><spring:message code="form.donation.add.institution"/></h3>

                <div class="form-group form-group--checkbox">
                    <c:forEach items="${institutions}" var="institution">
                        <label style="margin-bottom: 20px">
                            <form:radiobutton path="institution" name="${institution.name}" value="${institution.id}" id="institution"/>
                            <span class="checkbox radio"></span>
                            <span class="description">
                  <div class="title"> Fundacja: ${institution.name}</div>
                  <div class="subtitle">
                        Cel i misja: ${institution.description}
                  </div>
                </span>
                        </label>
                    </c:forEach>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step"><spring:message code="form.donation.add.btnPrevious"/></button>
                    <button type="button" class="btn next-step"><spring:message code="form.donation.add.btnNext"/></button>
                </div>
            </div>

            <!-- STEP 4 -->
            <div data-step="4">
                <h3><spring:message code="form.donation.add.pickUpData"/></h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4><spring:message code="form.donation.add.pickUpAddress"/></h4>
                        <div class="form-group form-group--inline">
                            <label> <spring:message code="form.donation.add.pickUpStreet"/><form:input type="text" path="street" id="street"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label><spring:message code="form.donation.add.pickUpCity"/><form:input type="text" path="city" id="city"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="form.donation.add.pickUpZipcode"/><form:input type="text" path="zipCode" id="zipCode"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="form.donation.add.pickUpPhonenumber"/><input type="phone" name="phone" id="phone"/>
                            </label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4><spring:message code="form.donation.add.pickUpDate"/></h4>
                        <div class="form-group form-group--inline">
                            <label> <spring:message code="form.donation.add.pickUpDay"/> <form:input type="date" path="pickUpDate" id="pickUpDate"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> <spring:message code="form.donation.add.pickUpTime"/> <form:input type="time" path="pickUpTime" id="pickUpTime"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="form.donation.add.pickUpMessage"/>
                                <form:textarea path="pickUpComment" id="pickUpComment" rows="5"/>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step"><spring:message code="form.donation.add.btnPrevious"/></button>
                    <button type="button" class="btn next-step"><spring:message code="form.donation.add.btnNext"/></button>
                </div>
            </div>

            <!-- STEP 6 -->
            <div data-step="5">
                <h3><spring:message code="form.donation.add.mainSummary"/></h3>

                <div class="summary">
                    <div class="form-section">
                        <h4><spring:message code="form.donation.add.summary"/></h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text summary-category"
                                >4 worki ubrań w dobrym stanie dla dzieci</span
                                >
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text summary-institution"
                                >Dla fundacji "Mam marzenie" w Warszawie</span
                                >
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4><spring:message code="form.donation.add.pickUpAddress"/></h4>
                            <ul>
                                <li class="pickUpDetails">Prosta 51</li>
                                <li class="pickUpDetails">Warszawa</li>
                                <li class="pickUpDetails">99-098</li>
                                <li class="pickUpDetails">123 456 789</li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4><spring:message code="form.donation.add.pickUpDate"/></h4>
                            <ul>
                                <li class="pickUpDetails">13/12/2018</li>
                                <li class="pickUpDetails">15:40</li>
                                <li class="pickUpDetails">Brak uwag</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step"><spring:message code="form.donation.add.btnPrevious"/></button>
                    <form:button type="submit" class="btn"><spring:message code="form.donation.add.btnConfirm"/></form:button>
                </div>
            </div>
        </form:form>
    </div>
</section>
<jsp:include page="footer.jsp"/>
<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>