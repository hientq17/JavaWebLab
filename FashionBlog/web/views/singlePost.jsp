<%--
  Created by IntelliJ IDEA.
  User: MrEnd
  Date: 10/6/2020
  Time: 8:39 AM
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!-- include taglib -->
<%@taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Post</title>
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
                    <div class="wrapper blog-post">
                        <div class="content">
                            <div class="avatar">
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                            </div>
                            <div class="blog-post-body section">
                                <div class="controls">
                                    <span class="date-text" id="pLike"><s:property value="%{#request.singlePost.getpLike()}"/></span>
                                    <span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></span>&nbsp;
                                    <span class="date-text" ><s:property value="%{#request.singlePost.getpView()}"/>
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                    </span>&nbsp;
                                    <span class="date-text"><s:property value="%{#request.singlePost.getpDate()}"/></span>

                                </div>
                                <div class="heading">
                                    <h4><s:property value="%{#request.singlePost.getpName()}"/></h4>
                                    <s:if test="%{#session.account!=null }">
                                        <s:if test="%{#request.isLiked==true}">
                                            <button id="like-button" style="border:none; color: #2407ff" value="unlike-post" onclick="likePost()">
                                                <i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Like</button>
                                        </s:if>
                                        <s:else>
                                            <button id="like-button" style="border:none" value="like-post" onclick="likePost()">
                                                <i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Like</button>
                                        </s:else>
                                    </s:if>
                                </div>

                                <div class="content">
                                    <p><s:property value="%{#request.singlePost.getpIntroduction()}"/></p><br>
                                        <div class="image">
                                            <img src="<s:property value="%{#request.singlePost.getpImage()}"/>"/>
                                        </div><br>
                                    <p><s:property value="%{#request.singlePost.getpContent()}"/></p>
                                </div>
                            </div>
                            <ul class="pager">
                                <li><a href="overview">Overview</a></li>
                            </ul>
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
<input type="hidden" id="pId-likePost" value='<s:property value="%{#request.singlePost.getpId()}"/>'/>
<input type="hidden" id="username-likePost" value='<s:property value="%{#session.account.getUsername()}"/>'/>
</body>
<script>
    function likePost(){
        var pId = $("#pId-likePost").val();
        var username = $("#username-likePost").val();
        var likePost = username+"##"+pId;
        var url = $("#like-button").val();
        var color;
        var value;
        var like;
        if(url=="like-post") {
            color = "#2407ff";
            value = "unlike-post";
            like = 1;
        }
        else {
            color = "black";
            value = "like-post";
            like = -1;
        }
        console.log(url);
        $.ajax({
            url: url,
            type: 'post',
            data: {likePost},
            allowOutsideClick: false,
            closeOnClickOutside: false,
            success: function (result) {
                var x = document.getElementById("like-button");
                x.style.color = color;
                x.value = value;
                var pLike = document.getElementById("pLike");
                pLike.innerHTML = parseInt(pLike.innerHTML) + like;
                // $("like-button").css("color","#2407ff");
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
</script>
</html>

