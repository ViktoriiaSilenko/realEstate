<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Real estate</title>

    <link media="all" rel="stylesheet" href="${contextPath}/resources/css/main.css">

    <!--link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/common.css" rel="stylesheet"-->

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js" defer></script>
    <script>window.jQuery || document.write('<script src="${contextPath}/resources/js/jquery-1.12.4.min.js" defer><\/script>')</script>
    <script src="${contextPath}/resources/js/jquery.main.js" defer></script>

    <!--script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script-->

</head>

<body class="account-page">

<section>
    <sitemesh:write property='body' />
</section>

<jsp:include page="../section/footer.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>

</html>
