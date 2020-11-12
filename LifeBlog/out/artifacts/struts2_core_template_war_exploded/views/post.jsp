<%--
  Created by IntelliJ IDEA.
  User: MrEnd
  Date: 10/6/2020
  Time: 8:39 AM
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!-- include taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Post</title>
    <link rel="icon" sizes="194x194" href="templates/img/icon.png">
    <link href="template/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body data-pid="422328564" data-iid="" style="line-height: normal;" class="stefan-asafti">
<div class="container-fluid site-wrapper">

    <!-- header page -->
    <jsp:include page="header.jsp"/>

    <div class="container-fluid content-wrapper" id="content">
        <div class="container">
            <div class="row-fluid content-inner">
                <div id="left" class="span9">
                    <div class="wrapper blog-post">
                        <div class="content">
                            <div class="avatar">
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                            </div>
                            <div class="blog-post-body section">
                                <div class="controls">
                                    <span class="date-text">${post.getpView()}
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                    </span>&nbsp;
                                    <span class="date-text">${post.getpDate()}</span>

                                </div>
                                <div class="heading">
                                    <h1 class="page-title">${post.getpTitle()}</h1>
                                </div>

                                <div class="content">
                                    <p>${post.getpIntroduction()}</p>
                                        <div class="image">
                                            <img src="template/img/${post.getpImage()}"/>
                                        </div>
                                    <p>${post.getpContent()}</p>
                                </div>
                            </div>

                            <ul class="pager">
                                <li><a href="overview">Overview</a></li>
                            </ul>
                        </div>


                    </div>
                </div>

                <!-- share page -->
                <jsp:include page="share.jsp"/>

            </div>
        </div>
    </div>

    <!-- footer page -->
    <jsp:include page="footer.jsp"/>

</div>
</body>
</html>

