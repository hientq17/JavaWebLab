<%-- 
    Document   : home.jsp
    Created on : Oct 4, 2020, 9:54:15 PM
    Author     : MrEnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!-- include taglib -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>


<html lang="en-US" class="objectfit object-fit">
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
<body>
<div class="container-fluid site-wrapper">

    <!-- header page -->
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
                                            <div class="section margins-on">
                                                <div class="content">
                                                    <ul class="thumbnails column-article-section">
                                                        <s:iterator value="coffeeList">
                                                            <li class="span6" style="height: 70%; width: 47%">
                                                                <div class="img-simple span11 ">
                                                                    <div class="image" style="height: 200px">
                                                                        <img src='<s:property value="getcImage()"/>'/>
                                                                    </div>
                                                                </div>
                                                                <h4 style="display: inline-block; font-weight: bold"><s:property value="getcName()"/></h4>
                                                                <span style="float: right; margin-top: 12px"><s:property value="getcPrice()"/> ₫ &emsp;</span><br>
                                                                <p><s:property value="getcDescription()"/></p>
                                                            </li>
                                                        </s:iterator>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${admin!=null}">
                                            <div style="width: 100%">
                                                <button style="margin-left: 40%; background-color: maroon; color: white" onclick="newCoffee()">Add new coffee</button>
                                            </div>
                                        </c:if>
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

    <!-- footer page -->
    <jsp:include page="footer.jsp"/>

</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>
    function newCoffee() {
        Swal.fire({
            title: 'Add new coffee',
            html:
                '<form action="new-coffee" method="post" id="new-coffee" style="text-align: left" enctype="multipart/form-data">'+
                '<br><span>Name: </span>'+
                '<input type="text" name="cName" style="width: 80%"/>'+
                '<br><span>Description: </span>'+
                '<textarea name="cDescription" id="cDescription" oninput="limitText(this,300)" cols="32" rows="10"></textarea>'+
                '<br><span>Price: </span>'+
                '<input type="number" min="0" name="cPrice" style="width: 80%"/>'+
                '<br><span>Image: </span>'+
                '<input type="hidden" name="cImage" id="cImageBase64">'+
                '<input type="file" id="cImage">'+
                '<br><button style="margin: 0 44%; padding: 5 20px; background-color: #3085d6; border: none" ' +
                'type="submit" form="new-coffee">OK</button>'+
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
                document.getElementById("cImageBase64").value = "data:image/png;base64,"+b64;
            };

            reader.readAsDataURL(file);
        };
    }
</script>

</html>