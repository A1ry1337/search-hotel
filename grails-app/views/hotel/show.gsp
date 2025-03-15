<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Отель: ${hotel.name}</title>
</head>
<body>
<h1>Отель: ${hotel.name}</h1>
<p><strong>Страна:</strong> ${hotel.country}</p>
<p><strong>Звёздность:</strong> ${hotel.stardom}</p>
<p><strong>Вебсайт:</strong> ${hotel.website}</p>

<g:link controller="hotel" action="index">Назад к списку отелей</g:link>
</body>
</html>
