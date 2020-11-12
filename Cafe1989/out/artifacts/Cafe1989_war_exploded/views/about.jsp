<%--
  Created by IntelliJ IDEA.
  User: MrEnd
  Date: 10/8/2020
  Time: 10:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!-- include taglib -->
<%@taglib prefix="s" uri="/struts-tags" %>


<html lang="en-US" class="objectfit object-fit">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>About</title>
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
                                                <style>    .wordwrapfix {
                                                    word-wrap: break-word;
                                                }
                                                </style>
                                                <div class="heading wordwrapfix">
                                                    <h4 style="font-weight: bold"><s:property value="about.getaComboName()"/></h4>
                                                </div>
                                                <div class="image" style="margin-bottom: 20px" >
                                                    <img src='<s:property value="about.getaComboImage()"/>'/>
                                                    <p><s:property value="about.getaComboDescription()"/></p>
                                                </div>
                                                <div class="content">
                                                    <ul class="thumbnails column-article-section">
                                                        <s:iterator value="comboList">
                                                            <li class="span12" style="border-top: 5px dotted red">
                                                                <div style="height: 65%; width: 60%; display: inline-block;float: left">
                                                                    <h4 style="display: inline-block; font-weight: bold"><s:property value="getCbName()"/></h4>
                                                                    <span style="float: right; margin-top: 12px"><s:property value="getCbPrice()"/> ₫ &emsp;</span><br>
                                                                    <div class="img-simple span11 ">
                                                                        <div class="image">
                                                                            <img src='<s:property value="getCbImage()"/>'/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div style="display: inline">
                                                                    <br> <br>
                                                                    <h5><i class="fa fa-bars" aria-hidden="true"></i> &nbsp; Combo bao gồm: </h5>
                                                                    <s:iterator value="getListCoffee()">
                                                                        <p>&emsp;<i class="fa fa-hand-o-right" aria-hidden="true"></i>
                                                                            <s:property value="getCcQuantity()"/>
                                                                            <s:property value="getCcName()"/> </p>
                                                                    </s:iterator>
                                                                </div>
                                                            </li>
                                                        </s:iterator>
                                                    </ul>
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