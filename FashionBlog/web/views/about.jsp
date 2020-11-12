<%--
  Created by IntelliJ IDEA.
  User: MrEnd
  Date: 10/6/2020
  Time: 8:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- include taglib -->
<%@taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <title>Contact</title>
    <link rel="icon" sizes="194x194" href="template/img/icon.png">
    <link href="template/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        #nav-about{
            font-weight: bold;
        }
        body{
            background-image: url("template/img/background.jpg");
        }
    </style>
</head>
<body data-pid="422328565" data-iid="" style="line-height: normal;" class="stefan-asafti">
<div class="container-fluid site-wrapper">

    <!-- header page -->
    <jsp:include page="header.jsp"/>

    <div class="container-fluid content-wrapper" id="content"> <!-- this is the Content Wrapper -->
        <div class="container">
            <div class="row-fluid content-inner">
                <div id="left" class="span9"> <!-- ADD "span12" if no sidebar, or "span9" with sidebar -->
                    <div class="wrapper ">
                        <div class="content">
                            <div class="row-fluid layout5-row  margins-topbottom padding-all ">
                                <div class="sections-wrapper">
                                    <div class="span12 ">
                                        <div class="outer-margin-on first last">
                                            <div class="section article margins-on">
                                                <style>    .wordwrapfix {
                                                    word-wrap:break-word;
                                                }
                                                </style>
                                                <div class="heading wordwrapfix">
                                                    <h3>About me</h3>
                                                </div>

                                                <div class="content">
                                                    <div class="img-simple span6 pull-left">
                                                        <div class="image">
                                                            <img src='<s:property value="%{#request.about.getaImage()}"/>'>
                                                        </div>
                                                    </div>
                                                    <p><span><strong>Name: </strong><s:property value="%{#request.about.getaName()}"/></span></p>
                                                    <p><span><strong>Age: </strong><s:property value="%{#request.about.getaAge()}"/></span></p>
                                                    <p><span><s:property value="%{#request.about.getaDescription()}"/></span></p>
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
    </div>

    <!-- footer page -->
    <jsp:include page="footer.jsp"/>

</div>
</body>
</html>
