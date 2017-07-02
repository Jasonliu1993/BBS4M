<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 09/06/2017
  Time: 22:18
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
    <link rel="stylesheet" href="/css/forum/forum-detail.css">
    <link rel="stylesheet" href="/css/forum/forum-reply-content.css">
    <link rel="stylesheet" href="/css/common-css.css">
    <style>

    </style>
    <script>


        $(document).ready(function() {

            if ($("#currentUser").val() == '' || $("#followedButtonFlag").val() == 'Y') {
                $(".creater-area-right-up-follow .follow-button").css({"background-color":"white", "color":"green"});
            } else {
                $(".creater-area-right-up-follow .follow-button").one("click",function(){
                    followUser($("#currentUser").val(),$("#themeCreater").val())
                })
            }

            if ($("#currentUser").val() == '' || $("#followedThemeButtonFlag").val() == 'Y') {
                $(".follow-theme-button").css({"background-color":"white", "color":"green"});
            } else {
                $(".follow-theme-button").one("click",function(){
                    followTheme($("#currentUser").val(),$("#themeId").val())
                })
            }

            $(".next-page").on("click",function(){
                log($("#currentPage").val() + 1);
                getLoadContent(parseInt($("#currentPage").val()) + 1);
                getLoadButtonFlag(parseInt($("#currentPage").val()) + 1,'content',$(".themeId").val());
            })

            $("ul").delegate(".reply-content-detail-list .reply-content-footer .reply-content-tool .reply-content-tool-reply","click",function(){
                if ($(this).parent().parent().next(".reply-area").html().trim() == '') {
                    $(".reply-area").html('');
                    log($(this).next('#replyContentId').val());
                    getReplyContent($(this),$(this).next('#replyContentId').val());
                } else {
                    $(this).parent().parent().next(".reply-area").html('');
                }
            })

            $("ul").delegate(".reply-content-detail-list .reply-area .reply-area-content .reply-area-content-reply-content .reply-area-content-button .reply-area-content-button-left button", "click", function () {
//                $(".reply-area").html('');
                $(this).parent().parent().parent().parent().parent().html('');
            });

            $("ul").delegate(".reply-content-detail-list .reply-area .reply-area-content .reply-area-content-reply-content .reply-area-content-button .reply-area-content-button-right button", "click", function () {
                if ($("#reply-content").val() == '') {
                    alert("请输入内容!")
                } else {
                    replyContentReply($("#currentUser").val(),$("#replyContentContentId").val(),$("#replyContentSubperson").val(), $("#reply-content").val())
                    $("#reply-content").val("")
                }
            });

            $(".reply-content-tool-support").on("click", function () {
                log($(this).next().next().next().val())
                setLikeAndDislike("like",$(this).next().next().next().val(),$(this))
            });

            $(".reply-content-tool-nonsupport").on("click", function () {
                setLikeAndDislike("dislike",$(this).next().next().val(),$(this))
            });

            $("ul").delegate(".reply-area-content-title-right-reply-button", "click", function () {
                log($(this).next().val())
                $("#replyContentSubperson").val($(this).next().val())
                $("#reply-content").val("@" + $(this).parent().prev().find(".reply-area-content-title-person").text() + ":");
            });

            $("ul").delegate("#reply-content", "keydown", function () {
                if ($("#reply-content").val() == '') {
                    $("#replyContentSubperson").val("");
                }
            });

        })
    </script>
</head>
<body>
<jsp:include page="/common-page/fix-bar.jsp" />
<div class="content">
    <div class="forum-core-content">
        <div class="forum-topic">
            <c:forEach items="${coreForumTheme.getTopicIncludes()}" varStatus="k" var="topicInclude">
                <span class="forum-topic-dynamic">${topicInclude.getTopicName()}</span>
            </c:forEach>
        </div>
        <div class="creater-area">
            <div class="creater-area-left">
                <img src="/images/getAvator.do?id=${coreForumTheme.getCreater()}" alt="avator"/>
            </div>
            <div class="creater-area-right">
                <div class="creater-area-right-up">
                    <span class="creater-area-left-name">${coreForumTheme.getCreaterUserAttribute().getUserName()}</span>
                    <span class="creater-area-right-up-follow">
                        <button type="button" class="follow-button">关注</button>
                        <input type="hidden" id="followedButtonFlag" name="followedButtonFlag" value="${followedButtonFlag}">
                        <input type="hidden" id="themeCreater" name="themeCreater" value="${coreForumTheme.getCreater()}">
                    </span>
                </div>
                <div class="creater-area-right-down">
                    <span class="creater-area-right-up-score">
                        积分: ${coreForumTheme.getCreaterUserAttribute().getUserScore()}
                    </span>
                    <span class="creater-area-right-up-fans">
                        粉丝: ${coreForumTheme.getCreaterUserAttribute().getFollowUsers().size()}
                    </span>
                </div>
            </div>
        </div>
        <div class="forum-list-content-theme">
            ${coreForumTheme.getThemeContent()}
        </div>
        <div class="forum-list-content-content">
            <div class="forum-list-content-content-word">
                ${coreForumTheme.getFirstForumContent().getContent()}
            </div>
            <c:if test="${coreForumTheme.getFirstForumContent().getPicFlag() == 'Y'}">
                <div class="forum-list-content-content-img">
                    <img src="/images/getForumPic.do?id=${coreForumTheme.getFirstForumContent().getPicId()}"
                         alt="forumPic"/>
                </div>
            </c:if>
        </div>

        <div class="forum-list-footer">
            <div class="reply-count">${coreForumTheme.getReplyCount()} 个回复</div>
            <div class="follow-button">
                <input type="hidden" id="followedThemeButtonFlag" name="followedThemeButtonFlag" value="${followedThemeButtonFlag}">
                <button type="button" class="follow-theme-button">关注主题</button>
            </div>
        </div>
    </div>
    <div class="reply-content">
        <ul>
            <c:forEach items="${replyForumContents}" varStatus="i" var="forumContentItem">
                <li class="reply-content-detail-list">
                    <div class="reply-personal-title">
                    <span class="reply-personal-avator">
                        <c:if test="${forumContentItem.getAnonymitye() == 'N'}">
                            <img src="/images/getAvator.do?id=${forumContentItem.getCreater()}" alt="avator"/>
                        </c:if>
                        <c:if test="${forumContentItem.getAnonymitye() == 'Y'}">
                            <img src="/images/getAvator.do?id=anonymitye" alt="avator"/>
                        </c:if>
                    </span>
                        <span class="reply-person">
                            <c:if test="${forumContentItem.getAnonymitye() == 'N'}">
                                ${forumContentItem.getUserName()}
                            </c:if>
                            <c:if test="${forumContentItem.getAnonymitye() == 'Y'}">
                                匿名
                            </c:if>
                        </span>
                    </div>
                    <div class="reply-content-detail">
                        <div class="reply-content-detail-word">
                                ${forumContentItem.getContent()}
                        </div>
                        <c:if test="${forumContentItem.getPicFlag() == 'Y'}">
                            <div class="reply-content-detail-img">
                                <img src="/images/getForumPic.do?id=${forumContentItem.getPicId()}"
                                     alt="forumPic"/>
                            </div>
                        </c:if>
                    </div>
                    <div class="reply-content-footer">
                        <div class="reply-content-tool">
                            <span class="reply-content-tool-support">赞 <span>${forumContentItem.getLikeCount()}</span></span>
                            <span class="reply-content-tool-nonsupport">踩 <span>${forumContentItem.getDislikeCount()}</span></span>
                            <span class="reply-content-tool-reply">回复 <span>${forumContentItem.getReplyCount()}</span></span>
                            <input type="hidden" id="replyContentId" value="${forumContentItem.getId()}" />
                        </div>
                        <div class="reply-content-time">${forumContentItem.getCreateTime()}</div>
                    </div>
                    <div class="reply-area"></div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <c:if test="${pagingFlag == 'Y'}">
        <a href="/forum/fourmDetailByPilot.do?id=${coreForumTheme.getId()}&currentPage=${currentPage}" class="next-page">更多</a>
    </c:if>
    <input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
    <div class="reply-input-content">
        <form action="/forum/replyTheme.do" method="post" enctype="multipart/form-data">
            <div class="reply-input-content-header">
                <div class="reply-input-content-header-left">
                    <div class="reply-header-avator">
                        <c:if test="${empty sessionScope.UserAttr}">
                            <img src="/images/avator/none.jpg" alt="none">
                        </c:if>
                        <c:if test="${not empty sessionScope.UserAttr}">
                            <img src="/images/getAvator.do?id=${PersonalSetup.getUserid()}" alt="avator"/>
                        </c:if>
                    </div>
                    <c:if test="${empty sessionScope.UserAttr}">
                        <div class="reply-header-personal">未登录</div>
                    </c:if>
                    <c:if test="${not empty sessionScope.UserAttr}">
                        <div class="reply-header-personal">${UserAttr.getUserName()}</div>
                    </c:if>
                </div>
                <div class="reply-input-content-header-right">
                    <span class="follow-theme">
                        <input type="checkbox" id="followThemeButton" name="followThemeButton"/>
                        关注问题
                    </span>
                    <span class="anonymitye-checkbox">
                        <input type="checkbox" id="anonymitye" name="anonymitye"/>
                        匿名回复
                    </span>
                </div>
            </div>
            <input type="hidden" id="currentUser" name="currentUser" value="${PersonalSetup.getUserid()}">
            <input type="hidden" id="themeId" name="themeId" value="${coreForumTheme.getId()}">
            <div class="reply-input-content-detail">
                <textarea name="replyDetail" id="replyDetail"></textarea>
            </div>
            <div class="reply-input-content-submit">
                <a href="#" class="upload-pic">上传照片</a>
                <input type="file" class="inputFile" id="uploadPic" name="uploadPic"/>

                <a href="#" class="reply-submit">回复</a>
                <input type="submit" value="回复"/>
            </div>
        </form>
    </div>
    <div class="Related-Question">
        <div class="Related-Question-title">相关问题</div>
        <div class="Related-Question-list">
            <ul>
                <c:forEach items="${relatedForum}" varStatus="k" var="relatedForumItem" >
                    <li class="Related-Question-list-theme"><a href="/forum/fourmDetail.do?=${relatedForumItem.getId()}">${relatedForumItem.getThemeContent()}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<jsp:include page="/common-page/footer.jsp" />
</body>
</html>
