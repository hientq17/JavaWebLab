<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Contact</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <jsp:include page="/common/css.jsp"/>
  </head>
  <body>

	<div id="colorlib-page">
		<jsp:include page="/common/aside.jsp"/>
		<div id="colorlib-main">
			<section class="ftco-section contact-section px-md-4">
	      <div class="container">
	        <div class="row d-flex mb-5 contact-info">
	          <div class="col-md-12 mb-4">
	            <h2 class="h3">Contact Information</h2>
	          </div>
	          <div class="w-100"></div>
	          <div class="col-lg-6 col-xl-4 d-flex mb-6">
	          	<div class="info bg-light p-4">
					<p> Address: </p>
					<p>${contact.getcAddress()}</p>
		          </div>
	          </div>
	          <div class="col-lg-6 col-xl-4 d-flex mb-6">
	          	<div class="info bg-light p-4">
					<p> Phone: </p>
					<a href="tel:${contact.getcPhone()}">${contact.getcPhone()}</a>
		          </div>
	          </div>
	          <div class="col-lg-6 col-xl-4 d-flex mb-6">
	          	<div class="info bg-light p-4">
		            <p> Email: </p>
					<a href="mailto:${contact.getcEmail()}">${contact.getcEmail()}</a>
		          </div>
	          </div>
	        </div>
	        <div class="row block-9">
	          <div class="col-lg-12 d-flex">
				  <div id="map" class="bg-light"></div>
				  <img id="yourLocation" style="display: none; margin-right: 10px;" src="template/images/geolocation.png" width="40px" height="40px" onclick="yourLocation()"/>
	          </div>
	        </div>
	      </div>
	    </section>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
	<jsp:include page="/common/js.jsp"/>
	<jsp:include page="/common/map.jsp"/>
	<script>
		document.getElementById("contact-nav").className = "colorlib-active";
	</script>
  </body>
</html>