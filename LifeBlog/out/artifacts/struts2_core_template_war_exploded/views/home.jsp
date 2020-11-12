<%-- 
    Document   : home.jsp
    Created on : Oct 4, 2020, 9:54:15 PM
    Author     : MrEnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!-- include taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
    <link rel="icon" sizes="194x194" href="templates/img/icon.png">
    <link href="template/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        #nav-home {
            font-weight: bold;
        }
    </style>
</head>

<body data-pid="422328564" data-iid="" style="line-height: normal;" class="stefan-asafti">
<div class="container-fluid site-wrapper">

    <!-- header page -->
    <jsp:include page="header.jsp"/>

    <div class="container-fluid content-wrapper" id="content">
        <div class="container">
            <div class="row-fluid content-inner">
                <div id="left" class="span9">
                    <div class="wrapper blog">
                        <div class="heading">
                            <h1 class="page-title">My Blog</h1>
                        </div>
                        <div class="content">
                            <c:forEach var="famous" items="${listFamousPosts}">
                                <div class="section">
                                    <div class="content">
                                        <div class="avatar">
                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                        </div>
                                        <div class="item">
                                            <div class="controls">
                                                <span class="date-text">${famous.getpView()}
                                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                                </span>&nbsp;
                                                <span class="date-text">${famous.getpDate()}</span>
                                            </div>
                                            <div class="heading">
                                                <h4><a style="text-decoration: none" href="post?pId=${famous.getpId()}">${famous.getpTitle()}</a></h4>
                                            </div>

                                            <div class="content">
                                                <div class="img-simple span6 pull-left">
                                                    <div class="image">
                                                        <img src="template/img/${famous.getpImage()}"/>
                                                    </div>
                                                </div>
                                                <p>${famous.getpIntroduction()}</p>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
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
