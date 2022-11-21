<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="author" content="Darya Skvortsova">
        <meta name="description" content="second lab work for web-programming">
        <meta name="viewport" content="width=device-width, initial-scale=0.9, user-scalable=0">

        <title>Лабораторная работа №2</title>

        <link href='appearance/style.css' rel='stylesheet'>
        <link href='appearance/favicon.ico' rel='icon'>

        <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>--%>

        <script src="js/validator.js"></script>
        <script src="js/updater.js"></script>
        <script src="js/clearTable.js"></script>
        <script src="js/graphHadler.js"></script>
    </head>
    <body>
    <div class="back-container">
        <div class="prev-result-container">
            <div id="back-button">
                <button class='pointer' id='prevResult' onClick="window.location.replace('index.jsp');" type="reset" onclick="">Назад</button>
            </div>
            <div id="prev-result-table">
                <table id="results">
                    <tr>
                        <th>X</th>
                        <th>Y</th>
                        <th>R</th>
                        <th>Текущее время</th>
                        <th>Время работы программы (мкс)</th>
                        <th>Результат</th>
                    </tr>
                    <%--@elvariable id="dots" type="java.util.LinkedList"--%>
                    <tr>
                        <c:choose>
                            <c:when test="${dots.size()>0}">
                                <td>${dots.getLast().getX().toString().format("%.2f", dots.getLast().getX()).replaceAll(",",".")}</td>
                                <td>${dots.getLast().getY().toString().format("%.2f", dots.getLast().getY()).replaceAll(",",".")}</td>
                                <td>${dots.getLast().getR().toString().format("%.2f", dots.getLast().getR()).replaceAll(",",".")}</td>
                                <td>${dots.getLast().getTime().toString()}</td>
                                <td>${dots.getLast().getScriptTime().toString()}</td>
                                <td>${dots.getLast().getStatus().toString()}</td>
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </table>
            </div>
        </div>
        <footer>
            <img src="appearance/itmo.png">
        </footer>
    </div>
    </body>
</html>