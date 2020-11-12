<%-- 
    Document   : footer
    Created on : Oct 4, 2020, 10:10:20 PM
    Author     : MrEnd
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- include taglib -->
<%@taglib prefix="s" uri="/struts-tags" %>

<s:bean var="aboutDAO" name="edu.fpt.dao.AboutDAO"/>

<div class="container-fluid footer-wrapper" id="footer">
    <div class="container">
        <div class="footer-page-counter" style="display: block;">
            <s:iterator var="view" value="%{#request.views}">
                <span class="footer-page-counter-item">${view}</span>
            </s:iterator>
             &nbsp;<span><i class="fa fa-eye" aria-hidden="true"></i></span>
        </div>
        <div id="css_simplesite_com_fallback" class="hide"></div>
    </div>
</div>
