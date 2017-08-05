<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 05/08/2017
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>forum reply detail</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/js/Ajax.js"></script>
    <script type="text/javascript" src="/js/public-function.js"></script>
    <link rel="stylesheet" href="/css/forum/forum-reply-detail.css">
    <link rel="stylesheet" href="/css/common-css.css">
    <style>


    </style>
    <script>


        $(document).ready(function(){
            $(".reply-area-content-title-right-reply-button").on("click",function(){
               $("#replyContent").attr("placeholder","@" + $(this).parent().prev().find(".reply-area-content-title-person").text().trim() + ":");
               $("#inputContentSubperson").val($(this).next().val().trim())
            })

            $(".theme-content-descr ul").delegate(".reply-area-content-title-right-reply-button","click",function(){
                $("#replyContent").attr("placeholder","@" + $(this).parent().prev().find(".reply-area-content-title-person").text().trim() + ":");
                $("#inputContentSubperson").val($(this).next().val().trim())
            })

            $("#resetButton").on("click",function(){
                $("#replyContent").removeAttr("placeholder","");
                $("#inputContentSubperson").val("")
            })

            $("#submitButton").on("click",function(){
                if ($("#replyContent").val() == '') {
                    alert("请输入内容!")
                } else {
                    var replyContent
                    if ($("#inputContentSubperson").val() == null || $("#inputContentSubperson").val() == '') {
                        replyContent = $("#replyContent").val();
                    } else {
                        replyContent = $("#replyContent").attr("placeholder") + $("#replyContent").val();
                    }
                    log(replyContent)
                    replyContentReplyForMsg($("#currentUser").val(),$("#inputContentId").val(),$("#inputContentSubperson").val(), replyContent)
                    $("#replyContent").removeAttr("placeholder","");
                    $("#inputContentSubperson").val("")
                    $("#replyContent").val("");
                }
            })
        })

    </script>
</head>
<body style="padding: 0">
<jsp:include page="/common-page/fix-bar.jsp"/>
<div class="header">
    <div class="theme-descr">
        主题:
        <a href="/forum/fourmDetail.do?id=${contentReply[0].getThemeId()}" target="_blank">${contentReply[0].getThemeName()}</a>
        <input type="hidden" id="themeId" name="themeId" value="${contentReply[0].getThemeId()}">
    </div>
    <div class="theme-content-descr">
        <div class="theme-content-descr-header">
            <div class="theme-content-descr-header-pic">
                <img src="/images/getAvator.do?id=${contentReply[0].getContentCreater()}" alt="avator"/>
            </div>
            <div class="theme-content-descr-header-name">
                <a href="/admin/personalDetail.do?id=${contentReply[0].getContentCreater()}">${contentReply[0].getContentCreaterName()}</a>
            </div>
        </div>
        <div class="theme-content-descr-content">${contentReply[0].getContentName()}</div>
        <input type="hidden" id="contentId" name="contentId" value="${contentReply[0].getContentRefId()}">
    </div>
</div>
<div class="content">
    <ul>
        <c:forEach items="${contentReply}" varStatus="i" var="contentReplyItem">
            <li class="reply-area-core-content-list">
                <div class="reply-area-core-content">
                    <div class="reply-area-content-title">
                        <span class="reply-area-content-title-left">
                            <span class="reply-area-content-title-avater">
                                <img src="/images/getAvator.do?id=${contentReplyItem.getCreater()}" alt="avator"/>
                            </span>
                            <span class="reply-area-content-title-person">
                               <a href="/admin/personalDetail.do?id=${contentReplyItem.getCreater()}">${contentReplyItem.getCreaterName()}</a>
                            </span>
                        </span>
                        <span class="reply-area-content-title-right">
                            <span class="reply-area-content-title-right-time">${contentReplyItem.getCreateTime()}</span>
                            <span class="reply-area-content-title-right-reply-button">回复</span>
                            <input type="hidden" id="replyContentPersonId" name="replyContentPersonId" value="${contentReplyItem.getCreater()}">
                        </span>
                    </div>
                    <div class="reply-area-content-content">
                            ${contentReplyItem.getContent()}
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
<div class="inputArea">
    <input type="text" id="replyContent" name="replyContent" value="">
    <input type="button" id="resetButton" name="resetButton" value="清除">
    <input type="button" id="submitButton" name="submitButton" value="回复">
    <input type="hidden" id="inputContentId" name="inputContentId" value="${contentReply[0].getContentRefId()}">
    <input type="hidden" id="inputContentSubperson" name="inputContentSubperson" value="">
    <input type="hidden" id="currentUser" name="currentUser" value="${PersonalSetup.getUserid()}">
</div>
<jsp:include page="/common-page/footer.jsp"/>
</body>
</html>
