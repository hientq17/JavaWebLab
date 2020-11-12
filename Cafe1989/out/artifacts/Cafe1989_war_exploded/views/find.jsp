<%-- 
    Document   : about
    Created on : Oct 4, 2020, 10:05:05 PM
    Author     : MrEnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- include taglib -->
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>About me</title>
            <link rel="icon" sizes="194x194" href="template/img/icon.png">
            <link href="template/css/style.css" rel="stylesheet" type="text/css"/>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <style>
                #nav-find{
                    font-weight: bold;
                }
                body{
                    background-image: url("template/img/background.jpg");
                }
            </style>
        </head>
        <body>
            <div class="container-fluid site-wrapper">

                <!-- footer page -->
                <jsp:include page="header.jsp"/>

                <div class="container-fluid content-wrapper" id="content">
                    <div class="container">
                        <div class="row-fluid content-inner">
                            <div id="left" class="span9">
                                <div class="wrapper map-page">
                                    <div class="heading">
                                        <h1 class="page-title">Find us</h1>
                                    </div>

                                    <div class="content">
                                        <div class="section">
                                            <div class="content">

                                                <div class="row-fluid map-page-info">
                                                    <div class="span6">
                                                        <div class="item">
                                                            <div class="heading">
                                                                <h4 class="item-title map-page-title">Address and contact:</h4>
                                                            </div>
                                                            <div class="content">
                                                                <div class="country">
                                                                    <p><s:property value="about.getaAddress()"/> </p>
                                                                </div>

                                                                <div class="row-fluid">
                                                                    <div class="span3">
                                                                        Tel:
                                                                    </div>    
                                                                    <div class="span9">
                                                                        <a href='tel:<s:property value="about.getaPhone()"/>'>
                                                                            <s:property value="about.getaPhone()"/>
                                                                        </a>
                                                                    </div>    
                                                                </div>
                                                                <div class="row-fluid">
                                                                    <div class="span3">
                                                                        Email:
                                                                    </div>    
                                                                    <div class="span9">
                                                                        <a href='mailto:<s:property value="about.getaEail()"/>'>
                                                                            <s:property value="about.getaEmail()"/>
                                                                        </a>
                                                                    </div>    
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="span6">
                                                        <div class="item">
                                                            <div class="heading">
                                                                <h4 class="item-title map-page-title">Opening hours:</h4>
                                                            </div>
                                                            <div class="content">
                                                                <p><s:property value="about.getaOpening()"/></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="section">
                                            <div class="content">
                                                <div class="map-container">
                                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.694652151616!2d108.25848661422268!3d15.97731454613994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142110d54c08361%3A0x392b66d514216e8d!2zVEhFIDE5ODkgVEVBIENPRkZFRSAmIELDmk4gQ0jhuqIgSMOAIE7hu5hJ!5e0!3m2!1svi!2s!4v1602173036884!5m2!1svi!2s"
                                                            width="700" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
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
