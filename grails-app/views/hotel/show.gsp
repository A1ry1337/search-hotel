<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Отель: ${hotel.name}</title>
    <asset:stylesheet href="hotel/showHotel.css"/>
</head>
<body>
<h1>Отель: ${hotel.name}</h1>
<p><strong>Страна:</strong> ${hotel.country}</p>
<p><strong>Звёздность:</strong> ${hotel.stardom}</p>
<p><strong>Вебсайт:</strong> ${hotel.website}</p>

<g:link controller="hotel" action="index" class="back-button">Назад к списку отелей</g:link>
</body>
</html>
