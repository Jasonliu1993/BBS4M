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

            $(".next-page").on("click",function(){
                log($("#currentPage").val() + 1);
                getLoadContent(parseInt($("#currentPage").val()) + 1);
                getLoadButtonFlag(parseInt($("#currentPage").val()) + 1,'content',$(".themeId").val());
            })

            $("ul").delegate(".reply-content-detail-list .reply-content-footer .reply-content-tool .reply-content-tool-reply","click",function(){
                if ($(".reply-area").html().trim() == '') {
                    log($(this).next('#replyContentId').val());
                    getReplyContent($(this),$(this).next('#replyContentId').val());
                } else {
                    $(".reply-area").html('');
                }
            })

            $("ul").delegate(".reply-content-detail-list .reply-area .reply-area-content .reply-area-content-reply-content .reply-area-content-button .reply-area-content-button-left button", "click", function () {
                $(".reply-area").html('');
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
                <input type="hidden" id="themeId" name="themeId" value="${coreForumTheme.getId()}">
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
                        <img src="/images/getAvator.do?id=${forumContentItem.getCreater()}" alt="avator"/>
                    </span>
                        <span class="reply-person">
                                ${forumContentItem.getUserName()}
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
                            <span class="reply-content-tool-support">赞 ${forumContentItem.getLikeCount()}</span>
                            <span class="reply-content-tool-nonsupport">踩 ${forumContentItem.getDislikeCount()}</span>
                            <span class="reply-content-tool-reply">回复 ${forumContentItem.getReplyCount()}</span>
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
        <a href="/forum/fourmDetailByPilot.do?id=${coreForumTheme.getId()}&currentPage=${currentPage}" class="next-page">下一页</a>
    </c:if>
    <input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
    <div class="reply-input-content">
        <form action="" method="post">
            <div class="reply-input-content-header">
                <div class="reply-input-content-header-left">
                    <div class="reply-header-avator">
                        <img src="/images/avator/avatar01.jpg" alt="avator"/>
                    </div>
                    <div class="reply-header-personal">Jason</div>
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
            <div class="reply-input-content-detail">
                <textarea name="replyDetail" id="replyDetail"></textarea>
            </div>
            <div class="reply-input-content-submit">
                <a href="#" class="upload-pic">上传照片</a>
                <input type="file" value="上传照片" class="inputFile"/>

                <a href="#" class="reply-submit">回复</a>
                <input type="button" value="回复"/>
            </div>
        </form>
    </div>
    <div class="Related-Question">
        <div class="Related-Question-title">相关问题</div>
        <div class="Related-Question-list">
            <ul>
                <li class="Related-Question-list-theme"><a href="#">相关主题</a></li>
                <li class="Related-Question-list-theme"><a href="#">相关主题</a></li>
            </ul>
        </div>
    </div>
</div>
<jsp:include page="/common-page/footer.jsp" />
</body>
</html>
