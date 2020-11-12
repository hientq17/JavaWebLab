<%-- 
    Document   : home.jsp
    Created on : Oct 4, 2020, 9:54:15 PM
    Author     : MrEnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- include taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="icon" sizes="194x194" href="templates/img/icon.png">
        <link href="templates/css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container-fluid site-wrapper">

            <!-- footer page -->
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
                                                            <div class="heading wordwrapfix">
                                                                <h3>${food.getfName()}</h3>
                                                            </div>
                                                            <div class="heading wordwrapfix">
                                                                <p><i class="fa fa-money" aria-hidden="true"></i>&nbsp; Price: ${food.getfPrice()} ₫</p><br>
                                                            </div>
                                                            <div class="img-simple span12 ">
                                                                <div class="image">
                                                                    <img src="images/${food.getfImage()}">
                                                                </div>
                                                            </div>

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
                                                    <div class="section article margins-on">
                                                        <style>    .wordwrapfix {
                                                                word-wrap:break-word;
                                                            }
                                                        </style>
                                                        <div class="content">
                                                            <p><span>${food.getfDescription()}</span></p>    
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

            <!-- header page -->
            <jsp:include page="footer.jsp"/>

        </div>
    </body>
</html>