<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                            <a href="/forum/fourmDetail.do?id=${coreItem.getId()}" target="_blank">${coreItem.getThemeContent()}</a>
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
<c:if test="${pagingFlag == 'Y'}">
    <%--<div class="reload-bar">点击加载</div>--%>
    <a href="#${currentPage}" class="reload-bar">更多</a>
</c:if>
<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">