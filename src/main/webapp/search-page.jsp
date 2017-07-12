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
    <title>Forum Detail</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/js/Ajax.js"></script>
    <script type="text/javascript" src="/js/public-function.js"></script>
    <%--<link rel="stylesheet" href="/css/forum/forum-detail.css">--%>
    <link rel="stylesheet" href="/css/forum/forum-reply-content.css">
    <link rel="stylesheet" href="/css/common-css.css">
    <style>
        .search-area {
            width: 370px;
            height: 40px;
            margin: 0 auto;
        }

        .search-area .search-input {
            width: 250px;
            height: 40px;
            float: left;
        }

        .search-area .search-input input[type='text'] {
            width: 250px;
            height: 40px;
            border: 1px solid #c4c4c4;
            border-radius: 3px;
            float: left;
            font-size: 15px;
            padding: 3px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .search-area .search-list {
            width: 75px;
            height: 40px;
            float: left;
        }

        .search-area .search-list select {
            display: inline-block;
            width: 75px;
            height: 40px;
            font-size: 17px;
            background-color: aquamarine;
        }

        .search-area .search-list option {
            display: inline-block;
            width: 45px;
            height: 40px;
            line-height: 40px;
        }

        .search-area .search-button {
            width: 45px;
            height: 40px;
            float: left;
        }

        .search-area .search-button input[type='submit'] {
            width: 45px;
            height: 40px;
            line-height: 40px;
            font-size: 17px;
            border: 1px solid #c4c4c4;
            border-radius: 3px;
            background-color: lightcoral;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content {
            width: 375px;
            margin: 5px auto;
        }

        .content ul .content-list {
            width: 360px;
            border-radius: 3px;
            margin: 10px auto;
            list-style: none;
        }

        .content ul .content-list>a{
            text-decoration: none;
            color: #c4c4c4;
        }

        .content ul .content-list .topic-list-content {
            width: 375px;
            height: 60px;
            background-color: #fff;
            border-bottom: 1px solid #CFCFCF;
        }

        .content ul .content-list .topic-list-content .topic-list-content-left {
            width: 60px;
            height: 60px;
            padding: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            border-radius: 3px;
            float: left;
        }

        .content ul .content-list .topic-list-content .topic-list-content-left img {
            width: 50px;
            height: 50px;
            border-radius: 3px;
        }

        .content ul .content-list .topic-list-content .topic-list-content-right {
            width: 300px;
            height: 60px;
            padding: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            border-radius: 3px;
            float: left;
        }

        .content ul .content-list .topic-list-content .topic-list-content-right .topic-list-content-right-title {
            height: 20px;
            line-height: 20px;
            padding-left: 3px;
            padding-right: 3px;
            display: inline-block;
            background-color: green;
            margin-left: 5px;
            text-align: center;
            margin-top: 5px;
            border-radius: 3px;
            color: #fff;
            font-size: 10px;
        }

        .content ul .content-list .topic-list-content .topic-list-content-right .topic-list-content-right-comments {
            width: 290px;
            height: 20px;
            line-height: 10px;
            margin-left: 5px;
            margin-top: 5px;
            border-radius: 3px;
            font-size: 10px;
        }

        .content ul .content-list .topic-list-footer {
            width: 375px;
            height: 30px;
            line-height: 30px;
            padding-left: 10px;
            font-size: 13px;
            background-color: #fff;
        }

        .content ul {
            width: 375px;
            list-style: none;
        }

        .content ul .content-list {
            width: 375px;
            margin: 20px auto;
        }

        .content ul .content-list .forum-list-content {
            width: 375px;
        }

        .content ul .content-list .forum-list-content .forum-list-content-title {
            height: 40px;
            line-height: 40px;
            width: 375px;
            background-color: #fff;
            border: #CFCFCF 1px solid;
            border-radius: 7px;
            font-size: 15px;
        }

        .content ul .content-list .forum-list-content .forum-list-content-title .reply-avator {
            height: 40px;
            width: 40px;
            line-height: 40px;
            display: inline-block;
            margin-left: 10px;
            float: left;
        }

        .content ul .content-list .forum-list-content .forum-list-content-title .reply-avator img {
            height: 30px;
            width: 30px;
            border: 1px solid #fff;
            border-radius: 5px;
            margin-top: 4px;
        }

        .content ul .content-list .forum-list-content .forum-list-content-title .reply-person {
            height: 40px;
            padding-right: 5PX;
            line-height: 40px;
            display: inline-block;
            float: left;
            text-align: center;
        }

        .content ul .content-list .forum-list-content .forum-list-content-title .reply-time {
            height: 40px;
            /*width: 50px;*/
            line-height: 40px;
            display: inline-block;
            margin-right: 10px;
            float: right;
        }

        .content ul .content-list .forum-list-content .forum-topic {
            height: 40px;
            line-height: 40px;
            width: 375px;
            background-color: #fff;
            border: #CFCFCF 1px solid;
            border-radius: 7px;
            font-size: 15px;
        }

        .content ul .content-list .forum-list-content .forum-topic .forum-topic-static {
            height: 40px;
            line-height: 40px;
            width: 70px;
            display: inline-block;
            margin-left: 10px;
            float: left;
            text-align: center;
        }

        .content ul .content-list .forum-list-content .forum-topic .forum-topic-dynamic {
            height: 30px;
            line-height: 30px;
            padding-left: 3px;
            padding-right: 3px;
            display: inline-block;
            background-color: green;
            margin-left: 5px;
            float: left;
            text-align: center;
            margin-top: 5px;
            border-radius: 10px;
            color: #fff;
        }

        .content ul .content-list .forum-list-content .forum-list-content-detail {
            width: 375px;
            background-color: #fff;
            border: #CFCFCF 1px solid;
            border-radius: 7px;
            font-size: 15px;
        }

        .content ul .content-list .forum-list-content .forum-list-content-detail .forum-list-content-theme {
            width: 350px;
            font-size: 15px;
            word-wrap: break-word;
            margin: 10px 10px 10px 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content ul .content-list .forum-list-content .forum-list-content-detail .forum-list-content-theme a {
            text-decoration: none;
            color: #ca0022;
        }

        .content ul .content-list .forum-list-content .forum-list-content-detail .forum-list-content-theme a:visited {
            color: #ca0022;
        }

        .content ul .content-list .forum-list-content .forum-list-content-detail .forum-list-content-content {
            width: 350px;
            font-size: 12px;
            word-wrap: break-word;
            margin: 10px 10px 10px 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content ul .content-list .forum-list-content .forum-list-content-detail .forum-list-content-pic{
            width: 250px;
            height: 300px;
            margin: 5px auto;
            border: 1px solid white;
            border-radius: 5px;
        }

        .content ul .content-list .forum-list-content .forum-list-content-detail .forum-list-content-pic img{
            width: 250px;
            height: 300px;
            border: 1px solid white;
            border-radius: 5px;
        }

        .content ul .content-list .forum-list-content .forum-list-content-footer {
            width: 375px;
            height: 40px;
            background-color: #fff;
            border: #CFCFCF 1px solid;
            border-radius: 7px;
            font-size: 15px;
        }

        .content ul .content-list .forum-list-content .forum-list-content-footer .reply-count {
            width: 100px;
            height: 40px;
            line-height: 40px;
            font-size: 15px;
            float: left;
            display: inline-block;
            margin-left: 10px;
        }

        .content ul .content-list .forum-list-content .forum-list-content-footer .follow-count {
            width: 100px;
            height: 40px;
            line-height: 40px;
            font-size: 15px;
            float: left;
            display: inline-block;
            margin-left: 10px;
        }

        .content ul .content-list .forum-list-content .forum-list-content-footer .browse-count {
            width: 100px;
            height: 40px;
            line-height: 40px;
            font-size: 15px;
            float: left;
            display: inline-block;
            margin-left: 10px;
        }

        .content ul .content-list .person-list-content {
            width: 375px;
            height: 60px;
            background-color: #fff;
        }

        .content ul .content-list .person-list-content .person-list-content-left{
            width: 60px;
            height: 60px;
            padding: 5px;
            float: left;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content ul .content-list .person-list-content .person-list-content-left img{
            width: 50px;
            height: 50px;
            border-radius: 3px;
        }

        .content ul .content-list .person-list-content .person-list-content-right{
            width: 315px;
            height: 60px;
            float: left;
        }

        .content ul .content-list .person-list-content .person-list-content-right .person-list-content-right-title{
            width: 300px;
            height: 60px;
            line-height: 60px;
        }

        .content ul .content-list .person-list-footer {
            border-top: 1px solid #c4c4c4;
            width: 375px;
            height: 40px;
            background-color: #fff;
        }

        .content ul .content-list .person-list-footer div{
            width: 100px;
            height: 40px;
            line-height: 40px;
            font-size: 15px;
            float: left;
            margin-left: 10px;
        }

        .content ul .content-list .person-list-footer div span{
            margin-left: 5px;
        }

        .reload-bar {
            width: 365px;
            height: 25px;
            line-height: 25px;
            margin: 10px auto;
            border: 1px solid #c4c4c4;
            border-radius: 5px;
            background-color: #fff;
            text-align: center;
        }
    </style>
    <script>
        function getLoadSearchTheme(currentPage,searchContent) {
            $.ajax({
                url: '/ajax/searchThemeList.do',
                type: "POST",//请求方式：get或post
                scriptCharset: 'utf-8',
                dataType: "json",//数据返回类型：xml、json、script
                cache: false,
                data: {
                    'currentPage': currentPage,
                    'searchContent': searchContent
                },//自定义提交的数据
                success: function (json) {
                    if (json !== null || json !== undefined || json !== '') {
                        var listTheme = '';
                        for (var i = 0; i < json.length; i++) {
                            listTheme = listTheme +
                                '<li class="content-list">' +
                                '<div class="forum-list-content">' +
                                '<div class="forum-list-content-title">' +
                                '<span class="reply-avator">' +
                                '<img src="/images/getAvator.do?id=' + json[i].lastReplyContent.creater + '" alt="avator"/>' +
                                '</span>' +
                                '<span class="reply-person">' +
                                json[i].lastReplyContent.userName +
                                '</span>' +
                                '回复了问题' +
                                '<span class="reply-time">' +
                                json[i].differentTime +
                                '</span>' +
                                '</div>' +
                                '<div class="forum-topic">' +
                                '<span class="forum-topic-static">来自话题</span>';

                            for (var k = 0; k < json[i].topicIncludes.length; k++) {
                                listTheme = listTheme + '<span class="forum-topic-dynamic">' + json[i].topicIncludes[k].topicName + '</span>' ;
                            }
                            listTheme = listTheme +
                                '</div>' +
                                '<div class="forum-list-content-detail">' +
                                '<div class="forum-list-content-theme">' +
                                '<a href="/forum/fourmDetail.do?id=' + json[i].id + '"  target="_blank">' + json[i].themeContent + '</a>' +
                                '</div>' +
                                '<div class="forum-list-content-content">' +
                                json[i].firstForumContent.content
                            '</div>' ;
                            if (json[i].firstForumContent.picFlag == 'Y') {
                                listTheme = listTheme +
                                    '<div class="forum-list-content-pic">' +
                                    '<img src="/images/getForumPic.do?id=' + json[i].firstForumContent.picId + '" alt="forumPic"/>' +
                                    '</div>' ;
                            }
                            listTheme = listTheme +
                                '</div>' +
                                '<div class="forum-list-content-footer">' +
                                '<span class="reply-count">回复: ' + json[i].replyCount + '</span>' +
                                '<span class="follow-count">关注: ' + json[i].followThemes.length + '</span>' +
                                '<span class="browse-count">浏览: ' + json[i].browse + '</span>' +
                                '</div>' +
                                '</div>' +
                                '</li>' ;
                        }
                        $(".content ul").append(listTheme);
                        $("#currentPage").val(parseInt($("#currentPage").val()) + 1);
                        $(".reload-bar").attr("href","#" + $("#currentPage").val());
                    }


                },
                error: function (json) {
                    alert("Request Error!")
                }
            })
        }

        $(document).ready(function () {
            $(".reload-bar").on("click",function(){
                log($("#currentPage").val() + 1);
                getLoadSearchTheme(parseInt($("#currentPage").val()) + 1,$("#searchContentReturn").val());
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
                <a href="" target="_blank">
                    <div class="topic-list-content">
                        <div class="topic-list-content-left">
                            <img src="/images/getTopicPic.do?id=0" alt="avatar">
                            <input type="hidden" id="topicId" name="topicId" value="">
                        </div>
                        <div class="topic-list-content-right">
                            <div class="topic-list-content-right-title">测试主题</div>
                            <div class="topic-list-content-right-comments">测试测试</div>
                        </div>
                    </div>
                    <div class="topic-list-footer">
                        <span class="topic-forum-count">5</span>个帖子
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
                <a href="" target="_blank">
                    <div class="person-list-content">
                        <div class="person-list-content-left">
                            <img src="/images/getTopicPic.do?id=0" alt="avatar">
                            <input type="hidden" id="userId" name="userId" value="">
                        </div>
                        <div class="person-list-content-right">
                            <div class="person-list-content-right-title">jason</div>
                        </div>
                    </div>
                    <div class="person-list-footer">
                        <div class="person-forum-posted">
                            发帖:<span class="person-forum-count">5</span>
                        </div>
                        <div class="person-forum-reply">
                            回帖:<span class="person-forum-count">5</span>
                        </div>
                        <div class="person-forum-posted">
                            积分:<span class="person-forum-count">5</span>
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
