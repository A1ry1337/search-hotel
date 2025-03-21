<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Редактировать страну</title>
    <asset:stylesheet href="country/editCountry.css"/>
</head>
<body>
<h1>Редактировать страну: ${country.name}</h1>

<g:form action="update" controller="country">
    <g:hiddenField name="id" value="${country?.id}" />

    <label for="name">Название страны:</label>
    <g:textField name="name" value="${country?.name}" required="true" class="input-field"/>

    <label for="cityCapital">Столица:</label>
    <g:textField name="cityCapital" value="${country?.cityCapital}" required="true" class="input-field"/>

    <button type="submit" class="action-button">Обновить</button>
</g:form>

<g:link controller="country" action="index" class="back-button">Назад к списку стран</g:link>
</body>
</html>
