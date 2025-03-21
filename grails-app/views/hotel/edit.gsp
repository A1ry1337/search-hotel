<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Редактировать отель</title>
    <asset:stylesheet href="hotel/editHotel.css"/>
</head>
<body>
<h1>Редактировать отель: ${hotel.name}</h1>

<g:form action="update" controller="hotel">
    <g:hiddenField name="id" value="${hotel?.id}" />

    <label for="name">Название отеля:</label>
    <g:textField name="name" value="${hotel?.name}" required="true" class="input-field"/>

    <label>Страна:</label>
    <g:select name="country.id"
              from="${countries}"
              optionKey="id"
              optionValue="name"
              value="${hotel?.country?.id}"
              class="input-field"/>

    <label for="stardom">Звёздность:</label>
    <g:select name="stardom"
              from="${1..5}"
              value="${hotel?.stardom}"
              class="input-field"/>

    <label for="website">Вебсайт:</label>
    <g:textField name="website" value="${hotel?.website}" class="input-field"/>

    <button type="submit" class="action-button">Обновить</button>
</g:form>

<g:link controller="hotel" action="index" class="back-button">Назад к списку отелей</g:link>
</body>
</html>
