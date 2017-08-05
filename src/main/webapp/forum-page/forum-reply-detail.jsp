<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 05/08/2017
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>forum reply detail</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/js/Ajax.js"></script>
    <script type="text/javascript" src="/js/public-function.js"></script>
    <link rel="stylesheet" href="/css/forum/forum-detail.css">
    <link rel="stylesheet" href="/css/forum/forum-reply-content.css">
    <link rel="stylesheet" href="/css/common-css.css">
    <style>

        .header {
            width: 375px;
            margin: 0 auto;
        }

        .header .theme-descr {
            width: 375px;
            height: 40px;
            line-height: 29px;
            padding: 5px;
            margin: 0 auto;
            background-color: #fff;
            border-bottom: 1px solid #c4c4c4;
            font-size: 19px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .header .theme-descr a {
            text-decoration: none;
            color: #cd3046;
        }

        .header .theme-content-descr {
            width: 375px;
            margin: 5px auto;
            background-color: #fff;
            border-bottom: 1px solid #c4c4c4;
        }

        .header .theme-content-descr .theme-content-descr-header{
            width: 375px;
            height: 40px;
            margin: 0 auto;
            border-bottom: 1px solid #c4c4c4;
        }

        .header .theme-content-descr .theme-content-descr-header .theme-content-descr-header-pic{
            width: 40px;
            height: 40px;
            margin-left: 5px;
            padding: 5px;
            float: left;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .header .theme-content-descr .theme-content-descr-header .theme-content-descr-header-pic img{
            width: 30px;
            height: 30px;
            float: left;
            border-radius: 3px;
        }

        .header .theme-content-descr .theme-content-descr-header .theme-content-descr-header-name{
            width: 330px;
            height: 40px;
            line-height: 40px;
            padding-left: 10px;
            float: left;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .header .theme-content-descr .theme-content-descr-header .theme-content-descr-header-name a{
            text-decoration: none;
            color: #c4c4c4;
            font-size: 17px;
        }

        .header .theme-content-descr .theme-content-descr-content {
            width: 375px;
            padding: 5px;
        }

        .content ul {
            width: 375px;
            margin: 0 auto;
            list-style: none;
        }

        .content ul .reply-area-core-content-list .reply-area-core-content .reply-area-content-title{
            width: 375px;
            margin: 0 auto;
            overflow: hidden;
        }

        .content ul .reply-area-core-content-list .reply-area-core-content .reply-area-content-title .reply-area-content-title-left{
            display: inline-block;
            width: 150px;
            height: 30px;
            float: left;
        }
        .content ul .reply-area-core-content-list .reply-area-core-content .reply-area-content-title .reply-area-content-title-left .reply-area-content-title-avater{
            display: inline-block;
            width: 30px;
            height: 30px;
            border: 1px solid #c4c4c4;
            border-radius: 5px;
            margin-left: 5px;
            float: left;
        }
        .content ul .reply-area-core-content-list .reply-area-core-content .reply-area-content-title .reply-area-content-title-left .reply-area-content-title-avater img{
            display: inline-block;
            width: 30px;
            height: 30px;
            border: 1px solid #c4c4c4;
            border-radius: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content ul .reply-area-core-content-list .reply-area-core-content .reply-area-content-title .reply-area-content-title-left .reply-area-content-title-person{
            display: inline-block;
            width: 30px;
            height: 30px;
            line-height: 30px;
            margin-left: 5px;
            float: left;
        }

        .content ul .reply-area-core-content-list .reply-area-core-content .reply-area-content-title .reply-area-content-title-left .reply-area-content-title-person a{
            text-decoration: none;
            color: white;
        }

        .content ul .reply-area-core-content-list .reply-area-core-content .reply-area-content-title .reply-area-content-title-right{
            display: inline-block;
            width: 220px;
            height: 30px;
            line-height: 30px;
            float: right;
            font-size: 13px;
            text-align: right;
            margin-right: 5px;
        }

        .content ul .reply-area-core-content-list .reply-area-core-content .reply-area-content-content{
            width: 355px;
            margin: 5px auto;
            font-size: 12px;
            color: black;
            border-bottom: 1px solid #AFAFAF;
            padding-bottom: 5px;
        }

        .inputArea {
            width: 375px;
            margin: 0 auto;
        }

        .inputArea input[type='text']{
            margin-left: 5px;
            width: 330px;
            height: 25px;
            line-height: 21px;
            padding: 1px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            border-radius: 3px;
            border: 1px solid white;
        }

        .inputArea input[type='submit']{
            width: 30px;
            height: 25px;
            line-height: 21px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            border-radius: 3px;
            border: 1px solid green;
            background-color: green;
            color: white;
        }

    </style>
    <script>
    </script>
</head>
<body style="padding: 0">
<jsp:include page="/common-page/fix-bar.jsp"/>
<div class="header">
    <div class="theme-descr">
        主题: 
        <a href="/forum/fourmDetail.do?id=aSLi9G6ItFE" target="_blank">星期天</a>
    </div>
    <div class="theme-content-descr">
        <div class="theme-content-descr-header">
            <div class="theme-content-descr-header-pic">
                <img src="/images/avator/none.jpg" alt="avator">
            </div>
            <div class="theme-content-descr-header-name">
                <a href="#">vera</a>
            </div>
        </div>
        <div class="theme-content-descr-content">这是一个测试</div>
    </div>
</div>
<div class="content">
    <ul>
        <li class="reply-area-core-content-list">
            <div class="reply-area-core-content">
                <div class="reply-area-content-title">
                    <span class="reply-area-content-title-left">
                        <span class="reply-area-content-title-avater">
                            <img src="/images/getAvator.do?id=' + currentUser + '"/>
                        </span>
                        <span class="reply-area-content-title-person">
                           <a href="#">jason</a>
                        </span>
                    </span>
                    <span class="reply-area-content-title-right">
                        <span class="reply-area-content-title-right-time">2017-01-01</span>
                        <span class="reply-area-content-title-right-reply-button">回复</span>
                        <input type="hidden" id="replyContentPersonId" name="replyContentPersonId" value="test">
                    </span>
                </div>
                <div class="reply-area-content-content">
                    replyContent
                </div>
            </div>
        </li>
        <li class="reply-area-core-content-list">
            <div class="reply-area-core-content">
                <div class="reply-area-content-title">
                    <span class="reply-area-content-title-left">
                        <span class="reply-area-content-title-avater">
                            <img src="/images/getAvator.do?id=' + currentUser + '"/>
                        </span>
                        <span class="reply-area-content-title-person">
                           <a href="#">jason</a>
                        </span>
                    </span>
                    <span class="reply-area-content-title-right">
                        <span class="reply-area-content-title-right-time">2017-01-01</span>
                        <span class="reply-area-content-title-right-reply-button">回复</span>
                        <input type="hidden" id="replyContentPersonId" name="replyContentPersonId" value="test">
                    </span>
                </div>
                <div class="reply-area-content-content">
                    replyContent
                </div>
            </div>
        </li>
    </ul>
</div>
<div class="inputArea">
    <form action="">
        <input type="text" id="replyContent" name="replyContent">
        <input type="submit" id="submitButton" name="submitButton" value="回复">
    </form>
</div>
<jsp:include page="/common-page/footer.jsp"/>
</body>
</html>
