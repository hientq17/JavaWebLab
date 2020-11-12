<%-- 
    Document   : footer
    Created on : Oct 4, 2020, 10:10:20 PM
    Author     : MrEnd
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- include taglib -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>

<s:bean var="aboutDAO" name="edu.fpt.dao.AboutDAO"/>

<div class="container-fluid footer-wrapper" id="footer">
    <div class="container">
        <div class="footer-page-counter" style="display: block;">
            <s:iterator value="views">
                <span class="footer-page-counter-item"><s:property></s:property></span>
            </s:iterator>
             &nbsp;<span><i class="fa fa-eye" aria-hidden="true"></i></span>
        </div>
        <c:choose>
            <c:when test="${account==null}">
                <button onclick="loginPopup()">Login</button>
            </c:when>
            <c:otherwise>
                <p onclick="login()">Hello ${account.getUsername()}.</p>
                <span><a href="logout"><button>Logout</button></a></span>
            </c:otherwise>
        </c:choose>
        <div id="css_simplesite_com_fallback" class="hide"></div>
    </div>
</div>

<input type="hidden" name="account" value="${account}"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>
    function loginPopup() {
        Swal.fire({
            title: 'Login',
            html:
                '<br><span>Username: </span>'+
                '<input type="text" name="username" id="username" style="width: 72%"/>'+
                '<p style="color: red" id="check-username"></p> '+
                '<br><span>Password: </span>'+
                '<input type="password" name="password" id="password" style="width: 73%"/>'+
                '<p style="color: red" id="check-password"></p> '+
                '<button style="background-color: mediumblue; color: white" onclick="login()">Login</button>',
            showCloseButton: true,
            showCancelButton: false,
            showConfirmButton: false,
            allowOutsideClick: false
        })
    }

    function login(){
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        if(username==""){
            document.getElementById("check-username").innerText = "Please input username";
            return;
        }
        if(password==""){
            document.getElementById("check-username").innerText = "";
            document.getElementById("check-password").innerText = "Please input password";
            return;
        }
        var account = username+"##"+password;
        $.ajax({
            url: 'login',
            type: 'post',
            data: {account},
            allowOutsideClick: false,
            closeOnClickOutside: false,
            success: function (result) {
                if(result=='wrong-account'){
                    Swal.fire({
                        title: 'Account does not exist',
                        icon: 'warning',
                        showCloseButton: true,
                        showCancelButton: false
                    })
                } else if(result=='wrong-password') {
                    Swal.fire({
                        title: 'Wrong password',
                        icon: 'warning',
                        showCloseButton: true,
                        showCancelButton: false
                    })
                } else {
                    Swal.fire({
                        title: 'Login successfully',
                        icon: 'success',
                        showCloseButton: true,
                        showCancelButton: false
                    }).then(() => {
                        window.location.href = "home";
                    })
                }

            },
            error: function (error) {
                console.log(error);
            }
        });
    }

</script>
