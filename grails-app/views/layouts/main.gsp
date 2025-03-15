<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:layoutTitle default="Поиск отелей"/></title>
    <g:layoutHead/>
    <style>
    nav ul {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        gap: 20px;
    }

    nav ul li {
        display: inline;
    }
    </style>
</head>
<body>
<nav>
    <ul>
        <li><g:link controller="hotel" action="index">Отели</g:link></li>
        <li><g:link controller="country" action="index">Страны</g:link></li>
    </ul>
</nav>
<br>
<div>
    <g:layoutBody/>
</div>
</body>
</html>
