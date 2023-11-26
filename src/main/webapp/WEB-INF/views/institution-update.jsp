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
<header class="header--main-page">
  <jsp:include page="header.jsp"/>

  <div class="slogan container container--60">
    <div class="card-institution">
      <h2>zmiana fundacji</h2>
      <form:form modelAttribute="institutionToUpdate" method="post" class="form-institution">
        <form:hidden path="id"/>
        <div class="form-box">
          <label>nazwa fundacji</label>
          <form:input path="name"/>
        </div>
        <div class="form-box">
          <label>opis fundacji</label>
          <form:textarea path="description"/>
        </div>
        <div class="form-box">
          <form:button>zatwierdź</form:button>
        </div>

      </form:form>
    </div>
  </div>
</header>
