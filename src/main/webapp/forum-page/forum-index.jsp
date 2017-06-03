<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 01/06/2017
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/css/common-css.css">
    <link rel="stylesheet" href="/css/forum-index.css">
    <style>


    </style>
</head>
<body>
<jsp:include page="/common-page/fix-bar.jsp" />
<div class="search-bar">
    <input type="text" name="searchContent" id="searchContent" value=""/>
</div>
<div class="slid-page">
    <ul>
        <li class="slid-item"><a href=""><img src="/images/slid-pic/pic01.jpg" alt="images"></a></li>
        <li class="slid-item"><a href=""><img src="/images/slid-pic/pic02.jpg" alt="images"></a></li>
        <li class="slid-item"><a href=""><img src="/images/slid-pic/pic03.jpg" alt="images"></a></li>
        <li class="slid-item"><a href=""><img src="/images/slid-pic/pic04.jpg" alt="images"></a></li>
        <li class="slid-item"><a href=""><img src="/images/slid-pic/pic01.jpg" alt="images"></a></li>
    </ul>
</div>
<div class="content">
    <div class="forum-core">
        <ul>
            <li class="forum-list">
                <div class="forum-list-content">
                    <div class="forum-list-content-title">
                            <span class="reply-avator">
                                <img src="/images/avator/avatar01.jpg" alt="avator"/>
                            </span>
                        <span class="reply-person">
                                安联
                            </span>
                        回复了问题
                        <span class="reply-time">
                                9小时
                            </span>
                    </div>
                    <div class="forum-topic">
                        <span class="forum-topic-static">来自话题</span>
                        <span class="forum-topic-dynamic">测试</span>
                    </div>
                    <div class="forum-list-content-detail">
                        <div class="forum-list-content-theme">
                            <a href="#">this is theme! this is theme! this is theme! this is theme! this is theme!</a>
                        </div>
                        <div class="forum-list-content-content">
                            this is content! this is content!this is content!this is content!
                        </div>
                    </div>
                    <div class="forum-list-content-footer">
                        <span class="reply-count">回复: 120</span>
                        <span class="follow-count">关注: 20</span>
                        <span class="browse-count">浏览: 1200</span>
                    </div>
                </div>
            </li>
            <li class="forum-list">
                <div class="forum-list-content">
                    <div class="forum-list-content-title">
                            <span class="reply-avator">
                                <img src="/images/avator/avatar01.jpg" alt="avator"/>
                            </span>
                        <span class="reply-person">
                                安联
                            </span>
                        回复了问题
                        <span class="reply-time">
                                9小时
                            </span>
                    </div>
                    <div class="forum-topic">
                        <span class="forum-topic-static">来自话题</span>
                        <span class="forum-topic-dynamic">测试</span>
                    </div>
                    <div class="forum-list-content-detail">
                        <div class="forum-list-content-theme">
                            <a href="#">this is theme! this is theme! this is theme! this is theme! this is theme!</a>
                        </div>
                        <div class="forum-list-content-content">
                            this is content! this is content!this is content!this is content!
                        </div>
                    </div>
                    <div class="forum-list-content-footer">
                        <span class="reply-count">回复: 120</span>
                        <span class="follow-count">关注: 20</span>
                        <span class="browse-count">浏览: 1200</span>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<jsp:include page="/common-page/footer.jsp" />
</body>
</html>

