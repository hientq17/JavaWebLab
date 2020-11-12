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
        #nav-contact {
            font-weight: bold;
        }

        body {
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
                    <div class="wrapper contact">
                        <div class="heading">
                            <h1 class="page-title">Contact me</h1>
                        </div>
                        <div class="content">
                            <div class="section">
                                <div class="content">
                                    <div class="span12 contact-text">
                                        <h4>Send your message</h4>

                                    </div>
                                </div>
                            </div>
                            <div class="section contact-form">
                                <div class="content">
                                    <div class="alert alert-success hide">
                                        Thank you for your message.
                                    </div>
                                    <div class="alert alert-error hide">
                                        <button type="button" class="close">×</button>
                                    </div>
                                    <p>Write your message here:</p>
                                    <fieldset>
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <input type="text" id="cName" name="author[name]"
                                                       placeholder="Write your name here"
                                                       style="margin-bottom:11px!important">
                                                <span class="_help-block"></span>
                                                <p style="color: red" id="cName-error"/>
                                            </div>

                                            <div class="span6">
                                                <input type="text" id="cEmail" name="author[email]"
                                                       placeholder="Write your email here"
                                                       style="margin-bottom:11px!important">
                                                <span class="_help-block"></span>
                                                <p style="color: red" id="cEmail-error"/>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span12">
                                                    <textarea id="cDescription" name="text"
                                                              placeholder="Write your message here"
                                                              style="margin-bottom:11px!important"></textarea>
                                                <span class="_help-block"></span>
                                                <p style="color: red" id="cDescription-error"/>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span12">
                                                <button class="btn btn-primary pull-right"
                                                        onclick="return send()">Send - Click here
                                                </button>
                                            </div>
                                        </div>
                                    </fieldset>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>
    function send() {
        var cName = $("#cName").val();
        if(cName==null || cName==''){
            $("#cEmail-error").text("");
            $("#cDescription-error").text();
            $("#cName-error").text("Please input name");
            return;
        }
        var cEmail = $("#cEmail").val();
        if(cEmail==null || cEmail==''){
            $("#cEmail-error").text("Please input email");
            $("#cDescription-error").text("");
            $("#cName-error").text("");
            return;
        }
        var cDescription = $("#cDescription").val();
        if(cDescription==null || cDescription==''){
            $("#cEmail-error").text("");
            $("#cDescription-error").text("Please input message");
            $("#cName-error").text("");
            return;
        }
        var content = cName + "##" + cEmail + "##" + cDescription;
        $.ajax({
            url: 'send-feedback',
            type: 'post',
            data: {content},
            allowOutsideClick: false,
            closeOnClickOutside: false,
            success: function (result) {
                Swal.fire({
                    title: 'Message has been sent!',
                    icon: 'success',
                    showCloseButton: true,
                    showCancelButton: false
                })
            },
            error: function (error) {
                console.log(error);
            }

        })
        $("#cEmail-error").text("");
        $("#cDescription-error").text("");
        $("#cName-error").text("");
    }
</script>

</html>
