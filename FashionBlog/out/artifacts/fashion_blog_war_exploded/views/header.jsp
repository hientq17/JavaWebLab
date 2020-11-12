<!-- include taglib -->
<%@taglib prefix="s" uri="/struts-tags" %>

<div class="container-fluid header-wrapper " id="header">
    <div class="container">
        <div class="title-wrapper">
            <div class="title-wrapper-inner">
                <a class="logo " href="home"></a>
                <div class="title ">
                    <a class="title  title-link" href="home">
                        My Fashion Blog
                    </a>
                </div>
                <div class="subtitle">
                    Welcome to this website
                </div>
            </div>
        </div>
        <div class="navbar navbar-compact">
            <div class="navbar-inner">
                <div class="container">
                    <ul class="nav" id="topMenu" data-submenu="horizontal">
                        <li id="nav-home"><a href="home">My Fashion Blog</a></li>
                        <li id="nav-about"><a href="about">About me</a></li>
                        <li id="nav-contact"><a href="contact">Contact</a></li>
                        <li>
                            <s:if test="%{#session.account.isAdmin()==true}">
                                <a id="new-post" style="color: white" onclick="newPost()">Add new post</a>
                            </s:if>
                            <style>
                                #new-post:hover{
                                    cursor:pointer;
                                }
                            </style>
                        </li>
                        <li style="float:right; margin-right: 10px; margin-top: 5px">
                            <s:if test="%{#session.account==null}">
                                <button style="background-color: #cd0d18; border: none; color: white; font-weight: bold"
                                        onclick="loginPopup()">Login</button>
                            </s:if>
                            <s:else>
                                <span style="color: white">Hello <s:property value="%{#session.account.getUsername()}"/> | </span>
                                <span><a href="logout" style="background-color: #cd0d18; border: none; color: white; font-weight: bold">
                                            Logout </a></span>
                            </s:else>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

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

<script>
    function newPost() {
        Swal.fire({
            title: 'Add new post',
            html:
                '<form action="new-post" method="post" id="new-post" style="text-align: left" enctype="multipart/form-data">'+
                '<br><span>Title: </span>'+
                '<input type="text" name="pTitle" style="width: 78%" required/>'+
                '<br><span>Introduction: </span>'+
                '<textarea name="pIntroduction" id="pIntroduction" oninput="limitText(this,200)" cols="35" rows="4" required></textarea>'+
                '<br><span>Content: </span>'+
                '<textarea name="pContent" id="pContent" oninput="limitText(this,1000)" cols="40" rows="10" required></textarea>'+
                '<br><span>Image: </span>'+
                '<input type="hidden" name="pImage" id="pImageBase64">'+
                '<input type="file" id="pImage" style="width: 75%" required>'+
                '<br><button style="margin: 0 44%; padding: 5 20px; background-color: #3085d6; border: none" ' +
                'type="submit">OK</button>'+
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
