<%@ page import="ru.iwishyoujoy.web_lab_2.Subscribers" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
<html lang="ru">
    <head>

        <meta charset="utf-8">
        <meta name="author" content="Darya Skvortsova">
        <meta name="description" content="second lab work for web-programming">
        <meta name="viewport" content="width=device-width, initial-scale=0.9, user-scalable=0">

        <title>Лабораторная работа №2</title>

        <link href='appearance/style.css' rel='stylesheet'>
        <link href='appearance/favicon.ico' rel='icon'>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <script src="js/validator.js"></script>
        <script src="js/updater.js"></script>
        <script src="js/clearTable.js"></script>
        <script src="js/graphHadler.js"></script>

    </head>
    
    <body>
        <div class="container">
            <nav>
                <a class='pointer' href="https://github.com/iwishyoujoy/web-lab-2">Исходный код</a>
                &nbsp &nbsp &nbsp
                <a class='pointer' href="https://iwishyoujoy.ru">Моё портфолио</a>
                &nbsp &nbsp &nbsp
                <a class='pointer' href="https://t.me/itmoru">"Корень из ИТМО"</a>: <%=Subscribers.getCountTelegram()%>
            </nav>
            <div id="description">
                Скворцова Дарья P32101 Вариант 10006
                &nbsp &nbsp &nbsp
                <a class='pointer' href="https://vk.com/iwishyoujoy_photo">i wish you joy</a>: <%=Subscribers.getCountVk()%>

            </div>
            <div id="data-container">
                <form novalidate onsubmit="getDataFromForm(); return false;">
                    
                    <label for='X'>Введите X (-3; 5):</label>
                    <input class='X-text' id='X' name='X' type='number' step='0.00000001' maxlength='10' required>
                    
                    <br>
                    <br>

                    <label for='Y'>Выберите Y:</label>
                    <select class='Y-text pointer' id='Y' name='Y' required>
                        <option value='не выбран' selected>не выбран</option>
                        <option value='-2'>-2</option>
                        <option value='-1.5'>-1.5</option>
                        <option value='-1'>-1</option>
                        <option value='-0.5'>-0.5</option>
                        <option value='0'>0</option>
                        <option value='0.5'>0.5</option>
                        <option value='1'>1</option>
                        <option value='1.5'>1.5</option>
                        <option value='2'>2</option>
                    </select>

                    <br>
                    <br>

                    <label for='R'>Введите R (2; 5):</label>
                    <input class='R-text' id='R' name='R' type="number" step="0.00000001" maxlength="10" required>
                    
                    <br>
                    <br>

                    <input class='pointer' id='check' name='check' type='submit' value='Проверить'>

                    <div id="validationInfo" class="validationInfo">
                    </div>

                </form>
            </div>
            <div id="graphics-container">
                
                <svg class='graphics pointer' id="graphics" width="300px" height="300px" onclick="svgHandler(event)">
                    <!-- Координатные оси -->
                    <line x1="0" x2="300" y1="150" y2="150" stroke="#000000"></line>
                    <line x1="150" x2="150" y1="0" y2="300" stroke="#000000"></line>

                    <!--Стрелки-->
                    <polygon id="arrow" points="150,0 145,10 155,10" stroke="#000000"></polygon>
                    <polygon id="arrow" points="300,150 290,145 290,155" stroke="#000000"></polygon>

                    <!--Треугольник во второй четверти-->
                    <polygon points="150,150 150,50 100,150"></polygon>

                    <!--Прямоугольник в четвертой четверти-->
                    <polygon points="150,150 250,150 250,200 150,200"></polygon>

                    <!--Четверть круга в первой четверти-->
                    <path d="M150,100 A50,50 90 0,1 200,150 L 150,150 Z"></path>

                    <!-- Метки для значений R на оси X -->
                    <line x1="50" x2="50" y1="145" y2="155" stroke="#000000"></line>
                    <line x1="100" x2="100" y1="145" y2="155" stroke="#000000"></line>
                    <line x1="200" x2="200" y1="145" y2="155" stroke="#000000"></line>
                    <line x1="250" x2="250" y1="145" y2="155" stroke="#000000"></line>

                    <!-- Метки для значений R на оси Y -->
                    <line x1="145" x2="155" y1="50" y2="50" stroke="#000000"></line>
                    <line x1="145" x2="155" y1="100" y2="100" stroke="#000000"></line>
                    <line x1="145" x2="155" y1="200" y2="200" stroke="#000000"></line>
                    <line x1="145" x2="155" y1="250" y2="250" stroke="#000000"></line>

                    <!-- Подписи к осям -->
                    <text x="290" y="140">X</text>
                    <text x="155" y="10">Y</text>

                    <!-- Значения R на оси X -->
                    <text x="40" y="138">-R</text>
                    <text x="85" y="138">-R/2</text>
                    <text x="190" y="138">R/2</text>
                    <text x="245" y="138">R</text>

                    <!-- Значения R на оси Y -->
                    <text x="162" y="54">R</text>
                    <text x="162" y="104">R/2</text>
                    <text x="162" y="204">-R/2</text>
                    <text x="162" y="254">-R</text>

                    <%--@elvariable id="dots" type="ru.iwishyoujoy.web_lab_2.model.DotCollectionManager"--%>
                    <c:forEach items="${dots.collection}" var="col">
                        <circle class="dot" cx="${150 + 50 * 2/col.r * col.x}"
                                cy="${150 - 50 * 2/col.r * col.y}" r="3"
                                fill="#000000" stroke-width="0"></circle>
                    </c:forEach>
                </svg>
            </div>
            <div id="results-container">
                <div id="results-buttons">
                    <button class='pointer' id='prevResult' onClick="window.location.replace('result.jsp');" type="reset" onclick="">Последний результат</button>
                    &nbsp &nbsp &nbsp
                    <input class='pointer' id='clear' name='clear' type='button' value='Очистить таблицу' onclick='clearTable()'>
                </div>
                <div id="results-table">
                    <table id="results">
                        <tr>
                            <th>X</th>
                            <th>Y</th>
                            <th>R</th>
                            <th>Текущее время</th>
                            <th>Время работы программы (мкс)</th>
                            <th>Результат</th>
                        </tr>
                        <%--@elvariable id="dots" type="ru.iwishyoujoy.web_lab_2.model.DotCollectionManager"--%>
                        <c:forEach items="${dots.collection}" var="col">
                            <tr>
                                <td>${col.x.toString().format("%.2f", col.x)}</td>
                                <td>${col.y.toString().format("%.2f", col.y)}</td>
                                <td>${col.r.toString().trim().format("%.2f", col.r)}</td>
                                <td>${col.time.toString()}</td>
                                <td>${col.scriptTime.toString()}</td>
                                <td>${col.status.toString()}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <footer>
                <img src="appearance/itmo.png">
            </footer>
        </div>
    </body>


</html>
        