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
    <link rel="stylesheet" href="/css/admin/user-message.css">
    <style>

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
            <ul>
                <c:forEach items="${msgList}" varStatus="i" var="msgItem">
                    <li class="msg-content-list">
                        <div class="msg-content-list-area">
                            <div class="msg-content-list-area-title">
                                <a href="/admin/personalDetail.do?id=${msgItem.getFromUserid()}" class="msg-content-list-area-title-person">${msgItem.getFromUserName()}</a>
                                <input type="hidden" id="fromUserId" name="fromUserId" value="${msgItem.getFromUserid()}">
                                回复了问题
                                <c:if test="${msgItem.getFlag() == 'replyTheme'}">
                                    <a href="/forum/fourmDetail.do?flag=msgRemind&id=${msgItem.getThemeId()}" class="msg-content-list-area-title-theme">${msgItem.getThemeName()}</a>
                                </c:if>
                                <c:if test="${msgItem.getFlag() == 'replyContent'}">
                                    <a href="/forum/forumReplyDetail.do?flag=msgRemind&themeId=${msgItem.getThemeId()}&contentId=${msgItem.getContentId()}" class="msg-content-list-area-title-theme">${msgItem.getThemeName()}</a>
                                </c:if>
                            </div>
                            <div class="msg-content-list-area-footer">
                                <c:if test="${msgItem.getReadFlag() == 'N'}">
                                    <div class="msg-content-list-area-footer-left">未读</div>
                                </c:if>
                                <c:if test="${msgItem.getReadFlag() == 'Y'}">
                                    <div class="msg-content-list-area-footer-left">已读</div>
                                </c:if>
                                <div class="msg-content-list-area-footer-right">${msgItem.getCreateTime()}</div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
<jsp:include page="/common-page/footer.jsp"/>
</body>
</html>
