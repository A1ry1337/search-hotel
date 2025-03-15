<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Страна: ${country.name}</title>
</head>
<body>
<h1>Страна: ${country.name}</h1>
<p><strong>Столица:</strong> ${country.cityCapital}</p>

<g:link controller="country" action="index">Назад к списку стран</g:link>
</body>
</html>
