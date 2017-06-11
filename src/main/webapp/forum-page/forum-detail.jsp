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
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/css/forum/forum-detail.css">
    <link rel="stylesheet" href="/css/common-css.css">

    <style>

    </style>
</head>
<body>
<div class="fix-bar">
    <span><a href="#">主页</a></span>
    <span><a href="#">话题</a></span>
    <span><a href="#">搜索</a></span>
    <span><a href="#">发起</a></span>
    <span><a href="#">我</a></span>
</div>
<div class="content">
    <div class="forum-core-content">
        <div class="forum-topic">
            <span class="forum-topic-dynamic">测试话题1</span>
            <span class="forum-topic-dynamic">测试话题2</span>
        </div>
        <div class="creater-area">
            <div class="creater-area-left">
                <img src="/images/avator/avatar01.jpg" alt="avator" />
            </div>
            <div class="creater-area-right">
                <div class="creater-area-right-up">
                    <span class="creater-area-left-name">Vera</span>
                    <span class="creater-area-right-up-follow">
                        <button type="button" class="follow-button">关注</button>
                    </span>
                </div>
                <div class="creater-area-right-down">
                    <span class="creater-area-right-up-score">
                        积分: 2000
                    </span>
                    <span class="creater-area-right-up-fans">
                        粉丝: 123
                    </span>
                </div>
            </div>
        </div>
        <div class="forum-list-content-theme">
            this is theme! this is theme! this is theme! this is theme! this is theme!
        </div>
        <div class="forum-list-content-content">
            <div class="forum-list-content-content-word">
                this is content! this is content!this is content!this is content!
            </div>
            <div class="forum-list-content-content-img">
                <img src="/images/slid-pic/pic01.jpg" />
            </div>
        </div>

        <div class="forum-list-footer">
            <div class="reply-count">43 个回复</div>
            <div class="follow-button">
                <button type="button" class="follow-theme-button">关注主题</button>
            </div>
        </div>
    </div>
    <div class="reply-content">
        <ul>
            <li class="reply-content-detail-list">
                <div class="reply-personal-title">
                    <span class="reply-personal-avator">
                        <img src="/images/avator/avatar01.jpg" alt="avator"/>
                    </span>
                    <span class="reply-person">
                        卡农
                    </span>
                </div>
                <div class="reply-content-detail">
                    <div class="reply-content-detail-word">
                        测试内容回复!
                    </div>
                    <div class="reply-content-detail-img">
                        <img src="/images/slid-pic/pic02.jpg" height="340" width="790"/>
                    </div>
                </div>
                <div class="reply-content-footer">
                    <div class="reply-content-tool">
                        <span class="reply-content-tool-support">赞 32</span>
                        <span class="reply-content-tool-nonsupport">踩 2</span>
                        <span class="reply-content-tool-reply">回复 1</span>
                    </div>
                    <div class="reply-content-time">2017-01-01 12:00:00</div>
                </div>
            </li>
        </ul>
    </div>
    <div class="next-page">下一页</div>
    <div class="reply-input-content">
        <form action="" method="post">
            <div class="reply-input-content-header">
                <div class="reply-input-content-header-left">
                    <div class="reply-header-avator">
                        <img src="/images/avator/avatar01.jpg" alt="avator" />
                    </div>
                    <div class="reply-header-personal">Jason</div>
                </div>
                <div class="reply-input-content-header-right">
                    <span class="follow-theme">
                        <input type="checkbox" id="followThemeButton" name="followThemeButton" />
                        关注问题
                    </span>
                    <span class="anonymitye-checkbox">
                        <input type="checkbox" id="anonymitye" name="anonymitye" />
                        匿名回复
                    </span>
                </div>
            </div>
            <div class="reply-input-content-detail">
                <textarea name="replyDetail" id="replyDetail"></textarea>
            </div>
            <div class="reply-input-content-submit">
                <a href="#">上传照片</a>
                <input type="submit" value="回复"/>
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
<div class="footer">Copyright &copy; 2017 Jason</div>
</body>
</html>
