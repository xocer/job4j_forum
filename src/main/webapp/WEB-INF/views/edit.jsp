<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <!-- Bootstrap CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"
            type="text/javascript"></script>

    <title>Редактировать</title>
</head>
<body>
<div class="container pt-3">
    <div style="text-align: right">
        <strong>${user.username} | </strong>
        <a class="btn btn-link btn-sm" href="<c:url value='/logout'/>">Выйти</a>
    </div>
    <div class="row">
        <div class="card" style="width: 100%">
            <div>
                <c:if test="${post.id == null}">
                    <h2>Создание поста</h2>
                </c:if>
                <c:if test="${post.id != null}">
                    <h2>Изменение поста</h2>
                </c:if>
            </div>

            <form action="<c:url value='/save'/>" method="post">

                <input type="hidden" name="id" value="${post.id}">
                <input type="hidden" name="user" value="${user.id}">

                <div class="form-group">
                    <label for="name">Название</label>
                    <input type="text" class="form-control" name="name" id="name" value="${post.name}">
                </div>

                <div class="form-group">
                    <label for="description">Описание</label>
                    <input class="form-control" name="description" id="description" value="${post.description}"></input>
                </div>

                <c:if test="${post.id == null}">
                    <button type="submit" class="btn btn-success">Создать</button>
                </c:if>
                <c:if test="${post.id != null}">
                    <button type="submit" class="btn btn-success">Изменить</button>
                </c:if>
                <input type="button" class="btn btn-primary" value="Главная"
                       onclick="window.location.href = '/'">
            </form>
        </div>
    </div>
</div>
</body>
</html>
