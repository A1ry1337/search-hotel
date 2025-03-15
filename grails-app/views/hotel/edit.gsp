<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Редактировать отель</title>
</head>
<body>
<h1>Редактировать отель: ${hotel.name}</h1>

<g:form action="update" controller="hotel">
    <g:hiddenField name="id" value="${hotel?.id}" />

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

    <label for="cityCapital">Вебсайт:</label>
    <g:textField name="website" value="${hotel?.website}"/>

    <button type="submit">Обновить</button>
</g:form>

<g:link controller="country" action="index">Назад к списку стран</g:link>
</body>
</html>
