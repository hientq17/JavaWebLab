<%--
  Created by IntelliJ IDEA.
  User: MrEnd
  Date: 10/6/2020
  Time: 8:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid header-wrapper " id="header"> <!-- this is the Header Wrapper -->
    <div class="container">
        <div class="title-wrapper">
            <div class="title-wrapper-inner">
                <a class="logo " href="home">
                </a>
                <div class="title ">
                    <a class="title  title-link" href="home">
                        Blogging About My Life
                    </a>
                </div>
                <div class="subtitle">
                    Welcome to my blog
                </div>
            </div>
        </div>  <!-- these are the titles -->
        <div class="navbar navbar-compact">
            <div class="navbar-inner">
                <div class="container">
                    <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse" title="Toggle menu">
                        <span class="menu-name">Menu</span>
                    </a>



                    <!-- Everything you want hidden at 940px or less, place within here -->
                    <div class="nav-collapse collapse">
                        <ul class="nav" id="topMenu" data-submenu="horizontal">
                            <li id="nav-home">
                                <a href="home">My Blog</a>
                            </li><li id="nav-about">
                                <a href="about">About Me</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- this is the Menu content -->
    </div>
</div>