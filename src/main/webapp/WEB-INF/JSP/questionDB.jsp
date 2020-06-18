<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/6/6
  Time: 下午 10:55
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
    <title>Linear by TEMPLATED</title>
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
</head>
<script>
    function upload(cmd,where) // upload img and return img_url
    {

        var id = '1573e8c523b6e8c'; // 填入 App 的 Client ID
        var token = '2288b6ecd6c0eb7545b4c083c9e0f212eb6ab9ed'; // 填入 token
        var album = '0ilnDq1'; // 若要指定傳到某個相簿，就填入相簿的 ID

        var fileTarget = "#"+cmd+where+"File";
        var file_data = $(fileTarget).prop('files')[0]; //取得上傳檔案屬性

        var settings = {
            async: true,
            crossDomain: true,
            processData: false,
            contentType: false,
            type: 'POST',
            url: 'https://api.imgur.com/3/image',
            headers: {
                Authorization: 'Bearer ' + token
            },
            mimeType: 'multipart/form-data'
        };

        var nameTarget = "#"+cmd+where+"Name";
        var descriptionTarget = "#"+cmd+where+"Description";

        var title = $(nameTarget)[0].value;
        var description = $(descriptionTarget)[0].value;

        var form = new FormData();
        form.append('image', file_data);
        form.append('title', title);
        form.append('description', description);
        form.append('album', album); // 有要指定的相簿就加這行

        settings.data = form;

        $.ajax(settings).done(function(res) {
            // console.log(res); // 可以看見上傳成功後回的值
            var img_url = JSON.parse(res).data.link;
            console.log(img_url); // ------------------------- 圖片網址
            var imgUrlTarget = "#"+cmd+where+"ImgUrl";
            $(imgUrlTarget)[0].value = img_url;
            alert('上傳完成，稍待一會兒就可以在底部的列表上看見了。')
        });

    }

    function newQuestion() {
        var question;
        if(document.getElementById("questionAdd").value == 2){
            question = "multipleChoice"
        } else if(document.getElementById("questionAdd").value == 1){
            question = "rightAndWrong"
        } else if(document.getElementById("questionAdd").value == 3){
            question = "questionsAndAnswers"
        } else {
            question = "stuffQuestion"
        }
        var requestURL = question + "/add";
        var dataJSON = {};
        if(document.getElementById("questionAdd").value == 2) {
            dataJSON["question"] = document.getElementById("question").value;
            dataJSON["answerA"] = document.getElementById("answerA").value;
            dataJSON["answerB"] = document.getElementById("answerB").value;
            dataJSON["answerC"] = document.getElementById("answerC").value;
            dataJSON["answerD"] = document.getElementById("answerD").value;
            dataJSON["answer"] = document.getElementById("answer").value;
            dataJSON["img"] = $('#img')[0].value;
            dataJSON["grade"] = document.getElementById("gradeReplace").value;
            dataJSON["subject"] = document.getElementById("subjectReplace").value;
        } else{
            dataJSON["question"] = document.getElementById("question").value;
            dataJSON["answer"] = document.getElementById("answer").value;
            dataJSON["img"] = $('#img')[0].value;
            dataJSON["grade"] = document.getElementById("gradeReplace").value;
            dataJSON["subject"] = document.getElementById("subjectReplace").value;
        }

        $.ajax({ // Use Ajax to POST data
            url: requestURL,
            data: JSON.stringify(dataJSON),
            type: "POST",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function(returnData) {
                window.alert("新增成功!");
                window.location.reload();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.status);
                console.log(thrownError);
            }
        });
    }

    function deleteQuestion() {
        var id = document.getElementById("delete").value;
        console.log(id);
        var question;
        if(document.getElementById("questionDelete").value == 2){
            question = "multipleChoice"
        } else if(document.getElementById("questionDelete").value == 1){
            question = "rightAndWrong"
        } else if(document.getElementById("questionDelete").value == 3){
            question = "questionsAndAnswers"
        } else {
            question = "stuffQuestion"
        }
        var requestURL = question + "/" + id;
        var dataJSON = {};
        dataJSON["grade"] = document.getElementById("gradeDelete").value;
        dataJSON["subject"] = document.getElementById("subjectDelete").value;


        $.ajax({ // Use Ajax to POST data
            url: requestURL,
            data: JSON.stringify(dataJSON),
            type: "DELETE",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function(returnData) {
                window.alert("刪除成功!");
                window.location.reload();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.status);
                console.log(thrownError);
                window.location.reload();
            }
        });
    }

    function replaceQuestion() {
        //需要ID  所以要先秀出所有題目

        var id = document.getElementById("replace").value;
        console.log(id);
        var question;
        if(document.getElementById("questionReplace").value == 2){
            question = "multipleChoice"
        } else if(document.getElementById("questionReplace").value == 1){
            question = "rightAndWrong"
        } else if(document.getElementById("questionReplace").value == 3){
            question = "questionsAndAnswers"
        } else {
            question = "stuffQuestion"
        }
        var requestURL = question + "/" + id;
        var dataJSON = {};
        if(document.getElementById("questionReplace").value == 2) {
            dataJSON["question"] = document.getElementById("question").value;
            dataJSON["answerA"] = document.getElementById("answerA").value;
            dataJSON["answerB"] = document.getElementById("answerB").value;
            dataJSON["answerC"] = document.getElementById("answerC").value;
            dataJSON["answerD"] = document.getElementById("answerD").value;
            dataJSON["answer"] = document.getElementById("answer").value;
            dataJSON["img"] = $('#imgReplace')[0].value;
            dataJSON["grade"] = document.getElementById("gradeAdd").value;
            dataJSON["subject"] = document.getElementById("subjectAdd").value;
        } else{
            dataJSON["question"] = document.getElementById("question").value;
            dataJSON["answer"] = document.getElementById("answer").value;
            dataJSON["img"] = $('#imgReplace')[0].value;
            dataJSON["grade"] = document.getElementById("gradeAdd").value;
            dataJSON["subject"] = document.getElementById("subjectAdd").value;
        }

        $.ajax({ // Use Ajax to POST data
            url: requestURL,
            data: JSON.stringify(dataJSON),
            type: "PUT",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function(returnData) {
                window.alert("修改成功!");
                window.location.reload();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.status);
                console.log(thrownError);
                window.location.reload();
            }
        });
    }

    function showAdd() {
        if(document.getElementById("questionAdd").value == 2){
            document.getElementById("add").innerHTML = "<h3>題目</h3><input id=\"question\" type=\"text\"/><h3>選項A</h3><input id=\"answerA\" type=\"text\"/>" +
                "<h3>選項B</h3><input id=\"answerB\" type=\"text\"/><h3>選項C</h3><input id=\"answerC\" type=\"text\"/><h3>選項D</h3><input id=\"answerD\" type=\"text\"/>" +
                "<h3>答案</h3><input id=\"answer\" type=\"text\"/>" +
                "<h3>圖片</h3><input type=\"file\" id=\"addRestFile\" />\n" +
                "<input type=\"hidden\" id=\"img\" value=\"\">\n" +
                "<input class=\"button special\" type=\"button\" value=\"上傳圖片!\"  onclick=\"upload('add','Rest')\"/>" +
                "<br><input class=\"button button-style1\" type=\"submit\" value=\"新增\" onclick=\"newQuestion()\"/>"
        } else{
            document.getElementById("add").innerHTML = "<h3>題目</h3><input id=\"question\" type=\"text\"/>"+
                "<h3>答案</h3><input id=\"answer\" type=\"text\"/>" +
                "<h3>圖片</h3><input type=\"file\" id=\"addRestFile\" />\n" +
                "<input type=\"hidden\" id=\"img\" value=\"\">\n" +
                "<input class=\"button special\" type=\"button\" value=\"上傳圖片!\"  onclick=\"upload('add','Question')\"/>" +
                "<br><input class=\"button button-style1\" type=\"submit\" value=\"新增\" onclick=\"newQuestion()\"/>"
        }
    }

    function showDelete() {
        var question;
        if(document.getElementById("questionDelete").value == 2){
            question = "multipleChoice"
        } else if(document.getElementById("questionDelete").value == 1){
            question = "rightAndWrong"
        } else if(document.getElementById("questionDelete").value == 3){
            question = "questionsAndAnswers"
        } else {
            question = "stuffQuestion"
        }
        var grade = document.getElementById("gradeDelete").value;
        var subject = document.getElementById("subjectDelete").value;
        var url = question + "/" + grade + "/" + subject; // test url
        $.ajax({
            type: "GET",
            url: url,
            dataType: "json",
            // data:restReq,
            success: function(data) {
                for(var i = 0;i< data.length;i++){
                    var questions = data[i];
                    var question = questions.question;
                    var id = questions.id;
                    console.log(questions);
                    $('#delete').append('<option value ='+id+'>'+question+'</option>');
                }
            },
            error: function () {

            }
        });
        document.getElementById("deleteText").innerHTML = "<br><input class=\"button button-style1\" type=\"submit\" value=\"刪除\" onclick=\"deleteQuestion()\"/>"
    }

    function showReplace() {
        var question;
        if(document.getElementById("questionReplace").value == 2){
            question = "multipleChoice"
        } else if(document.getElementById("questionReplace").value == 1){
            question = "rightAndWrong"
        } else if(document.getElementById("questionReplace").value == 3){
            question = "questionsAndAnswers"
        } else {
            question = "stuffQuestion"
        }
        var grade = document.getElementById("gradeReplace").value;
        var subject = document.getElementById("subjectReplace").value;
        var url = question + "/" + grade + "/" + subject; // test url
        $.ajax({
            type: "GET",
            url: url,
            dataType: "json",
            // data:restReq,
            success: function(data) {
                console.log(data);
                for(var i = 0;i< data.length;i++){
                    var questions = data[i];
                    var question = questions.question;
                    var id = questions.id;
                    console.log(questions);
                    $('#replace').append('<option value ='+id+'>'+question+'</option>');
                }
            },
            error: function () {

            }
        });
        if(document.getElementById("questionReplace").value == 2){
            document.getElementById("replaceText").innerHTML = "<h3>題目</h3><input id=\"question\" type=\"text\"/><h3>選項A</h3><input id=\"answerA\" type=\"text\"/>" +
                "<h3>選項B</h3><input id=\"answerB\" type=\"text\"/><h3>選項C</h3><input id=\"answerC\" type=\"text\"/><h3>選項D</h3><input id=\"answerD\" type=\"text\"/>" +
                "<h3>答案</h3><input id=\"answer\" type=\"text\"/>" +
                "<h3>圖片</h3><input type=\"file\" id=\"addRestFile\" />\n" +
                "<input type=\"hidden\" id=\"imgReplace\" value=\"\">\n" +
                "<input class=\"button special\" type=\"button\" value=\"上傳圖片!\"  onclick=\"upload('add','Question')\"/>" +
                "<br><input class=\"button button-style1\" type=\"submit\" value=\"修改\" onclick=\"replaceQuestion()\"/>"
        } else{
            document.getElementById("replaceText").innerHTML = "<h3>題目</h3><input id=\"question\" type=\"text\"/>"+
                "<h3>答案</h3><input id=\"answer\" type=\"text\"/>" +
                "<h3>圖片</h3><input type=\"file\" id=\"addRestFile\" />\n" +
                "<input type=\"hidden\" id=\"imgReplace\" value=\"\">\n" +
                "<input class=\"button special\" type=\"button\" value=\"上傳圖片!\"  onclick=\"upload('add','Question')\"/>" +
                "<br><input class=\"button button-style1\" type=\"submit\" value=\"修改\" onclick=\"replaceQuestion()\"/>"
        }
    }

</script>
<body>

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
            <h1><a href="#">題目庫</a></h1>
            <span class="tag">By 暴風</span>
        </div>
    </div>
</div>
<!-- Header -->

<!-- Main -->
<div id="main">
    <div id="content" class="container">
        <section>
            <header>
                <h2>新增</h2>
                <span class="byline">選擇好年級、科目、題目類別後進行新增</span>
            </header>
                <select id="gradeAdd">
                    <option value="國一">國一</option>
                    <option value="國二">國二</option>
                    <option value="國三">國三</option>
                </select>
                <select id="subjectAdd">
                    <option value="國文">國文</option>
                    <option value="英文">英文</option>
                    <option value="數學">數學</option>
                    <option value="社會">社會</option>
                    <option value="自然">自然</option>
                </select>
                <select id="questionAdd">
                    <option value="1">是非題</option>
                    <option value="2">選擇題</option>
                    <option value="3">問答題</option>
                    <option value="4">填充題</option>
                </select>
            <br>
                <input class="button button-style1" value="確定" onclick="showAdd()"/>
            <br><br>
            <p id = "add">

            </p>
            <header>
                <h2>刪除</h2>
                <span class="byline">選擇好年級、科目、題目類別後進行刪除</span>
            </header>
            <select id="gradeDelete">
                <option value="國一">國一</option>
                <option value="國二">國二</option>
                <option value="國三">國三</option>
            </select>
            <select id="subjectDelete">
                <option value="國文">國文</option>
                <option value="英文">英文</option>
                <option value="數學">數學</option>
                <option value="社會">社會</option>
                <option value="自然">自然</option>
            </select>
            <select id="questionDelete">
                <option value="1">是非題</option>
                <option value="2">選擇題</option>
                <option value="3">問答題</option>
                <option value="4">填充題</option>
            </select>
            <br>
            <input class="button button-style1" value="確定" onclick="showDelete()"/>
            <br><br>
            <select id = "delete">

            </select>
            <p id = "deleteText">

            </p>
            <br><br>
            <header>
                <h2>修改</h2>
                <span class="byline">選擇好年級、科目、題目類別後進行修改</span>
            </header>
            <select id="gradeReplace">
                <option value="國一">國一</option>
                <option value="國二">國二</option>
                <option value="國三">國三</option>
            </select>
            <select id="subjectReplace">
                <option value="國文">國文</option>
                <option value="英文">英文</option>
                <option value="數學">數學</option>
                <option value="社會">社會</option>
                <option value="自然">自然</option>
            </select>
            <select id="questionReplace">
                <option value="1">是非題</option>
                <option value="2">選擇題</option>
                <option value="3">問答題</option>
                <option value="4">填充題</option>
            </select>
            <br>
            <input class="button button-style1" value="確定" onclick="showReplace()"/>
            <br><br>
            <select id = "replace">

            </select>
            <p id = "replaceText">

            </p>
        </section>
    </div>
</div>
<!-- /Main -->

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
