<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 03/07/2017
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>topic intro</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/js/Ajax.js"></script>
    <script type="text/javascript" src="/js/public-function.js"></script>
    <link rel="stylesheet" href="/css/topic/topic-intro.css">
    <link rel="stylesheet" href="/css/common-css.css">
    <style>

    </style>
    <script>

    </script>
</head>
<body style="padding-top: 0;">
<jsp:include page="/common-page/fix-bar.jsp" />
<div class="header">话题</div>
<div class="content">
    <ul>
        <c:forEach items="${topicList}" varStatus="i" var="topic">
            <li class="topic-list">
                <div class="topic-list-content">
                    <div class="topic-list-content-left">
                        <img src="/images/getTopicPic.do?id=${topic.getId()}" alt="avatar">
                        <input type="hidden" id="topicId" name="topicId" value="${topic.getId()}">
                    </div>
                    <div class="topic-list-content-right">
                        <div class="topic-list-content-right-title">${topic.getTopicName()}</div>
                        <div class="topic-list-content-right-comments">${topic.getComments()}</div>
                    </div>
                </div>
                <div class="topic-list-footer">
                    <span class="topic-forum-count">${topic.getRelatedForumCount()}</span>个帖子
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
<div class="more">更多</div>
<input type="hidden" id="currentPage" name="currentPage" value="${nextpage}">
<jsp:include page="/common-page/footer.jsp" />
</body>
</html>
