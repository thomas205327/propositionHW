<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/6/6
  Time: 下午 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<!--
Linear by TEMPLATED
templated.co @templatedco
Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>命題光碟</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/skel-panels.min.js"></script>
    <script src="js/init.js"></script>
    <noscript>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-desktop.css" />
        <link rel="stylesheet" href="css/skel-noscript.css" />
<%--        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">--%>
    </noscript>
</head>
<body class="homepage">

<!-- Header -->
<div id="header">
    <div id="nav-wrapper">
        <!-- Nav -->
        <nav id="nav">
            <ul>
                <li class="active"><a href="index.html">首頁</a></li>
                <li><a href="propositionWeb">考卷匯出</a></li>
                <li><a href="questionDB">題目庫</a></li>
            </ul>
        </nav>
    </div>
    <div class="container">

        <!-- Logo -->
        <div id="logo">
            <h1><a href="#">命題光碟</a></h1>
            <span class="tag">By 暴風</span>
        </div>
    </div>
</div>

<!-- Featured -->
<div id="featured">
    <div class="container">
        <header>
            <h2>歡迎使用命題光碟</h2>
        </header>
        <p>請透過以下選項去選擇需要的功能</p>
        <hr />
        <div class="row">
            <section class="4u" style="width:50%">
                <span class="pennant">
<%--                    <span class="fa fa-briefcase"></span>--%>
                </span>
                <h3>輸出考卷</h3>
                <p>選擇年級以及科目之後，選擇你所需要的題型以及數量來繪出你的考卷</p>
                <form id="form1" action="/propositionWeb" method="get">
                    <input type="submit" class="button button-style1" value="前往命題" />
                </form>
            </section>
<%--            <section class="4u">--%>
<%--                <span class="pennant">--%>
<%--&lt;%&ndash;                    <span class="fa fa-lock"></span>&ndash;%&gt;--%>
<%--                </span>--%>
<%--                <h3>Maecenas luctus lectus</h3>--%>
<%--                <p>Donec ornare neque ac sem. Mauris aliquet. Aliquam sem leo, vulputate sed, convallis at, ultricies quis, justo. Donec magna.</p>--%>
<%--                <a href="#" class="button button-style1">Read More</a>--%>
<%--            </section>--%>
            <section class="4u" style="width:50%">
                <span class="pennant">
<%--                    <span class="fa fa-globe"></span>--%>
                </span>
                <h3>題目庫</h3>
                <p>在這裡你可以對題目庫進行<strong>新增</strong>，<strong>修改</strong>，以及<strong>刪除</strong></p>
                <form id="form2" action="/questionDB" method="get">
                    <input type="submit" class="button button-style1" value="前往題庫" />
                </form>
            </section>

        </div>
    </div>
</div>

<!-- Main -->
<%--<div id="main">--%>
<%--    <div id="content" class="container">--%>

<%--        <div class="row">--%>
<%--            <section class="6u">--%>
<%--                <a href="#" class="image full"><img src="images/pic01.jpg" alt=""></a>--%>
<%--                <header>--%>
<%--                    <h2>Mauris vulputate dolor</h2>--%>
<%--                </header>--%>
<%--                <p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat. Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum.</p>--%>
<%--            </section>--%>
<%--            <section class="6u">--%>
<%--                <a href="#" class="image full"><img src="images/pic02.jpg" alt=""></a>--%>
<%--                <header>--%>
<%--                    <h2>Mauris vulputate dolor</h2>--%>
<%--                </header>--%>
<%--                <p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat. Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum.</p>--%>
<%--            </section>--%>
<%--        </div>--%>

<%--        <div class="row">--%>
<%--            <section class="6u">--%>
<%--                <a href="#" class="image full"><img src="images/pic03.jpg" alt=""></a>--%>
<%--                <header>--%>
<%--                    <h2>Mauris vulputate dolor</h2>--%>
<%--                </header>--%>
<%--                <p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat. Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum.</p>--%>
<%--            </section>--%>
<%--            <section class="6u">--%>
<%--                <a href="#" class="image full"><img src="images/pic04.jpg" alt=""></a>--%>
<%--                <header>--%>
<%--                    <h2>Mauris vulputate dolor</h2>--%>
<%--                </header>--%>
<%--                <p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat. Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum.</p>--%>
<%--            </section>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--</div>--%>

<!-- Tweet -->
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
