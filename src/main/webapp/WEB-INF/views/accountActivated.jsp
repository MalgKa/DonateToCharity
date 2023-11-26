<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>konto aktywowane</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header>
    <jsp:include page="header.jsp"/>
</header>

<section class="login-page">
    <h2>Twoje konto zostało aktywowane</h2>
    <h1>przejdź do strony logowania</h1>
    <a href="/login" class="btn">zaloguj</a>
</section>

<jsp:include page="footer.jsp"/>
</body>