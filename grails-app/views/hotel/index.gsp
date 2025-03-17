<!DOCTYPE html>
<html>


<head>
    <meta name="layout" content="main"/>
    <title>Отели</title>
    <asset:stylesheet href="hotel/hotel.css"/>
</head>
<body>
<form action="${createLink(controller: 'hotel', action: 'search')}" method="get" target="_blank">
    <input type="text" name="search" value="${params.search ?: ''}" placeholder="Поиск отеля">

    <select name="countryId" id="country">
        <option value="">Любая</option>
        <g:each in="${countries}" var="country">
            <option value="${country.id}" ${country.id == (params.countryId?.isNumber() ? params.countryId.toLong() : null) ? 'selected' : ''}>${country.name}</option>
        </g:each>
    </select>

    <button type="submit">Найти</button>
</form>
<h1>Справочник отелей</h1>

<g:link controller="hotel" action="create" class="add-hotel-button">Добавить новый отель</g:link>



<g:if test="${hotels}">
    <table border="1">
        <thead>
        <tr>
            <th>Название</th>
            <th>Страна</th>
            <th>Звёздность</th>
            <th>Сайт</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${hotels}" var="hotel">
            <tr>
                <td>${hotel.name}</td>
                <td>${hotel.country}</td>
                <td>${hotel.stardom}</td>
                <td>${hotel.website}</td>
                <td>
                    <g:link controller="hotel" action="show" id="${hotel.id}" class="action-button">Просмотр</g:link>
                    <g:link controller="hotel" action="edit" id="${hotel.id}" class="action-button">Редактировать</g:link>
                    <g:form controller="hotel" action="delete" method="POST" style="display:inline;">
                        <g:hiddenField name="id" value="${hotel.id}" />
                        <button type="submit" class="delete-button">Удалить</button>
                    </g:form>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <!-- Пагинация -->
    <div class="pagination-container">
        <g:set var="max" value="${params.int('max') ?: 10}" />
        <g:set var="offset" value="${params.int('offset') ?: 0}" />

        <g:if test="${offset > 0}">
            <g:link controller="hotel" action="index" params="[max: max, offset: offset - max]">← Назад</g:link>
        </g:if>
        <g:if test="${offset + max < total}">
            <g:link controller="hotel" action="index" params="[max: max, offset: offset + max]">Вперед →</g:link>
        </g:if>
    </div>
</g:if>

<g:else>
    <p>Нет отелей для отображения.</p>
</g:else>



</body>
</html>