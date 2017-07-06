<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 05/07/2017
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>topic detail</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/js/Ajax.js"></script>
    <script type="text/javascript" src="/js/public-function.js"></script>
    <link rel="stylesheet" href="/css/common-css.css">
    <link rel="stylesheet" href="/css/forum/forum-theme-core.css">
    <style>
        .header {
            width: 375px;
            height: 100px;
            margin: 0 auto;
            border-bottom: 1px solid black;
            background-color: #fff;
        }

        .header .header-up {
            width: 375px;
            height: 60px;
            margin: 0 auto;
            border-bottom: 1px solid #cfcfcf;
        }

        .header .header-up .header-left{
            width: 60px;
            height: 60px;
            float: left;
        }

        .header .header-up .header-left img{
            width: 50px;
            height: 50px;
            padding: 5px;
            border-radius: 3px;
        }

        .header .header-up .header-right{
            width: 310px;
            height: 60px;
            float: right;
        }

        .header .header-up .header-right .header-right-up{
            height: 30px;
            line-height: 30px;
            font-weight: bold;
            color: black;
        }

        .header .header-up .header-right .header-right-down{
            height: 22px;
            line-height: 22px;
            font-size: 12px;
        }

        .header .header-down {
            width: 375px;
            height: 40px;
            margin: 0 auto;
        }

        .header .header-down .topic-forum{
            display: inline-block;
            width: 50%;
            height: 40px;
            line-height: 40px;
            float: left;
            text-align: center;
            color: black;
            cursor: pointer;
        }

        .header .header-down .topic-comments{
            display: inline-block;
            width: 50%;
            height: 40px;
            line-height: 40px;
            float: left;
            text-align: center;
            color: black;
            cursor: pointer;
        }

        .content {
            width: 375px;
            margin: 0 auto;
        }

        .topic-comments-core {
            width: 375px;
            margin: 10px auto;
            padding: 10px;
            word-wrap: break-word;
            background-color: #fff;
            color: black;
            border-radius: 3px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
    </style>
    <script>
        $(document).ready(function(){
            $(".topic-forum").css({"border-bottom": "2px solid green"});
            $(".topic-comments-core").css({"display": "none"});

            $(".reload-bar").on("click",function(){
                getLoadTheme(parseInt($("#currentPage").val()) + 1,$("#topicId").val());
                getLoadButtonFlag(parseInt($("#currentPage").val()) + 1,'topicForum',$("#topicId").val());
                log($("#currentPage").val())
            })

            $(".topic-forum").on("click",function(){
                $(".topic-forum").css({"border-bottom": "2px solid green"});
                $(".topic-comments").css({"border-bottom": "none"});
                $(".topic-comments-core").css({"display": "none"});
                $(".topic-forum-core").css({"display": "block"});
            })
            $(".topic-comments").on("click",function(){
                $(".topic-forum").css({"border-bottom": "none"});
                $(".topic-comments").css({"border-bottom": "2px solid green"});
                $(".topic-comments-core").css({"display": "block"});
                $(".topic-forum-core").css({"display": "none"});
            })
        })
    </script>
</head>
<body style="padding-top: 0">
<jsp:include page="/common-page/fix-bar.jsp"/>
<div class="header">
    <div class="header-up">
        <div class="header-left">
            <img src="/images/getTopicPic.do?id=${topic.getId()}" alt="topic">
            <input type="hidden" id="topicId" name="topicId" value="${topic.getId()}">
        </div>
        <div class="header-right">
            <div class="header-right-up">
                ${topic.getTopicName()}
            </div>
            <div class="header-right-down">
                <span>${topic.getRelatedForumCount()}</span>个帖子
            </div>
        </div>
    </div>
    <div class="header-down">
        <div class="header-down-select-button">
            <span class="topic-forum">相关帖子</span>
            <span class="topic-comments">话题详述</span>
        </div>
    </div>
</div>
<div class="content">
    <div class="topic-forum-core">
        <jsp:include page="/forum-page/forum-theme-core.jsp"/>
    </div>
    <div class="topic-comments-core">
        ${topic.getComments()}
    </div>
</div>
<jsp:include page="/common-page/footer.jsp" />
</body>
</html>
