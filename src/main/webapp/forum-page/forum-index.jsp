<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 01/06/2017
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/css/common-css.css">
    <link rel="stylesheet" href="/css/forum/forum-index.css">
    <style>


    </style>
</head>
<body>
<jsp:include page="/common-page/fix-bar.jsp" />
<div class="search-bar">
    <input type="text" name="searchContent" id="searchContent" value=""/>
</div>
<div class="slid-page">
    <ul>
        <li class="slid-item"><a href=""><img src="/images/slid-pic/pic01.jpg" alt="images"></a></li>
        <li class="slid-item"><a href=""><img src="/images/slid-pic/pic02.jpg" alt="images"></a></li>
        <li class="slid-item"><a href=""><img src="/images/slid-pic/pic03.jpg" alt="images"></a></li>
        <li class="slid-item"><a href=""><img src="/images/slid-pic/pic04.jpg" alt="images"></a></li>
        <li class="slid-item"><a href=""><img src="/images/slid-pic/pic01.jpg" alt="images"></a></li>
    </ul>
</div>
<div class="content">
    <div class="forum-core">
        <ul>
            <c:forEach items="${coreList}" varStatus="i" var="coreItem">
                <li class="forum-list">
                <div class="forum-list-content">
                    <div class="forum-list-content-title">
                            <span class="reply-avator">
                                <img src="/images/getAvator.do?id=${coreItem.getLastReplyContent().getCreater()}" alt="avator"/>
                            </span>
                        <span class="reply-person">
                                ${coreItem.getLastReplyContent().getUserName()}
                            </span>
                        回复了问题
                        <span class="reply-time">
                              ${coreItem.getDifferentTime()}
                            </span>
                    </div>
                    <div class="forum-topic">
                            <span class="forum-topic-static">来自话题</span>
                        <c:forEach items="${coreItem.getTopicIncludes()}" varStatus="k" var="topic" >
                            <span class="forum-topic-dynamic">${topic.getTopicName()}</span>
                        </c:forEach>
                    </div>
                    <div class="forum-list-content-detail">
                        <div class="forum-list-content-theme">
                            <a href="/forum/fourmDetail.do?id=${coreItem.getId()}">${coreItem.getThemeContent()}</a>
                        </div>
                        <div class="forum-list-content-content">
                                ${coreItem.getFirstForumContent().getContent()}
                        </div>
                        <c:if test="${coreItem.getFirstForumContent().getPicFlag() == 'Y'}">
                            <div class="forum-list-content-pic">
                                <img src="/images/getForumPic.do?id=${coreItem.getFirstForumContent().getPicId()}"
                                     alt="forumPic"/>
                            </div>
                        </c:if>
                    </div>
                    <div class="forum-list-content-footer">
                        <span class="reply-count">回复: ${coreItem.getReplyCount()}</span>
                        <span class="follow-count">关注: ${coreItem.getFollowThemes().size()}</span>
                        <span class="browse-count">浏览: ${coreItem.getBrowse()}</span>
                    </div>
                </div>
            </li>
            </c:forEach>
        </ul>
    </div>
    <div class="reload-bar">点击加载</div>
</div>
<jsp:include page="/common-page/footer.jsp" />
</body>
</html>

