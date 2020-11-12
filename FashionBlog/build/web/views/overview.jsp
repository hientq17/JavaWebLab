<%--
  Created by IntelliJ IDEA.
  User: MrEnd
  Date: 10/6/2020
  Time: 8:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- include taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <c:forEach var="month" items="${listMonths}">
                                        <div style="border-bottom: 2px dotted">
                                            <span>${month}</span>
                                        </div><br>
                                        <div>
                                            <c:forEach var="post" items="${postDAO.getListPostsByMonth(connectDB,month)}">
                                                <div>
                                                    <form action="single-post" method="post">
                                                        <input type="hidden" name="pId" value='${post.getpId()}'>
                                                        <input type="hidden" name="username" value='${account.getUsername()}'>
                                                        <button type="submit" style="border: none">
                                                            <p>${post.getpName()}</p>
                                                        </button>
                                                        <span style="float: right; margin: 2px">
                                                            ${post.getpLike()}
                                                            <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>&emsp;
                                                            ${post.getpView()}
                                                            <i class="fa fa-eye" aria-hidden="true"></i>&emsp;&emsp;
                                                             ${post.getpDate()}
                                                        </span>
                                                    </form>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <c:if test="${account.isAdmin()==true}">
                        <div style="width: 100%">
                            <button style="margin-left: 40%; background-color: maroon; color: white" onclick="newPost()">Add new post</button>
                        </div>
                    </c:if>

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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>
    function newPost() {
        Swal.fire({
            title: 'Add new post',
            html:
                '<form action="new-post" method="post" id="new-post" style="text-align: left" enctype="multipart/form-data">'+
                '<br><span>Title: </span>'+
                '<input type="text" name="pTitle" style="width: 78%"/>'+
                '<br><span>Introduction: </span>'+
                '<textarea name="pIntroduction" id="pIntroduction" oninput="limitText(this,200)" cols="35" rows="4"></textarea>'+
                '<br><span>Content: </span>'+
                '<textarea name="pContent" id="pContent" oninput="limitText(this,1000)" cols="40" rows="10"></textarea>'+
                '<br><span>Image: </span>'+
                '<input type="hidden" name="pImage" id="pImageBase64">'+
                '<input type="file" id="pImage" style="width: 75%">'+
                '<br><button style="margin: 0 44%; padding: 5 20px; background-color: #3085d6; border: none" ' +
                'type="submit" form="new-post">OK</button>'+
                '</form>',
            showCloseButton: true,
            showCancelButton: false,
            showConfirmButton: false,
        })
        convert();
    }
</script>

<script>
    function limitText(textArea,max){
        var text = textArea.value;  // Get input textarea value
        var length = text.length;   // Get length of input textarea value
        if(length > max){     //compare this length with total count
            text = text.substring(0,max);
            textArea.value = text;
            return false;
        }
    }
</script>

<script>
    //convert image to base64
    function convert() {
        var input = document.querySelector('input[type=file]');
        input.onchange = function() {
            var file = input.files[0],
                reader = new FileReader();

            reader.onloadend = function() {
                var b64 = reader.result.replace(/^data:.+;base64,/, '');
                document.getElementById("pImageBase64").value = "data:image/png;base64,"+b64;
            };

            reader.readAsDataURL(file);
        };
    }
</script>

</html>
