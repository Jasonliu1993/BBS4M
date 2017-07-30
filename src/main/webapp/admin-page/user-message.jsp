<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 25/06/2017
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>消息中心</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/js/Ajax.js"></script>
    <script type="text/javascript" src="/js/public-function.js"></script>
    <link rel="stylesheet" href="/css/common-css.css">
    <style>
        .selected {
            border-bottom: 2px solid green;
        }

        .header {
            height: 40px;
            width: 375px;
            margin: 0 auto;
            background-color: #fff;
        }

        .header div{
            width: 50%;
            height: 40px;
            float: left;
            text-align: center;
        }

        .header div a{
            display: inline-block;
            width: 80%;
            height: 40px;
            line-height: 40px;
            margin: 0 auto;
            text-align: center;
            text-decoration: none;
            color: #c4c4c4;
        }

        .content {
            width: 375px;
            margin: 0 auto;
        }

        .content .forum-content ul {
            list-style: none;
        }

        .content .forum-content ul .forum-join-area-list {
            width: 375px;
            margin: 10px auto;
        }

        .content .forum-content ul .forum-join-area-list .forum-join-area-block {
            width: 375px;
            padding: 5px;
            margin: 0 auto;
            background-color: #fff;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .forum-content ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-header {
            width: 365px;
            margin: 0 auto;
        }

        .content .forum-content ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-header a {
            display: inline-block;
            width: 365px;
            margin: 0 auto;
            padding: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            color: #cd3046;
            text-decoration: none;
        }

        .content .forum-content ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-content {
            border-top: 1px solid #c4c4c4;
            width: 365px;
            padding: 5px;
            margin: 0 auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            color: #c4c4c4;
        }

        .content .forum-content ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-footer {
            border-top: 1px solid #c4c4c4;
            width: 365px;
            margin: 0 auto;
            padding: 5px;
            margin: 0 auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .forum-content ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-footer {
            width: 365px;
            height: 40px;
            padding: 5px;
            margin: 0 auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .forum-content ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-footer .forum-join-area-block-footer-like{
            width: 100px;
            height: 29px;
            line-height: 29px;
            font-size: 15px;
            float: left;
        }

        .content .forum-content ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-footer .forum-join-area-block-footer-time{
            width: 100px;
            height: 29px;
            line-height: 29px;
            font-size: 15px;
            text-align: right;
            float: right;
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


        $(Document).ready(function () {
            var pageFlag = $("#pageFlag").val();
            if (pageFlag == 'userMsg') {
                $(".newest-message-font").addClass("selected");
                $(".msg-font").removeClass("selected");
                $(".forum-content").css("display","block");
                $(".msg-content").css("display","none");
            } else {
                $(".newest-message-font").removeClass("selected");
                $(".msg-font").addClass("selected");
                $(".forum-content").css("display","none");
                $(".msg-content").css("display","block");
            }

            $("#forumReloadBar").on("click",function(){
                getLoadForumByUserId(parseInt($("#forumCurrentPage").val()) + 1,$("#userId").val());
                getLoadButtonFlag(parseInt($("#forumCurrentPage").val()) + 1, "ForumTheme", $("#userId").val());
            })
        })
    </script>
</head>
<body style="padding: 0">
    <jsp:include page="/common-page/fix-bar.jsp"/>
    <div class="header">
        <div class="newest-message">
            <a class="newest-message-font" href="/admin/userMsg.do">最新动态</a>
        </div>
        <div class="msg">
            <a class="msg-font" href="/admin/userMsgNote.do">消息通知</a>
        </div>
        <input type="hidden" id="pageFlag" name="pageFlag" value="${pageFlag}">
        <input type="hidden" id="userId" name="userId" value="${sessionScope.get("UserAttr").getUserid()}">
    </div>
    <div class="content">
        <div class="forum-content">
            <ul>
                <c:forEach items="${forumTheme}" varStatus="n" var="forumItem">
                    <li class="forum-join-area-list">
                        <div class="forum-join-area-block">
                            <div class="forum-join-area-block-header">
                                <a href="/forum/fourmDetail.do?id=${forumItem.getThemeRefId()}" target="_blank">
                                        ${forumItem.getThemeContent()}
                                </a>
                            </div>
                            <div class="forum-join-area-block-content">${forumItem.getContent()}</div>
                            <div class="forum-join-area-block-footer">
                                <div class="forum-join-area-block-footer-like">
                                        ${forumItem.getLikeCount()} 个赞同
                                </div>
                                <div class="forum-join-area-block-footer-time">
                                        ${forumItem.getDifferentTime()}
                                </div>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <c:if test="${forumCurrentPageingFlag == 'Y'}">
                <div class="reload-bar" id="forumReloadBar">更多</div>
            </c:if>
            <input type="hidden" id="forumCurrentPage" name="forumCurrentPage" value="${forumCurrentPage}">
        </div>
        <div class="msg-content">

        </div>
    </div>
</body>
</html>
