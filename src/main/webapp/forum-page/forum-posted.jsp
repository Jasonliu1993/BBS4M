<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 09/07/2017
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forum posted</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <META HTTP-EQUIV="pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <META HTTP-EQUIV="expires" CONTENT="0">
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/js/public-function.js"></script>
    <script type="text/javascript" src="/js/Ajax.js"></script>
    <link rel="stylesheet" href="/css/common-css.css">
    <link rel="stylesheet" href="/css/forum/forum-post.css">
    <style>

    </style>
    <script>
        $(document).ready(function () {
            $(".forum-topic-area-content-core").delegate(".forum-topic-name", "click", function () {
                log("here");
                log("topicId:" + $(this).next().val())
                removeTopicId($(this).next().val(),$(this))
            });

            $(".forum-topic-area-list").delegate(".forum-topic-name-list", "click", function () {
                log("here");
                log("topicId:" + $(this).next().val())
                addTopicId($(this).text(),$(this).next().val())
                $("#filledBlock").val('')
                $(".forum-topic-area-list ul").children().remove();
            });

            $("#filledBlock").on("keydown keypress keyup",function(){
                if ($("#filledBlock").val() == null || $("#filledBlock").val() == '') {
                   $(".forum-topic-area-list ul").children().remove();
                } else {
                    $(".forum-topic-area-list ul").children().remove();
                    selectTopic($("#filledBlock").val())
                }
            })
        })
    </script>
</head>
<body style="padding: 0">
<div class="header">
    <div class="header-avatar">
        <c:if test="${empty sessionScope.UserAttr}">
            <img src="/images/avator/none.jpg" alt="none">
        </c:if>
        <c:if test="${not empty sessionScope.UserAttr}">
            <img src="/images/getAvator.do?id=${PersonalSetup.getUserid()}" alt="avator"/>
        </c:if>
    </div>
    <div class="header-name">
        <c:if test="${empty sessionScope.UserAttr}">
            <div class="reply-header-personal">未登录</div>
        </c:if>
        <c:if test="${not empty sessionScope.UserAttr}">
            <div class="reply-header-personal">${UserAttr.getUserName()}</div>
        </c:if>
    </div>
</div>
<div class="content">
    <form action="/forum/forumPosted.do" method="post" enctype="multipart/form-data">
        <div class="forum-topic-area">
            <span class="forum-topic-area-description">所属话题</span>
            <span class="forum-topic-area-content">
                <span class="forum-topic-area-content-core">
                    <input type="hidden" id="topicId" name="topicId" value="">
                    <textarea name="filledBlock" id="filledBlock" class="filled-block"></textarea>
                </span>
                <span class="forum-topic-area-list">
                    <ul>

                    </ul>
                </span>
            </span>
        </div>
        <div class="forum-theme-area">
            <span class="forum-theme-area-description">主题</span>
            <span class="forum-theme-area-content">
                <input type="text" id="forumTheme" name="forumTheme">
            </span>
        </div>
        <div class="forum-content-area">
            <textarea name="forumContent" id="forumContent" class="forum-content-content-core"
                      placeholder="请输入帖子详细内容!~"></textarea>
        </div>
        <div class="forum-button-area">
            <a href="#" class="upload-pic">上传照片</a>
            <input type="file" class="inputFile" id="uploadPic" name="uploadPic"/>

            <a href="#" class="submit-button">发布</a>
            <input type="submit" value="回复"/>
        </div>
    </form>
</div>
<jsp:include page="/common-page/fix-bar.jsp"/>
</body>
</html>
