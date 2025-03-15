<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Результаты поиска отелей</title>
</head>
<body>

<h1>Результаты поиска отелей</h1>

<g:if test="${hotels}">
    <table border="1">
        <thead>
        <tr>
            <th>Звёздность</th>
            <th>Название</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${hotels}" var="hotel">
            <tr>
                <td>${hotel.stardom}</td>
                <td>
                    ${hotel.name}
                    <g:if test="${hotel.website}">
                        <br/>
                        <a href="${hotel.website}" target="_blank">Перейти на сайт</a>
                    </g:if>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <!-- Пагинация -->
    <div>
        <g:set var="max" value="${params.int('max') ?: 10}" />
        <g:set var="offset" value="${params.int('offset') ?: 0}" />

        <g:if test="${offset > 0}">
            <g:link controller="hotel" action="search" params="[max: max, offset: offset - max, search: search, countryId: countryId]">← Назад</g:link>
        </g:if>
        <g:if test="${offset + max < total}">
            <g:link controller="hotel" action="search" params="[max: max, offset: offset + max, search: search, countryId: countryId]">Вперед →</g:link>
        </g:if>
    </div>
    <br>
    <div>Количество найденных отелей: ${total}</div>
</g:if>

<g:else>
    <p>По вашему запросу ничего не найдено.</p>
</g:else>

<br>
<g:link controller="hotel" action="index">Новый поиск</g:link>

</body>
</html>
