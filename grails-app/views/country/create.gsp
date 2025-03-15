<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Создать страну</title>
</head>
<body>
<h1>Создать страну</h1>

<g:form action="save" controller="country">
    <label for="name">Название страны:</label>
    <g:textField name="name" value="${country?.name}" required="true" />

    <label for="cityCapital">Столица:</label>
    <g:textField name="cityCapital" value="${country?.cityCapital}" required="true" />

    <button type="submit">Создать</button>
</g:form>

<g:link controller="country" action="index">Назад к списку стран</g:link>
</body>
</html>
