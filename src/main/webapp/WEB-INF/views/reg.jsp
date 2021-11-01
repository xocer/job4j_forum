<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>

    <script>
        function checkLog() {
            if (validate()) {
                $('#reg_form').submit();
            }
        }

        function validate() {
            let flag = true;
            let name = $('#name').val();
            let password = $('#password').val();

            if (name === '') {
                alert($('#name').attr('title'));
                flag = false;
            }
            if (password === '') {
                alert($('#password').attr('title'));
                flag = false;
            }
            return flag;
        }
    </script>

    <title>Регистрация</title>
</head>
<body>
<div class="container pt-3">
    <div class="row">
        <div class="card" style="width: 100%">
            <div class="card-header">
                <h4>Создание нового аккаунта</h4>
            </div>
            <div class="card-body">
                <form id='reg_form' action="<c:url value='/reg'/>" method='POST'>
                    <input type="hidden" name="authority" value="1">
                    <input type="hidden" name="enabled" value="true">

                    <div class="form-group">
                        <label for="username">Имя пользователя:</label>
                        <input type="text" class="form-control" name="username" id="username" title="Вы не ввели имя">
                    </div>
                    <div class="form-group">
                        <label for="password">Пароль:</label>
                        <input type="password" class="form-control" name="password" id="password" title="Вы не ввели пароль">
                    </div>
                    <button type="button" onclick="checkLog();" class="btn btn-primary">Создать аккаунт</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>