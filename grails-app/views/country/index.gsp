<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Список стран</title>
</head>
<body>

<h1>Список стран</h1>

<g:link controller="country" action="create">
    <button>Добавить новую страну</button>
</g:link>

<g:if test="${countries}">
    <table border="1">
        <thead>
        <tr>
            <th>Название</th>
            <th>Столица</th>
            <th>Действия</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${countries}" var="country">
            <tr>
                <td>${country.name}</td>
                <td>${country.cityCapital}</td>
                <td>
                    <g:link controller="country" action="show" id="${country.id}">Просмотр</g:link> |
                    <g:link controller="country" action="edit" id="${country.id}">Редактировать</g:link> |
                    <g:form controller="country" action="delete" method="POST" style="display:inline;">
                        <g:hiddenField name="id" value="${country.id}" />
                        <button type="submit">Удалить</button>
                    </g:form>
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
            <g:link controller="country" action="index" params="[max: max, offset: offset - max]">← Назад</g:link>
        </g:if>
        <g:if test="${offset + max < total}">
            <g:link controller="country" action="index" params="[max: max, offset: offset + max]">Вперед →</g:link>
        </g:if>
    </div>

</g:if>

<g:else>
    <p>Нет стран для отображения.</p>
</g:else>

</body>
</html>
