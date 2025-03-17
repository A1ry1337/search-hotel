<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Создать страну</title>
    <asset:stylesheet href="country/createCountry.css"/>
</head>
<body>
<h1>Создать страну</h1>

<g:form action="save" controller="country">
    <label for="name">Название страны:</label>
    <g:textField name="name" value="${country?.name}" required="true" class="input-field"/>

    <label for="cityCapital">Столица:</label>
    <g:textField name="cityCapital" value="${country?.cityCapital}" required="true" class="input-field"/>

    <button type="submit" class="action-button">Создать</button>
</g:form>

<g:link controller="country" action="index" class="back-button">Назад к списку стран</g:link>
</body>
</html>
