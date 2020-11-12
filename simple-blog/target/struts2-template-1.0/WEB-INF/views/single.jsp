<%@ include file="/common/taglib.jsp" %>
<s:bean var="dao" name="edu.fpt.dao.PostDAO"/>
<c:set var="pos" value='<%= request.getParameter("pos") %>'/>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Post</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<jsp:include page="/common/css.jsp"/>
</head>
<body>
<div id="colorlib-page">
	<jsp:include page="/common/aside.jsp"/>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-10 py-10 px-md-10">
						<div class="row pt-md-4">
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<img class="img img-2" src="${pos.getpImage()}" width="150px" height="150px"
											 style="border-radius: 50%"/>
										<div class="text text-2 pl-md-4">
											<h3 class="mb-2">${pos.getpTitle()}</h3>
											<div class="meta-wrap">
												<span><i class="icon-calendar mr-2"></i>${pos.getpDate()}</span>&emsp;&emsp;
												<span><i class="icon-folder-o mr-2"></i>${pos.getpType()}</span>&emsp;&emsp;
												<span><i class="icon-comment2 mr-2"></i>${pos.getpView()} view</span>
												</p>
											</div>
											<p class="mb-4">${pos.getpIntroduction()}</p>
											<img src="${pos.getpImage()}" style="margin-bottom: 20px"/>
											<p class="mb-4">${pos.getpContent()}</p>
											<a href="#" style="margin: auto" class="btn-custom" onclick="history.go(-1)">Back to home <span
													class="ion-ios-arrow-forward"></span></a>
										</div>
									</div>
								</div>
						</div><!-- END-->
					</div>
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