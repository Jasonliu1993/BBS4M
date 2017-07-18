<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 12/07/2017
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Page</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/js/Ajax.js"></script>
    <script type="text/javascript" src="/js/public-function.js"></script>
    <link rel="stylesheet" href="/css/search-page.css">
    <link rel="stylesheet" href="/css/forum/forum-reply-content.css">
    <link rel="stylesheet" href="/css/common-css.css">
    <style>

    </style>
    <script>
        $(document).ready(function () {
            $("#searchContent").val($("#searchContentReturn").val());

            $(".reload-bar").on("click",function(){
                log($("#currentPage").val() + 1);
                if ($("#type").val() == "searchForum") {
                    getLoadSearchTheme(parseInt($("#currentPage").val()) + 1,$("#searchContentReturn").val());
                } else if ($("#type").val() == "searchTopic") {
                    getLoadSearchTopic(parseInt($("#currentPage").val()) + 1,$("#searchContentReturn").val());
                } else if ($("#type").val() == "searchPerson") {
                    getLoadSearchPerson(parseInt($("#currentPage").val()) + 1,$("#searchContentReturn").val());
                }
                getLoadButtonFlag(parseInt($("#currentPage").val()) + 1,$("#type").val(),$("#searchContentReturn").val());
            })
        })
    </script>
</head>
<body>
<jsp:include page="/common-page/fix-bar.jsp"/>
<div class="search-area">
    <form action="/searchResult.do" method="post">
        <div class="search-input">
            <input type="text" id="searchContent" name="searchContent">
        </div>
        <div class="search-list">
            <select name="searchList" id="searchList">
                <option value="searchForum">帖子</option>
                <option value="searchTopic">话题</option>
                <option value="searchPerson">找人</option>
            </select>
        </div>
        <div class="search-button">
            <input type="submit" value="搜索"/>
        </div>
    </form>
</div>
<div class="content">
    <ul>
        <c:forEach items="${model}" varStatus="i" var="item">
            <c:if test="${type == 'searchTopic'}" >
                <li class="content-list">
                    <a href="/topic/topic-detail.do?id=${item.getId()}" target="_blank">
                        <div class="topic-list-content">
                            <div class="topic-list-content-left">
                                <img src="/images/getTopicPic.do?id=${item.getId()}" alt="avatar">
                                <input type="hidden" id="topicId" name="topicId" value="${item.getId()}">
                            </div>
                            <div class="topic-list-content-right">
                                <div class="topic-list-content-right-title">${item.getTopicName()}</div>
                                <div class="topic-list-content-right-comments">${item.getComments()}</div>
                            </div>
                        </div>
                        <div class="topic-list-footer">
                            <span class="topic-forum-count">${item.getRelatedForumCount()}</span>个帖子
                        </div>
                    </a>
                </li>
            </c:if>
            <c:if test="${type == 'searchForum'}" >
                <li class="content-list">
                <div class="forum-list-content">
                    <div class="forum-list-content-title">
                                <span class="reply-avator">
                                    <img src="/images/getAvator.do?id=${item.getLastReplyContent().getCreater()}" alt="avator"/>
                                </span>
                        <span class="reply-person">
                            ${item.getLastReplyContent().getUserName()}
                        </span>
                        回复了问题
                        <span class="reply-time">
                            ${item.getDifferentTime()}
                        </span>
                    </div>
                    <div class="forum-topic">
                        <span class="forum-topic-static">来自话题</span>
                        <c:forEach items="${item.getTopicIncludes()}" varStatus="k" var="topic" >
                            <span class="forum-topic-dynamic">${topic.getTopicName()}</span>
                        </c:forEach>
                    </div>
                    <div class="forum-list-content-detail">
                        <div class="forum-list-content-theme">
                            <a href="/forum/fourmDetail.do?id=${item.getId()}" target="_blank">${item.getThemeContent()}</a>
                        </div>
                        <div class="forum-list-content-content">
                            ${item.getFirstForumContent().getContent()}
                        </div>
                        <c:if test="${item.getFirstForumContent().getPicFlag() == 'Y'}">
                            <div class="forum-list-content-pic">
                                <img src="/images/getForumPic.do?id=${item.getFirstForumContent().getPicId()}"
                                     alt="forumPic"/>
                            </div>
                        </c:if>
                    </div>
                    <div class="forum-list-content-footer">
                        <span class="reply-count">回复: ${item.getReplyCount()}</span>
                        <span class="follow-count">关注: ${item.getFollowThemes().size()}</span>
                        <span class="browse-count">浏览: ${item.getBrowse()}</span>
                    </div>
                </div>
            </li>
            </c:if>
            <c:if test="${type == 'searchPerson'}" >
                <li class="content-list">
                    <a href="/admin/personalDetail.do?id=${item.getUserid()}" target="_blank">
                        <div class="person-list-content">
                            <div class="person-list-content-left">
                                <img src="/images/getAvator.do?id=${item.getUserid()}" alt="avatar">
                                <input type="hidden" id="userId" name="userId" value="${item.getUserid()}">
                            </div>
                            <div class="person-list-content-right">
                                <div class="person-list-content-right-title">${item.getUserName()}</div>
                            </div>
                        </div>
                        <div class="person-list-footer">
                            <div class="person-forum-posted">
                                发帖:<span class="person-forum-count">${item.getSendForum()}</span>
                            </div>
                            <div class="person-forum-reply">
                                粉丝:<span class="person-forum-count">${item.getFollowUsers().size()}</span>
                            </div>
                            <div class="person-forum-posted">
                                积分:<span class="person-forum-count">${item.getUserScore()}</span>
                            </div>
                        </div>
                    </a>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</div>
<c:if test="${pagingFlag == 'Y'}">
    <div class="reload-bar">更多</div>
</c:if>
<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
<input type="hidden" id="type" name="type" value="${type}">
<input type="hidden" id="searchContentReturn" name="searchContentReturn" value="${searchContent}">
<jsp:include page="/common-page/footer.jsp"/>
</body>
</html>
