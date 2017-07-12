<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 01/06/2017
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <META HTTP-EQUIV="pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <META HTTP-EQUIV="expires" CONTENT="0">
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/js/public-function.js"></script>
    <script type="text/javascript" src="/js/Ajax.js"></script>
    <link rel="stylesheet" href="/css/common-css.css">
    <link rel="stylesheet" href="/css/forum/forum-index.css">
    <link rel="stylesheet" href="/css/forum/forum-theme-core.css">
    <style>
        .search-list {
            width: 375px;
            margin: 1px auto;
            position: absolute;
            left: 0;
            top: 50px;
            z-index: 9999;
        }

        .search-list ul {
            list-style: none;
        }

        .search-list .search-list-item{
            width: 375px;
        }

        .search-list .search-list-item a{
            display: inline-block;
            width: 375px;
            height: 25px;
            padding-left: 15px;
            color: #c4c4c4;
            text-decoration: none;
            background-color: white;

        }

    </style>
    <script>

        $(document).ready(function(){

            $("#searchContent").on("keydown keypress keyup",function(){
                if ($("#searchContent").val() == null || $("#searchContent").val() == '') {
                    $(".search-list ul").children().remove();
                } else {
                    $(".search-list ul").children().remove();
                    simplySearchTheme($("#searchContent").val())
                }
            })

            $(".reload-bar").on("click",function(){
                log($("#currentPage").val() + 1);
                getLoadTheme(parseInt($("#currentPage").val()) + 1,null);
                getLoadButtonFlag(parseInt($("#currentPage").val()) + 1,'theme','');
            })
        })
    </script>
</head>
<body>
<jsp:include page="/common-page/fix-bar.jsp" />
<div class="search-bar">
    <input type="text" name="searchContent" id="searchContent" value=""/>
    <div class="search-list">
        <ul>

        </ul>
    </div>
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
    <jsp:include page="/forum-page/forum-theme-core.jsp"/>
</div>
<jsp:include page="/common-page/footer.jsp" />
</body>
</html>

