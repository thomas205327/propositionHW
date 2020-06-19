<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/6/6
  Time: 下午 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
Linear by TEMPLATED
templated.co @templatedco
Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>propositionWeb</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/skel-panels.min.js"></script>
    <script src="js/init.js"></script>
    <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-desktop.css" />
    </noscript>
    <style type="text/css">

        nav1 {
            background-color: #000;
            display: block;
            padding: 1em 0;
            text-align: center;
            width: 750px;
        }

        nav1 a {
            color: #fff;
            margin: 0 1em;
            text-decoration: none;
        }

        .scrolling-box {
            scroll-behavior: auto;
            scroll-behavior: smooth;
            background-color: #eaeaea;
            display: block;
            height: 500px;
            overflow-y: scroll;
            scroll-behavior: smooth;
            text-align: left;
            width: 750px;
        }

        section1 {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }

        .module {
            scroll-behavior: smooth;
        }

    </style>
</head>
<script>
    var point = 0;
    var questionType;
    var questionsForQuestionAndAnswers = new Array();
    var questionsForMultipleChoice = new Array();
    var questionsForRightAndWrong = new Array();
    var questionsForStuffQuestion = new Array();

    function gotoTestPaper() {
        localStorage.setItem("questionsAndAnswers",JSON.stringify(questionsForQuestionAndAnswers));
        localStorage.setItem("multipleChoice",JSON.stringify(questionsForMultipleChoice));
        localStorage.setItem("rightAndWrong",JSON.stringify(questionsForRightAndWrong));
        localStorage.setItem("stuffQuestion",JSON.stringify(questionsForStuffQuestion));
        window.alert("儲存成功!");
        // var requestURL = "/propositionWeb/testPaper";
        // var dataJSON = {};
        //
        // dataJSON["questionsAndAnswers"] = questionsForQuestionAndAnswers;
        // dataJSON["multipleChoice"] = questionsForMultipleChoice;
        // dataJSON["rightAndWrong"] = questionsForRightAndWrong;
        // dataJSON["stuffQuestion"] = questionsForStuffQuestion;
        //
        // console.log(JSON.stringify(dataJSON));
        //
        // $.ajax({ // Use Ajax to POST data
        //     url: requestURL,
        //     data: JSON.stringify(dataJSON),
        //     type: "POST",
        //     dataType: "json",
        //     contentType: "application/json;charset=utf-8",
        //     success: function(returnData) {
        //         window.alert("Success!");
        //     },
        //     error: function(xhr, ajaxOptions, thrownError) {
        //         console.log(xhr.status);
        //         console.log(thrownError);
        //     }
        // });
    }
    
    function deleteQuestion() {
        if(questionType == "選擇題"){
            var multipleChoice = document.getElementById("MultipleChoice").value;
            for(var i = 0;i<multipleChoice;i++){
                var questions = questionsForMultipleChoice[i];
                if(questions.id == point){
                    questionsForMultipleChoice = questionsForMultipleChoice.splice(i,1);
                    document.getElementById("MultipleChoice").value = document.getElementById("MultipleChoice").value - 1;
                    break;
                }
            }
        }else if(questionType == "填充題"){
            var stuffQuestion = document.getElementById("StuffQuestion").value;
            for(var i = 0;i<stuffQuestion;i++){
                var questions = questionsForStuffQuestion[i];
                if(questions.id == point){
                    questionsForStuffQuestion = questionsForStuffQuestion.splice(i,1);
                    document.getElementById("StuffQuestion").value = document.getElementById("StuffQuestion").value - 1;
                    break;
                }
            }
        }else if(questionType == "問答題"){
            var questionsAndAnswers = document.getElementById("QuestionsAndAnswers").value;
            for(var i = 0;i<questionsAndAnswers;i++){
                var questions = questionsForQuestionAndAnswers[i];
                if(questions.id == point){
                    questionsForQuestionAndAnswers = questionsForQuestionAndAnswers.splice(i,1);
                    document.getElementById("QuestionsAndAnswers").value = document.getElementById("QuestionsAndAnswers").value - 1;
                    break;
                }
            }
        }else if(questionType == "是非題"){
            var rightAndWrong = document.getElementById("RightAndWrong").value;
            for(var i = 0;i<rightAndWrong;i++){
                var questions = questionsForRightAndWrong[i];
                if(questions.id == point){
                    questionsForRightAndWrong = questionsForRightAndWrong.splice(i,1);
                    document.getElementById("RightAndWrong").value = document.getElementById("RightAndWrong").value - 1;
                    break;
                }
            }
        }
        preview();
    }
    
    function pointChange(id, type) {
        var idText = id.split("questionId");
        point = idText[1];
        questionType = type;
    }

    function preview() {
        $('#QuestionsAndAnswersShow').empty();
        $('#MultipleChoiceShow').empty();
        $('#RightAndWrongShow').empty();
        $('#StuffQuestionShow').empty();
        var multipleChoice = document.getElementById("MultipleChoice").value;
        var rightAndWrong = document.getElementById("RightAndWrong").value;
        var questionGroup = document.getElementById("QuestionGroup").value;
        var questionsAndAnswers = document.getElementById("QuestionsAndAnswers").value;
        var stuffQuestion = document.getElementById("StuffQuestion").value;

        //進資料庫拿資料
        var grade = document.getElementById("grade").value;
        var subject = document.getElementById("subject").value;

        const urlQuestionsAndAnswers = "/questionsAndAnswers/"+grade + "/" + subject; // test url
        $.ajax({
            type: "GET",
            url: urlQuestionsAndAnswers,
            dataType: "json",
            // data:restReq,
            success: function(data) {
                while(questionsForQuestionAndAnswers.length < questionsAndAnswers) {
                    var temp = data[parseInt(Math.random()*data.length)];
                    var b = false;
                    var text = questionsForQuestionAndAnswers.length + 1;
                    for(var i=0;i<text;i++){
                        if(questionsForQuestionAndAnswers[i] == temp){
                            b = true;
                            break;
                        }
                        if(b == false){
                            questionsForQuestionAndAnswers[questionsForQuestionAndAnswers.length] = temp;
                        }
                    }
                }
                for(var i = 0;i< questionsForQuestionAndAnswers.length;i++){
                    // var questions = data[i];
                    var type = "問答題";//20
                    var question = questionsForQuestionAndAnswers[i].question;
                    var id = questionsForQuestionAndAnswers[i].id;
                    console.log(questionsForQuestionAndAnswers);
                    var questionId = "questionId" + id;
                    $('#QuestionsAndAnswersShow').append('<button value ='+id+'  style="width:750px;text-align:left;" onclick=pointChange("'+questionId+'","'+type+'")>'+type+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+question+'</button>');
                    //$('#QuestionsAndAnswersShow').append('<li value ='+id+'>'+type+""+question+'</li>');
                }
            },
            error: function () {

            }
        });

        const urlMultipleChoice = "/multipleChoice/"+grade + "/" + subject; // test url
        $.ajax({
            type: "GET",
            url: urlMultipleChoice,
            dataType: "json",
            // data:restReq,
            success: function(data) {
                while(questionsForMultipleChoice.length < multipleChoice) {
                    var temp = data[parseInt(Math.random()*data.length)];
                    var b = false;
                    var text = questionsForMultipleChoice.length + 1;
                    for(var i=0;i<text;i++){
                        if(questionsForMultipleChoice[i] == temp){
                            b = true;
                            break;
                        }
                        if(b == false){
                            questionsForMultipleChoice[questionsForMultipleChoice.length] = temp;
                        }
                    }
                }
                for(var i = 0;i< questionsForMultipleChoice.length;i++){
                    var type = "選擇題";//14
                    var question = questionsForMultipleChoice[i].question;
                    var id = questionsForMultipleChoice[i].id;
                    var questionId = "questionId" + id;
                    console.log(questionsForMultipleChoice);
                    $('#MultipleChoiceShow').append('<button value ='+id+'  style="width:750px;text-align:left;" onclick=pointChange("'+questionId+'","'+type+'")>'+type+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+question+'</button>');
                }
            },
            error: function () {

            }
        });

        const urlRightAndWrong = "/rightAndWrong/"+grade + "/" + subject; // test url
        $.ajax({
            type: "GET",
            url: urlRightAndWrong,
            dataType: "json",
            // data:restReq,
            success: function(data) {
                while(questionsForRightAndWrong.length < rightAndWrong) {
                    var temp = data[parseInt(Math.random()*data.length)];
                    var b = false;
                    var text = questionsForRightAndWrong.length + 1;
                    for(var i=0;i<text;i++){
                        if(questionsForRightAndWrong[i] == temp){
                            b = true;
                            break;
                        }
                        if(b == false){
                            questionsForRightAndWrong[questionsForRightAndWrong.length] = temp;
                        }
                    }
                }
                for(var i = 0;i< questionsForRightAndWrong.length;i++){
                    var type = "是非題";//13
                    var question = questionsForRightAndWrong[i].question;
                    var id = questionsForRightAndWrong[i].id;
                    var questionId = "questionId" + id;
                    console.log(questionsForRightAndWrong);
                    $('#RightAndWrongShow').append('<button value ='+id+'  style="width:750px;text-align:left;" onclick=pointChange("'+questionId+'","'+type+'")>'+type+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+question+'</button>');
                }
            },
            error: function () {

            }
        });

        const urlStuffQuestion = "/stuffQuestion/"+grade + "/" + subject; // test url
        $.ajax({
            type: "GET",
            url: urlStuffQuestion,
            dataType: "json",
            // data:restReq,
            success: function(data) {
                while(questionsForStuffQuestion.length < stuffQuestion) {
                    var temp = data[parseInt(Math.random()*data.length)];
                    var b = false;
                    var text = questionsForStuffQuestion.length + 1;
                    for(var i=0;i<text;i++){
                        if(questionsForStuffQuestion[i] == temp){
                            b = true;
                            break;
                        }
                        if(b == false){
                            questionsForStuffQuestion[questionsForStuffQuestion.length] = temp;
                        }
                    }
                }
                for(var i = 0;i< questionsForStuffQuestion.length;i++){
                    var type = "填充題";//13
                    var question = questionsForStuffQuestion[i].question;
                    var id = questionsForStuffQuestion[i].id;
                    var questionId = "questionId" + id;
                    console.log(questionsForStuffQuestion);
                    $('#StuffQuestionShow').append('<button value ='+id+'  style="width:750px;text-align:left;" onclick=pointChange("'+questionId+'","'+type+'")>'+type+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+question+'</button>');
                }
            },
            error: function () {

            }
        })

        //準備跑for 讓下面表格有東西

    }
</script>
<body>

<!-- Header -->
<div id="header">
    <div id="nav-wrapper">
        <!-- Nav -->
        <nav id="nav">
            <ul>
                <li class="active"><a href="/">首頁</a></li>
                <li><a href="propositionWeb">考卷匯出</a></li>
                <li><a href="questionDB">題目庫</a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="container">

        <!-- Logo -->
        <div id="logo">
            <h1><a href="#">考卷匯出</a></h1>
            <span class="tag">By 暴風</span>
        </div>
    </div>
</div>
<!-- Header -->

<!-- Main -->
<div id="main">
    <div class="container" align="center">
        <div class="row">

            <!-- Sidebar -->
            <div id="sidebar" class="4u">
                <section>
                    <header align="left">
                        <h2>題型數量選擇</h2>
                    </header>
                    <div class="row">
                        <section class="4u">
                            <ul class="default">
                                <li>
                                    <p>科目：</p>
                                    <select id="grade">
                                        <option value="國一">國一</option>
                                        <option value="國二">國二</option>
                                        <option value="國三">國三</option>
                                    </select>
                                </li>
                                <li>
                                    <p>年級：</p>
                                    <select id="subject">
                                        <option value="國文">國文</option>
                                        <option value="英文">英文</option>
                                        <option value="數學">數學</option>
                                        <option value="社會">社會</option>
                                        <option value="自然">自然</option>
                                    </select>
                                </li>
                                <li><p>選擇題題數：</p><input type="number" id="MultipleChoice" name="MultipleChoice" value="0"/></li>
                                <li><p>是非題題數：</p><input type="number" id="RightAndWrong" name="RightAndWrong" value="0"/></li>
                                <li><p>題組題題數：</p><input type="number" id="QuestionGroup" name="QuestionGroup" value="0"/></li>
                                <li><p>問答題題數：</p><input type="number" id="QuestionsAndAnswers" name="QuestionsAndAnswers" value="0"/></li>
                                <li><p>填充題題數：</p><input type="number" id="StuffQuestion" name="StuffQuestion" value="0"/></li>
                                <li><p>預覽題目：</p>
                                    <input type="button" class="button button-style1" value="右側預覽" onclick="preview()"/>
                                </li>
                            </ul>
                        </section>
                    </div>
                </section>
            </div>

            <!-- Content -->
            <div id="content" class="8u skel-cell-important">
                <section>
                    <header>
                        <h2>選擇的題目</h2>
                        <span class="byline">你能在下方表格進行題目的刪減</span>
                    </header>

                        <nav1>
                            <a href="#MultipleChoice">MultipleChoice</a>
                            <a href="#QuestionsAndAnswers">QuestionsAndAnswers</a>
                            <a href="#RightAndWrong">RightAndWrong</a>
                            <a href="#StuffQuestion">StuffQuestion</a>
                        </nav1>
                        <div class="scrolling-box">
                            <section1 id="MultipleChoice">
                                <ul class="scroller" id="MultipleChoiceShow">
<%--                                    <li>This is a list item</li>--%>
                                </ul>
                            </section1>
                            <section1 id="QuestionsAndAnswers">
                                <ul class="scroller" id="QuestionsAndAnswersShow">
                                    <%--                                    <li>This is a list item</li>--%>
                                </ul>
                            </section1>
                            <section1 id="RightAndWrong">
                                <ul class="scroller" id="RightAndWrongShow">
                                    <%--                                    <li>This is a list item</li>--%>
                                </ul>
                            </section1>
                            <section1 id="StuffQuestion">
                                <ul class="scroller" id="StuffQuestionShow">
                                    <%--                                    <li>This is a list item</li>--%>
                                </ul>
                            </section1>
                        </div>
                    <input type="button" class="button button-style1" value="刪除點選的題目" onclick="deleteQuestion()"/>
                    <input type="button" class="button button-style1" value="儲存考卷題目資訊" onclick="gotoTestPaper()"/>
                </section>
            </div>
        </div>


        <form id="form1" action="/propositionWeb/testPaperView" method="get">
            <input type="submit" class="button button-style1" value="前往考卷頁面" />
        </form>
    </div>
</div>
<!-- /Main -->

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
