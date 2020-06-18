<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/6/6
  Time: 下午 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
Linear by TEMPLATED
templated.co @templatedco
Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>考卷</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" href="https://127.0.0.1:8088/css/style.css" />
    <link rel="stylesheet" href="https://127.0.0.1:8088/css/style-desktop.css" />
    <link rel="stylesheet" href="https://127.0.0.1:8088/css/skel-noscript.css" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="http://127.0.0.1:8088/js/skel.min.js"></script>
    <script src="http://127.0.0.1:8088/js/skel-panels.min.js"></script>
    <script src="http://127.0.0.1:8088/js/init.js"></script>
<%--    <noscript>--%>

        <%--        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">--%>
<%--    </noscript>--%>
</head>
<body>

<!-- Header -->
<!-- Header -->
<script>

    window.onload=function ShowQuestion() {
        console.log("進來了");
        document.getElementById("multipleChoice").innerHTML = "";
        for(var i=0;i<JSON.parse(localStorage.getItem('multipleChoice')).length;i++) {
            document.getElementById("multipleChoice").innerHTML += "" + i+1 +"、"+ JSON.parse(localStorage.getItem('multipleChoice'))[i].question +
                "<br>(A)" + JSON.parse(localStorage.getItem('multipleChoice'))[i].answerA + "&nbsp;&nbsp;(B)" + JSON.parse(localStorage.getItem('multipleChoice'))[i].answerB + "&nbsp;&nbsp;(C)"
                + JSON.parse(localStorage.getItem('multipleChoice'))[i].answerC + "&nbsp;&nbsp;(D)" + JSON.parse(localStorage.getItem('multipleChoice'))[i].answerD + "&nbsp;&nbsp;<br>"
        }

        document.getElementById("rightAndWrong").innerHTML = "";
        for(var i=0;i<JSON.parse(localStorage.getItem('rightAndWrong')).length;i++) {
            document.getElementById("rightAndWrong").innerHTML += "" + i+1 +"、(&nbsp;)"+ JSON.parse(localStorage.getItem('rightAndWrong'))[i].question +"<br>";
        }

        document.getElementById("questionsAndAnswers").innerHTML = "";
        for(var i=0;i<JSON.parse(localStorage.getItem('questionsAndAnswers')).length;i++) {
            document.getElementById("questionsAndAnswers").innerHTML += "" + i+1 +"、"+ JSON.parse(localStorage.getItem('questionsAndAnswers'))[i].question +"<br><br><br>";
        }

        document.getElementById("stuffQuestion").innerHTML = "";
        for(var i=0;i<JSON.parse(localStorage.getItem('stuffQuestion')).length;i++) {
            document.getElementById("stuffQuestion").innerHTML += "" + i+1 +"、"+ JSON.parse(localStorage.getItem('stuffQuestion'))[i].question +"<br>";
        }
    }
</script>
<!-- Main -->
<div id="main" onload="ShowQuestion()">
    <div class="container" align="center">
        <div class="row">

            <!-- Content -->
            <div id="content" class="6u skel-cell-important">
                <section>
                    <header>
                        <span class="byline">一、選擇題</span>
                    </header>
                    <p id="multipleChoice">

                    </p>
                </section>
                <section>
                    <header>
                        <span class="byline">二、是非題</span>
                    </header>
                    <p id="rightAndWrong">

                    </p>
                </section>
            </div>

            <!-- Sidebar -->
            <div id="sidebar" class="6u">
                <section>
                    <header>
                        <span class="byline">三、問答題</span>
                    </header>
                    <p id="questionsAndAnswers">

                    </p>
                </section>
                <section>
                    <header>
                        <span class="byline">四、填充題</span>
                    </header>
                    <p id="stuffQuestion">

                    </p>
                </section>
            </div>

        </div>
    </div>
</div>

<div id="tweet">
    <div class="container">
        <section>
            <blockquote>&ldquo;學而思補習班&rdquo;</blockquote>
        </section>
    </div>
</div>

<!-- Footer -->
<div id="footer">
    <div class="container">
        <section>
            <header>
                <h2>聯繫我們</h2>
                <span class="byline">學而思補習班</span>
            </header>
            <ul class="contact">
                <li><img src="images/facebook.png" alt=""><span>Facebook</span></li>
            </ul>
        </section>
    </div>
</div>

<!-- Copyright -->
<div id="copyright">
    <div class="container">
        Design: <a href="http://templated.co">暴風</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
    </div>
</div>


</body>
</html>
