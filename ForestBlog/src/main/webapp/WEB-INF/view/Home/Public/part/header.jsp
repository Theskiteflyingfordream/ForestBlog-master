<%--
    博客顶部部分
    包括：顶部菜单，主要菜单(包括搜索按钮)，面包屑
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%--
Note:<header> 标签定义 section 或 document 的页眉，<nav>标签定义导航链接的部分。
NOTE:标签的title属性为通常会在鼠标移到元素上时显示一段工具提示文本
--%>

<%--导航 start--%>
<header id="masthead" class="site-header">
    <%--顶部菜单 start--%>
    <nav id="top-header">
        <div class="top-nav">
            <%--根据是否已登录选择显示的超链接--%>
            <div class="user-login">
                <c:choose>
                    <c:when test="${sessionScope.user==null}">
                        <a href="/login">登录</a> | <a href="/register">注册</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/admin">进入后台</a>
                    </c:otherwise>
                </c:choose>
                <a href="https://liuyanzhao.com/shop.html" target="_blank" style="color:red;">毕设代做/有偿服务</a>
            </div>
            <%--显示页头右侧菜单，申请友链等--%>
            <div class="menu-topmenu-container">
                <ul id="menu-topmenu" class="top-menu">
                    <c:forEach items="${menuList}" var="m">
                        <li class="menu-item">
                        <c:if test="${m.menuLevel==1}">
                                <%--部分控制在PageController中--%>
                                <a href="${m.menuUrl}" >
                                    <i class="${m.menuIcon}"></i>
                                    <span class="font-text">${m.menuName}&nbsp;</span>&nbsp;
                                </a>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </nav>
    <%--顶部菜单 end--%>

    <%--主要菜单 satrt--%>
    <div id="menu-box">
        <div id="top-menu">
                <span class="nav-search">
                    <i class="fa fa-search"></i>
                </span>
            <%--显示左侧博客logo--%>
            <div class="logo-site"><h1 class="site-title">
                <a href="/" title="${options.optionSiteTitle}">${options.optionSiteTitle}</a>
            </h1>
                <p class="site-description">${options.optionSiteDescrption}</p>
            </div>

            <div id="site-nav-wrap">
                <%--不知道用来干嘛--%>
                <div id="sidr-close">
                    <a href="#sidr-close" class="toggle-sidr-close">×</a>
                </div>
                <nav id="site-nav" class="main-nav">
                    <a href="#sidr-main" id="navigation-toggle" class="bars">
                        <i class="fa fa-bars"></i>
                    </a>
                    <%--显示右侧页面的分类，以及移动鼠标后弹出对应的列表--%>
                    <div class="menu-pcmenu-container">
                        <ul id="menu-pcmenu" class="down-menu nav-menu sf-js-enabled sf-arrows">

                            <li>
                                <a href="/">
                                    <i class="fa-home fa"></i>
                                    <span class="font-text">首页</span>
                                </a>
                            </li>

                            <c:forEach items="${allCategoryList}" var="category">
                                <c:if test="${category.categoryPid==0}">
                                    <li>
                                        <a href="/category/${category.categoryId}">
                                            <i class="${category.categoryIcon}"></i>
                                            <span class="font-text">${category.categoryName}&nbsp;</span>
                                        </a>
                                        <ul class="sub-menu">
                                            <c:forEach items="${allCategoryList}" var="cate">
                                                <c:if test="${cate.categoryPid==category.categoryId}">
                                                    <li>
                                                        <a href="/category/${cate.categoryId}" target="_blank">${cate.categoryName}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <%--菜单中level为2的也在该分类中显示--%>
                            <c:forEach items="${menuList}" var="m">
                                <c:if test="${m.menuLevel == 2}">
                                    <li>
                                        <a href="${m.menuUrl}">
                                            <i class="${m.menuIcon}"></i>
                                            <span class="font-text">${m.menuName}&nbsp;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="clear"></div>
        </div><!-- #top-menu -->
    </div><!-- #menu-box -->
    <%--主要菜单 satrt--%>

</header><!-- #masthead -->
<%--导航 end start--%>

<%--搜索框 start--%>
<div id="search-main">
    <div class="searchbar">
        <form method="get" id="searchform" action="/search" accept-charset="UTF-8">
            <span>
                <input type="text" value="" name="keywords" id="s" placeholder="输入搜索内容"required="">
                <button type="submit" id="searchsubmit">搜索</button>
            </span>
        </form>
    </div>
    <div class="clear"></div>
</div>
<%--搜索框 end--%>

<rapid:block name="breadcrumb"></rapid:block>