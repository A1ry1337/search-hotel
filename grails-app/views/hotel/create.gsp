<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Создать отель</title>
</head>
<body>
<h1>Создать отель</h1>

<g:form action="save" controller="hotel">
    <label for="name">Название отеля:</label>
    <g:textField name="name" value="${hotel?.name}" required="true" />


    <g:select name="country.id"
              from="${countries}"
              optionKey="id"
              optionValue="name"
              value="${hotel?.country?.id}" />

    <label for="stardom">Звёздность:</label>
    <g:select name="stardom"
              from="${1..5}"
              value="${hotel?.stardom}"/>

    <label for="website">Вебсайт:</label>
    <g:textField name="website" value="${hotel?.website}"/>

    <button type="submit">Создать</button>
</g:form>

<g:link controller="country" action="index">Назад к списку отелей</g:link>
</body>
</html>
