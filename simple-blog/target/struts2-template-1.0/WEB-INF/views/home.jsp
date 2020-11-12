<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <jsp:include page="/common/css.jsp"/>
</head>
<body>
<div style="margin-top: 100px" id="colorlib-page">
    <jsp:include page="/common/aside.jsp"/>
    <div id="colorlib-main">
        <section class="ftco-section ftco-no-pt ftco-no-pb">
            <div class="container">
                <div class="row d-flex">
                    <div class="col-xl-8 py-5 px-md-5">
                        <div class="row pt-md-4">
                            <c:forEach items="${listPosts}" var="post">
                                <div class="col-md-12">
                                    <div class="blog-entry ftco-animate d-md-flex">
                                        <img class="img img-2" src="${post.getpImage()}" width="150px" height="150px"
                                            style="border-radius: 50%"/>
                                        <div class="text text-2 pl-md-4">
                                            <h3 class="mb-2">${post.getpTitle()}</h3>
                                            <div class="meta-wrap">
                                                <span><i class="icon-calendar mr-2"></i>${post.getpDate()}</span>&ensp;
                                                <span><i class="icon-folder-o mr-2"></i>${post.getpType()}</span>&ensp;
                                                <span><i class="icon-comment2 mr-2"></i>${post.getpView()} view</span>
                                                </p>
                                            </div>
                                            <p class="mb-4">${post.getpIntroduction()}</p>
                                            <form action="single.action">
                                                <input type="hidden" name="pId" value="${post.getpId()}"/>
                                                <button type="submit" style="border: none; background-color: white; color: blue">Read More &nbsp;
                                                    <span class="ion-ios-arrow-forward"></span></button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div><!-- END-->
                    </div>
                    <div class="col-xl-4 sidebar ftco-animate bg-light pt-5">
                        <div class="sidebar-box ftco-animate">
                            <h3 class="sidebar-heading">Categories</h3>
                            <ul class="categories">
                                <c:forEach var="type" items="${listTypes}">
                                    <li>${type.gettName()} <span style="float: right">(${type.gettQuantity()})</span></li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="sidebar-box ftco-animate">
                            <h3 class="sidebar-heading">Popular Articles</h3>
							<c:forEach items="${listFamousPosts}" var="famous">
								<div class="block-21 mb-4 d-flex">
									<a class="blog-img mr-4"><img src="${famous.getpImage()}" width="80px" height="80px"/></a>
									<div class="text">
                                        <form action="single.action">
                                            <input type="hidden" name="pId" value="${famous.getpId()}"/>
                                            <button class="button-famous-post" type="submit">${famous.getpTitle()}</button>
                                        </form>
										<div class="meta">
											<div><span class="icon-calendar"></span> ${famous.getpDate()}</div>
											<div><span class="icon-chat"></span> ${famous.getpView()} view</div>
										</div>
									</div>
								</div>
							</c:forEach>
                        </div>

                        <div class="sidebar-box subs-wrap img py-4"
                             style="background-image: url(${pageContext.request.contextPath}/template/images/bg_1.jpg);">
                            <div class="overlay"></div>
                            <h3 class="mb-4 sidebar-heading">Newsletter</h3>
                            <p class="mb-4">${about.getaNewsletter()}</p>
                        </div>

                        <div class="sidebar-box ftco-animate">
                            <h3 class="sidebar-heading">Paragraph</h3>
                            <p>${about.getaParagraph()}</p>
                        </div>
                    </div><!-- END COL -->
                </div>
            </div>
        </section>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
    </svg>
</div>
<jsp:include page="/common/js.jsp"/>
<script>
    document.getElementById("home-nav").className = "colorlib-active";
</script>
</body>
</html>