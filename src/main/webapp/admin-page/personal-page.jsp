<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 13/07/2017
  Time: 23:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Personal Detail</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/js/Ajax.js"></script>
    <script type="text/javascript" src="/js/public-function.js"></script>
    <link rel="stylesheet" href="/css/search-page.css">
    <link rel="stylesheet" href="/css/forum/forum-reply-content.css">
    <link rel="stylesheet" href="/css/common-css.css">
    <link rel="stylesheet" href="/css/admin/personal-page.css">
    <style>

        
    </style>
    <script>
        $(document).ready(function(){
            $(".tab-button-forum-join").addClass("selected");
            $(".forum-join-area").css("display","block");

            $(".tab-button-forum").removeClass("selected");
            $(".forum-area").css("display","none");

            $(".tab-button-follow").removeClass("selected");
            $(".follow-area").css("display","none");

            $(".tab-button-info").removeClass("selected");
            $(".info-area").css("display","none");

            $(".tab-button-forum-join").on("click",function(){
                $(".tab-button-forum-join").addClass("selected");
                $(".forum-join-area").css("display","block");

                $(".tab-button-forum").removeClass("selected");
                $(".forum-area").css("display","none");

                $(".tab-button-follow").removeClass("selected");
                $(".follow-area").css("display","none");

                $(".tab-button-info").removeClass("selected");
                $(".info-area").css("display","none");
            })

            $(".tab-button-forum").on("click",function(){
                $(".tab-button-forum-join").removeClass("selected");
                $(".forum-join-area").css("display","none");

                $(".tab-button-forum").addClass("selected");
                $(".forum-area").css("display","block");

                $(".tab-button-follow").removeClass("selected");
                $(".follow-area").css("display","none");

                $(".tab-button-info").removeClass("selected");
                $(".info-area").css("display","none");
            })

            $(".tab-button-follow").on("click",function(){
                $(".tab-button-forum-join").removeClass("selected");
                $(".forum-join-area").css("display","none");

                $(".tab-button-forum").removeClass("selected");
                $(".forum-area").css("display","none");

                $(".tab-button-follow").addClass("selected");
                $(".follow-area").css("display","block");

                $(".tab-button-info").removeClass("selected");
                $(".info-area").css("display","none");
            })

            $(".tab-button-info").on("click",function(){
                $(".tab-button-forum-join").removeClass("selected");
                $(".forum-join-area").css("display","none");

                $(".tab-button-forum").removeClass("selected");
                $(".forum-area").css("display","none");

                $(".tab-button-follow").removeClass("selected");
                $(".follow-area").css("display","none");

                $(".tab-button-info").addClass("selected");
                $(".info-area").css("display","block");
            })

            $("#forumReloadBar").on("click",function(){
                getLoadForumByUserId(parseInt($("#forumCurrentPage").val()) + 1,$("#userId").val());
                getLoadButtonFlag4PersonalDetail(parseInt($("#forumCurrentPage").val()) + 1,'sendForumTheme',$("#userId").val(),$("#forumReloadBar"));
            })

            $("#forumJoinReloadBar").on("click",function(){
                getLoadForumJoinByUserId(parseInt($("#forumJoinCurrentPage").val()) + 1,$("#userId").val());
                getLoadButtonFlag4PersonalDetail(parseInt($("#forumJoinCurrentPage").val()) + 1,'ForumJoinTheme',$("#userId").val(),$("#forumJoinReloadBar"));
            })
        })

    </script>
</head>
<body style="padding: 0">
<jsp:include page="/common-page/fix-bar.jsp"/>
<div class="header">
    <div class="person-list-content">
        <div class="person-list-content-left">
            <img src="/images/getAvator.do?id=${userDescr.getUserid()}" alt="avatar">
            <input type="hidden" id="userId" name="userId" value="${userDescr.getUserid()}">
        </div>
        <div class="person-list-content-right">
            <div class="person-list-content-right-title">${userDescr.getUserName()}</div>
        </div>
    </div>
    <div class="person-list-footer">
        <div class="person-forum-posted">
            发帖:<span class="person-forum-count">${userDescr.getSendForum()}</span>
        </div>
        <div class="person-forum-reply">
            粉丝:<span class="person-forum-count">${userDescr.getFollowUsers().size()}</span>
        </div>
        <div class="person-forum-posted">
            积分:<span class="person-forum-count">${userDescr.getUserScore()}</span>
        </div>
    </div>
    <div class="tab-button">
        <div class="tab-button-forum-join selected"><a href="#">参与</a></div>
        <div class="tab-button-forum"><a href="#">发起</a></div>
        <div class="tab-button-follow"><a href="#">关注</a></div>
        <div class="tab-button-info"><a href="#">资料</a></div>
    </div>
</div>
<div class="content">
    <div class="forum-join-area">
        <ul>
            <c:forEach items="${forumJoinTheme}" varStatus="n" var="forumJoinItem">
                <li class="forum-join-area-list">
                    <div class="forum-join-area-block">
                        <div class="forum-join-area-block-header"><a href="/forum/fourmDetail.do?id=${forumJoinItem.getThemeRefId()}"
                                                                     target="_blank">${forumJoinItem.getThemeContent()}</a></div>
                        <div class="forum-join-area-block-content">${forumJoinItem.getContent()}</div>
                        <div class="forum-join-area-block-footer">
                            <div class="forum-join-area-block-footer-like">
                                ${forumJoinItem.getLikeCount()} 个赞同
                            </div>
                            <div class="forum-join-area-block-footer-time">
                                ${forumJoinItem.getDifferentTime()}
                            </div>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <c:if test="${forumJoinCurrentPageingFlag == 'Y'}">
            <div class="reload-bar" id="forumJoinReloadBar">更多</div>
        </c:if>
        <input type="hidden" id="forumJoinCurrentPage" name="forumJoinCurrentPage" value="${forumJoinCurrentPage}">
    </div>
    <div class="forum-area">
        <ul>
            <c:forEach items="${sendForumTheme}" varStatus="k" var="forumCurrentItem">
                <li class="forum-area-list">
                    <div class="forum-area-block">
                        <div class="forum-area-block-header"><a href="/forum/fourmDetail.do?id=${forumCurrentItem.getId()}"
                                                                     target="_blank">${forumCurrentItem.getThemeContent()}</a></div>
                        <div class="forum-area-block-content">${forumCurrentItem.getFirstForumContent().getContent()}</div>
                        <div class="forum-area-block-footer">
                            <div class="forum-area-block-footer-like">
                                ${forumCurrentItem.getReplyCount()} 个回复
                            </div>
                            <div class="forum-area-block-footer-time">
                                ${forumCurrentItem.getDifferentTime()}
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
    <div class="follow-area">
        <div class="follow-area-area">
            <div class="follow-area-header">
                关注3人
            </div>
            <div class="follow-area-content">
                <ul>
                    <c:forEach items="${followedInfo}" varStatus="i" var="item" >
                        <li class="follow-area-content-list">
                            <a href="/admin/personalDetail.do?id=${item.getFollowedUserid()}">
                                <img src="/images/getAvator.do?id=${item.getFollowedUserid()}" alt="avator">
                            </a>
                        </li>
                    </c:forEach>
                    <div class="clear"></div>
                </ul>
            </div>
        </div>
    </div>
    <div class="info-area">
        <div class="info-area-area">
            <div class="info-area-header">
                个人信息
            </div>
            <div class="info-area-content">
                <div class="info-area-location">
                    现居: ${personalInfo.getLocation()}
                </div>
                <div class="info-area-job">
                    职业: ${personalInfo.getJob()}
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/common-page/footer.jsp"/>
</body>
</html>
