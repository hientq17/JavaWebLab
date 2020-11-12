<%-- 
    Document   : menu
    Created on : Oct 4, 2020, 10:04:54 PM
    Author     : MrEnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- include taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<s:bean var="foodDAO" name="edu.fpt.dao.FoodDAO"/>

<!DOCTYPE html>
<html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Menu</title>
            <link rel="icon" sizes="194x194" href="templates/img/icon.png">
            <link href="templates/css/style.css" rel="stylesheet" type="text/css"/>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <style>
                #nav-menu{
                    font-weight: bold;
                }
            </style>
        </head>
        <body>
            <div class="container-fluid site-wrapper">

                <!-- footer page -->
                <jsp:include page="header.jsp"/>

                <div class="container">
                    <div class="row-fluid content-inner">
                        <div id="left" class="span9"> <!-- ADD "span12" if no sidebar, or "span9" with sidebar -->
                            <div class="wrapper list list-prices">
                                <div class="heading">
                                    <h1 class="page-title">Menu and Price list</h1>
                                </div>

                                <div class="content">
                                    <c:forEach var="type" items="${listTypes}">
                                         <div class="section">
                                            <div class="content">
                                                <table class="table">
                                                    <thead>
                                                        <tr style="background-color: #ccc">
                                                            <th>${type.gettName()}</th>
                                                            <th class="align-right">Price</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="food" items="${foodDAO.getByCategory(type.gettId())}">
                                                            <tr>

                                                                <td>
                                                                    <a style="text-decoration: none" href="food?fId=${food.getfId()}">
                                                                        ${food.getfName()}
                                                                    </a>
                                                                </td>
                                                                <td class="align-right">${food.getfPrice()} ₫</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                                <p>${type.gettDescription()}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>


                            </div>  
                        </div>
                        <div style="margin-bottom: 30px"></div>
                        <!-- share page -->
                        <jsp:include page="share.jsp"/>  
                        
                    </div>  
                    
                </div>     
                <!-- footer page -->
                <jsp:include page="footer.jsp"/>

            </div>
        </body>
    </html>
