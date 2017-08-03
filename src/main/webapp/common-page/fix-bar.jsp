<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 03/06/2017
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">
    /*var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket("ws://localhost:8080/MessageRemind");
    }
    else {
        alert('当前浏览器 Not support websocket')
    }

    //连接发生错误的回调方法
    websocket.onerror = function () {
//        setMessageInnerHTML("WebSocket连接发生错误");
    };

    //连接成功建立的回调方法
    websocket.onopen = function () {
//        setMessageInnerHTML("WebSocket连接成功");
    }

    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        addFlag();
    }

    //连接关闭的回调方法
    websocket.onclose = function () {
//        setMessageInnerHTML("WebSocket连接关闭");
    }

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    }

    //设置消息提醒标志
    function addFlag() {
        $("#point").css("background-color", "red");
    }

    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }*/
</script>



<div class="fix-bar">
    <span><a href="/forum/mainPage.do">主页</a></span>
    <span><a href="/topic/topicIntro.do">话题</a></span>
    <span><a href="/searchPage.do">搜索</a></span>
    <span><a href="/forum/forumPost.do">发贴</a></span>
    <c:if test="${not empty sessionScope}">
        <span><a href="/admin/userMsg.do">消息<div id="point" class="point"></div></a></span>
    </c:if>
    <c:if test="${empty sessionScope}">
        <span><a href="/login/login-page.jsp">登录</a></span>
    </c:if>
</div>