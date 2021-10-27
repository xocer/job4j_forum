<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Форум job4j</title>
</head>
<body>
<div class="container mt-3">
    <div style="text-align: right">
        <strong>${user.username} | </strong>
        <a class="btn btn-link btn-sm" href="<c:url value='/logout'/>">Выйти</a>
    </div>
    <div>
        <h2 style="text-align: center">Форум job4j</h2>
    </div>
    <br>
    <div class="row">
        <input type="button" class="btn btn-primary" value="Создать новый пост"
                onclick="window.location.href = '/create'">
    </div>
    <br>
    <div class="row">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Тема</th>
                <th scope="col">Описание</th>
                <th scope="col">Автор</th>
                <th scope="col">Дата создания</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${posts}" var="post">
                <c:url var="editButton" value="/edit">
                    <c:param name="id" value="${post.id}"/>
                </c:url>
                <c:url var="delete" value="/delete">
                    <c:param name="id" value="${post.id}"/>
                </c:url>
                <tr>
                    <td><c:out value="${post.name}"/></td>
                    <td><c:out value="${post.description}"/></td>
                    <td><c:out value="${post.user.getUsername()}"/></td>
                    <td><fmt:formatDate value="${post.created}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                        <c:if test="${user.authorities == '[ROLE_ADMIN]' || (post.user.username == user.username && user.authorities == '[ROLE_USER]')}">
                            <input type="button" class="btn btn-primary" value="Обновить"
                                   onclick="window.location.href = '${editButton}'">
                            <input type="button" class="btn btn-danger" value="Удалить"
                                   onclick="window.location.href = '${delete}'">
                        </c:if>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>
</html>