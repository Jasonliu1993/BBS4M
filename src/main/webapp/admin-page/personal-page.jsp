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
    <style>
        .header {
            width: 375px;
            margin: 0 auto;
        }

        .header .person-list-content {
            width: 375px;
            height: 60px;
            background-color: #fff;
        }

        .header .person-list-content .person-list-content-left {
            width: 60px;
            height: 60px;
            padding: 5px;
            float: left;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .header .person-list-content .person-list-content-left img {
            width: 50px;
            height: 50px;
            border-radius: 3px;
        }

        .header .person-list-content .person-list-content-right {
            width: 315px;
            height: 60px;
            float: left;
        }

        .header .person-list-content .person-list-content-right .person-list-content-right-title {
            width: 300px;
            height: 60px;
            line-height: 60px;
        }

        .header .person-list-footer {
            border-top: 1px solid #c4c4c4;
            width: 375px;
            height: 40px;
            background-color: #fff;
        }

        .header .person-list-footer div {
            width: 100px;
            height: 40px;
            line-height: 40px;
            font-size: 15px;
            float: left;
            margin-left: 10px;
        }

        .header .person-list-footer div span {
            margin-left: 5px;
        }

        .header .tab-button {
            width: 375px;
            height: 40px;
            border-top: 1px solid black;
        }

        .header .tab-button div {
            width: 25%;
            height: 40px;
            background-color: #fff;
            float: left;
        }

        .header .tab-button div a {
            display: inline-block;
            width: 100%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            text-decoration: none;
            color: #c4c4c4;
        }

        .content .forum-join-area {
            width: 375px;
            margin: 5px auto;
        }

        .content .forum-join-area ul{
            list-style: none;
        }

        .content .forum-join-area ul .forum-join-area-list {
            width: 375px;
            margin: 10px auto;
        }

        .content .forum-join-area ul .forum-join-area-list .forum-join-area-block {
            width: 375px;
            padding: 5px;
            margin: 0 auto;
            background-color: #fff;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .forum-join-area ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-header {
            width: 365px;
            margin: 0 auto;
        }

        .content .forum-join-area ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-header a {
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

        .content .forum-join-area ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-content {
            border-top: 1px solid #c4c4c4;
            width: 365px;
            padding: 5px;
            margin: 0 auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            color: #c4c4c4;
        }

        .content .forum-join-area ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-footer {
            border-top: 1px solid #c4c4c4;
            width: 365px;
            margin: 0 auto;
            padding: 5px;
            margin: 0 auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .forum-join-area ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-footer {
            width: 365px;
            height: 40px;
            padding: 5px;
            margin: 0 auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .forum-join-area ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-footer .forum-join-area-block-footer-like{
            width: 100px;
            height: 29px;
            line-height: 29px;
            font-size: 15px;
            float: left;
        }

        .content .forum-join-area ul .forum-join-area-list .forum-join-area-block .forum-join-area-block-footer .forum-join-area-block-footer-time{
            width: 100px;
            height: 29px;
            line-height: 29px;
            font-size: 15px;
            text-align: right;
            float: right;
        }

        .content .forum-area {
            width: 375px;
            margin: 5px auto;
        }

        .content .forum-area ul{
            list-style: none;
        }

        .content .forum-area ul .forum-area-list {
            width: 375px;
            margin: 10px auto;
        }

        .content .forum-area ul .forum-area-list .forum-area-block {
            width: 375px;
            padding: 5px;
            margin: 0 auto;
            background-color: #fff;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .forum-area ul .forum-area-list .forum-area-block .forum-area-block-header {
            width: 365px;
            margin: 0 auto;
        }

        .content .forum-area ul .forum-area-list .forum-area-block .forum-area-block-header a {
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

        .content .forum-area ul .forum-area-list .forum-area-block .forum-area-block-content {
            border-top: 1px solid #c4c4c4;
            width: 365px;
            padding: 5px;
            margin: 0 auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            color: #c4c4c4;
        }

        .content .forum-area ul .forum-area-list .forum-area-block .forum-area-block-footer {
            border-top: 1px solid #c4c4c4;
            width: 365px;
            margin: 0 auto;
            padding: 5px;
            margin: 0 auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .forum-area ul .forum-area-list .forum-area-block .forum-area-block-footer {
            width: 365px;
            height: 40px;
            padding: 5px;
            margin: 0 auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .forum-area ul .forum-area-list .forum-area-block .forum-area-block-footer .forum-area-block-footer-like{
            width: 100px;
            height: 29px;
            line-height: 29px;
            font-size: 15px;
            float: left;
        }

        .content .forum-area ul .forum-area-list .forum-area-block .forum-area-block-footer .forum-area-block-footer-time{
            width: 100px;
            height: 29px;
            line-height: 29px;
            font-size: 15px;
            text-align: right;
            float: right;
        }

        .content .follow-area {
              width: 375px;
              margin: 10px auto;
              background-color: #fff;
              -webkit-box-sizing: border-box;
              -moz-box-sizing: border-box;
              box-sizing: border-box;
          }

        .content .follow-area .follow-area-area{
            width: 375px;
            padding: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .follow-area .follow-area-area .follow-area-header{
            width: 365px;
            margin: 0 auto;
            padding: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .follow-area .follow-area-area .follow-area-content{
            width: 365px;
            margin: 5px auto;
            border-top: 1px solid #c4c4c4;
        }

        .content .follow-area .follow-area-area .follow-area-content ul{
            width: 365px;
            list-style: none;
        }

        .content .follow-area .follow-area-area .follow-area-content ul .follow-area-content-list{
            width: 60px;
            height: 60px;
            padding: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            float: left;
        }

        .content .follow-area .follow-area-area .follow-area-content ul .follow-area-content-list img{
            width: 50px;
            height: 50px;
        }

        .clear {
            clear: both;
        }

        .content .info-area {
            width: 375px;
            margin: 10px auto;
            background-color: #fff;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .info-area .info-area-area{
            width: 375px;
            padding: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .info-area .info-area-area .info-area-header{
            width: 365px;
            margin: 0 auto;
            padding: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .info-area .info-area-area .info-area-content{
            width: 365px;
            margin: 5px auto;
            border-top: 1px solid #c4c4c4;
        }

        .content .info-area .info-area-area .info-area-content .info-area-location {
            width: 365px;
            height: 40px;
            line-height: 30px;
            padding: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content .info-area .info-area-area .info-area-content .info-area-job {
            width: 365px;
            height: 40px;
            line-height: 30px;
            padding: 5px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .selected {
            border-bottom: 2px solid green;
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
        function getLoadButtonFlag4PersonalDetail(currentPage, object, themeId, reloadBar) {
            $.ajax({
                url: '/ajax/getLoadButtonFlag.do',
                type: "POST",//请求方式：get或post
                scriptCharset: 'utf-8',
                dataType: "json",//数据返回类型：xml、json、script
                cache: false,
                data: {
                    'currentPage': currentPage,
                    'object': object,
                    'Id' : themeId
                },//自定义提交的数据
                success: function (json) {
                    if (json !== null || json !== undefined || json !== '') {
                        if (json.flag == 'Y') {
                        } else {
                            reloadBar.remove();
                        }
                    }
                },
                error: function (json) {
                    alert("Request Error!")
                }
            })
        }

        function getLoadForumByUserId(currentPage,id) {
            $.ajax({
                url: '/ajax/getForumByUserId.do',
                type: "POST",//请求方式：get或post
                scriptCharset: 'utf-8',
                dataType: "json",//数据返回类型：xml、json、script
                cache: false,
                data: {
                    'currentPage': currentPage,
                    'id': id
                },//自定义提交的数据
                success: function (json) {
                    if (json !== null || json !== undefined || json !== '') {
                        var listTheme = '';
                        for (var i = 0; i < json.length; i++) {
                            listTheme = listTheme +
                                '<li class="forum-area-list">' +
                                '<div class="forum-area-block">' +
                                '<div class="forum-area-block-header"><a href="/forum/fourmDetail.do?id=' + json[i].id + '"' +
                                'target="_blank">' + json[i].themeContent + '</a></div>' +
                                '<div class="forum-area-block-content">' + json[i].firstForumContent.content + '</div>' +
                                '<div class="forum-area-block-footer">' +
                                '<div class="forum-area-block-footer-like">' +
                                    json[i].replyCount + ' 个回复' +
                                '</div>' +
                                '<div class="forum-area-block-footer-time">' +
                                    json[i].differentTime +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</li>'
                        }
                        $(".forum-area ul").append(listTheme);
                        $("#forumCurrentPage").val(parseInt($("#forumCurrentPage").val()) + 1);
                    }
                },
                error: function (json) {
                    alert("Request Error!")
                }
            })
        }

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
            <li class="forum-join-area-list">
                <div class="forum-join-area-block">
                    <div class="forum-join-area-block-header"><a href="/forum/fourmDetail.do?id=${item.getId()}"
                                                                 target="_blank">测试测试测试测试测试测试</a></div>
                    <div class="forum-join-area-block-content">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</div>
                    <div class="forum-join-area-block-footer">
                        <div class="forum-join-area-block-footer-like">
                            0 个赞同
                        </div>
                        <div class="forum-join-area-block-footer-time">
                            5个小时
                        </div>
                    </div>
                </div>
            </li>
            <li class="forum-join-area-list">
                <div class="forum-join-area-block">
                    <div class="forum-join-area-block-header"><a href="/forum/fourmDetail.do?id=${item.getId()}"
                                                                 target="_blank">测试测试测试测试测试测试</a></div>
                    <div class="forum-join-area-block-content">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</div>
                    <div class="forum-join-area-block-footer">
                        <div class="forum-join-area-block-footer-like">
                            <span>0</span> 个赞同
                        </div>
                        <div class="forum-join-area-block-footer-time">
                            5个小时
                        </div>
                    </div>
                </div>
            </li>
            <c:if test="${pagingFlag == 'Y'}">
                <div class="reload-bar">更多</div>
            </c:if>
            <input type="hidden" id="ForumJoinCurrentPage" name="ForumJoinCurrentPage" value="${currentPage}">
        </ul>
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
