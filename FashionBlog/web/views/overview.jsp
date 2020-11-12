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

<s:bean var="postDAO" name="edu.fpt.dao.PostDAO"/>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Overview</title>
    <link rel="icon" sizes="194x194" href="template/img/icon.png">
    <link href="template/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{
            background-image: url("template/img/background.jpg");
        }
    </style>
</head>
<body data-pid="422328564" data-iid="" style="line-height: normal;" class="stefan-asafti">

<div class="container-fluid site-wrapper">
    <!-- header page -->
    <jsp:include page="header.jsp"/>

    <div class="container-fluid content-wrapper" id="content">
        <div class="container">
            <div class="row-fluid content-inner">
                <div id="left" class="span9">
                    <div class="wrapper blogoverview">
                        <div class="heading">
                            <h1 class="page-title">Overview - My Blog</h1>
                        </div>
                        <div class="content">
                            <div class="section">
                                <div class="content">
                                    <s:iterator var="month" value="%{#request.listMonths}">
                                        <script>
                                            var month = '${month}';
                                            $.ajax({
                                                url: 'list-posts-by-month',
                                                type: 'post',
                                                data: {month},
                                                dataType : 'html',
                                                allowOutsideClick: false,
                                                closeOnClickOutside: false,
                                                success: function (result) {
                                                    document.getElementById('list-posts-by-month').innerHTML += result;
                                                },
                                                error: function (error) {
                                                    console.log(error);
                                                }
                                            });
                                        </script>
                                        <div id="list-posts-by-month">
                                        </div>
                                    </s:iterator>
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
