<%--
  Created by IntelliJ IDEA.
  User: MrEnd
  Date: 10/6/2020
  Time: 8:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- include taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <title>Title</title>
    <link rel="icon" sizes="194x194" href="templates/img/icon.png">
    <link href="template/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        #nav-about{
            font-weight: bold;
        }
    </style>
</head>
<body data-pid="422328565" data-iid="" style="line-height: normal;" class="stefan-asafti">
<div class="container-fluid site-wrapper">

    <!-- header page -->
    <jsp:include page="header.jsp"/>

    <div class="container-fluid content-wrapper" id="content">
        <div class="container">
            <div class="row-fluid content-inner">
                <div id="left" class="span9">
                    <div class="wrapper ">
                        <div class="content">
                            <div class="row-fluid layout5-row  margins-topbottom padding-all ">
                                <div class="sections-wrapper">
                                    <div class="span12 ">
                                        <div class="outer-margin-on first last">
                                            <div class="section article margins-on">
                                                <style>    .wordwrapfix {
                                                    word-wrap: break-word;
                                                }
                                                </style>
                                                <div class="heading wordwrapfix">
                                                    <h3>About Me</h3>
                                                </div>
                                                <div class="content">
                                                    <p>${about.getaContent()}</p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="image">
                                        <img src="template/img/${about.getaImage()}">
                                    </div><br><br>
                                </div>
                            </div>
                            <div class="row-fluid layout5-row  margins-topbottom padding-all ">
                                <div class="sections-wrapper">
                                    <div class="span12 ">
                                        <div class="outer-margin-on first last">
                                            <div class="section signature margins-on">
                                                <div class="content">

                                                    <div class="signature-text-noimg">
                                                        <p>Kind regards</p>
                                                        <div class="signature-sign"
                                                             style="font-family: 'Pacifico',serif;">
                                                            ${about.getaName()}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

                <!-- share page -->
                <jsp:include page="share.jsp"/>

            </div>
        </div>
    </div>  <!-- the controller has determined which view to be shown in the content -->

    <!-- footer page -->
    <jsp:include page="footer.jsp"/>

</div>
</body>
</html>
