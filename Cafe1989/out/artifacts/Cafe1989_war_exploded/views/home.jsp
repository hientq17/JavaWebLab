<%-- 
    Document   : home.jsp
    Created on : Oct 4, 2020, 9:54:15 PM
    Author     : MrEnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!-- include taglib -->
<%@taglib prefix="s" uri="/struts-tags" %>


<html lang="en-US" class="objectfit object-fit">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
    <link rel="icon" sizes="194x194" href="template/img/icon.png">
    <link href="template/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        #nav-home {
            font-weight: bold;
        }
        body{
            background-image: url("template/img/background.jpg");
        }
    </style>
</head>
<body>
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
                                                <div class="content">
                                                    <div class="img-simple span3 pull-left">
                                                        <div class="image">
                                                            <img src='<s:property value="about.getaImage()"/> '>
                                                        </div>
                                                    </div>
                                                    <h4><s:property value="about.getaName()"/></h4>
                                                    <p><s:property value="about.getaDescription()"/></p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div><br>
                            <div class="row-fluid layout5-row  margins-topbottom padding-all ">
                                <div class="sections-wrapper">
                                    <div class="span12 ">
                                        <div class="outer-margin-on first last">
                                            <div class="section margins-on">
                                                <div class="content">
                                                    <ul class="thumbnails column-article-section">
                                                        <s:iterator value="coffeeList">
                                                            <li class="span6" style="height: 70%; width: 47%">
                                                                <div class="img-simple span11 ">
                                                                    <div class="image" style="height: 200px">
                                                                        <img src='<s:property value="getcImage()"/>'/>
                                                                    </div>
                                                                </div>
                                                                <h4 style="display: inline-block; font-weight: bold"><s:property value="getcName()"/></h4>
                                                                <span style="float: right; margin-top: 12px"><s:property value="getcPrice()"/> ₫ &emsp;</span><br>
                                                                <p><s:property value="getcDescription()"/></p>
                                                            </li>
                                                        </s:iterator>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="width: 100%">
                                            <button style="margin-left: 40%; background-color: maroon; color: white" >
                                                <a href="overview" style="color: white; text-decoration: none">Overview</a></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-fluid layout5-row  margins-topbottom padding-all ">
                                <div class="sections-wrapper">
                                    <div class="span12 ">
                                        <div class="outer-margin-on first last">
                                            <div class="section article margins-on">
                                                <div class="content">
                                                    <h4>Visit my cafe</h4>
                                                    <p>Address: <s:property value="about.getaAddress()"/></p>
                                                    <p>Tel: <s:property value="about.getaPhone()"/></p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-fluid layout5-row  margins-topbottom padding-all ">
                                <div class="sections-wrapper">
                                    <div class="span12 ">
                                        <div class="outer-margin-on first last">
                                            <div class="section signature margins-on">
                                                <div class="content">
                                                    <div class="signature-text-noimg">
                                                        <h4>Kind regards</h4>
                                                        <div class="signature-sign-text">
                                                            Quang Hien
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
    </div>

    <!-- footer page -->
    <jsp:include page="footer.jsp"/>

</div>
</body>

</html>