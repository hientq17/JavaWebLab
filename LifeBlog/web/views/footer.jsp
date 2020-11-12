<%--
  Created by IntelliJ IDEA.
  User: MrEnd
  Date: 10/6/2020
  Time: 8:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- include taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<s:bean var="aboutDAO" name="edu.fpt.dao.AboutDAO"/>

<div class="container-fluid footer-wrapper" id="footer">
    <div class="container">
        <div class="footer-info">
            Quang Hiền
        </div>
        <div class="footer-page-counter" style="display: block;">
            <c:forEach var="aView" items="${aboutDAO.getViews()}">
                <span class="footer-page-counter-item">${String.valueOf(aView)}</span>
            </c:forEach>
            &nbsp;<span><i class="fa fa-eye" aria-hidden="true"></i></span>
        </div>
        <div id="css_simplesite_com_fallback" class="hide"></div>
    </div>
</div>