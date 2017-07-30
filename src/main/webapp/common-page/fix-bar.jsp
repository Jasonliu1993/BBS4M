<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 03/06/2017
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="fix-bar">
    <span><a href="/forum/mainPage.do">主页</a></span>
    <span><a href="/topic/topicIntro.do">话题</a></span>
    <span><a href="/searchPage.do">搜索</a></span>
    <span><a href="/forum/forumPost.do">发贴</a></span>
    <c:if test="${not empty sessionScope}">
        <span><a href="/admin/userMsg.do">消息</a></span>
    </c:if>
    <c:if test="${empty sessionScope}">
        <span><a href="/login/login-page.jsp">登录</a></span>
    </c:if>
</div>
