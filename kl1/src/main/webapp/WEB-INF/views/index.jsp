<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--[if IE 7 ]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8 oldie"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html xmlns="http://www.w3.org/1999/xhtml"><!--<![endif]-->
<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="Onze ICT-consultants ondersteunen en begeleiden uw project. Onze medewerkers zijn gecertifieerde experts">
    <meta name="author" content="Bruno De Neve">

    <title>Datasoft Services :: ICT experts voor uw project</title>

    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/resources/css/dss.css'/>" />
    	<link rel="stylesheet" href="<c:url value='/resources/css/flexslider.css'/>" type="text/css">




	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script src="<c:url value='/resources/javascript/jquery.flexslider.js'/>"></script>	

    <script>window.jQuery || document.write('<script src="js/jquery-1.6.1.min.js"><\/script>')</script>

	<!-- Add custom libraries -->
    <script src="<c:url value='/resources/javascript/scrollToTop.js'/>"></script>
    <script src="<c:url value='/resources/javascript/dss.js'/>"></script>
    
    <!-- Add fancyBox -->
	<link rel="stylesheet" href="<c:url value='/resources/javascript/fancybox/source/jquery.fancybox.css?v=2.1.0'/>" type="text/css" media="screen" />
	<script type="text/javascript" src="<c:url value='/resources/javascript/fancybox/source/jquery.fancybox.pack.js?v=2.1.0'/>"></script>
	
	<!-- Optionally add helpers - button, thumbnail and/or media -->
	<link rel="stylesheet" href="<c:url value='/resources/javascript/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.3'/>" type="text/css" media="screen" />
	<script type="text/javascript" src="<c:url value='/resources/javascript/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.3'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/javascript/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.3'/>"></script>
	
	<link rel="stylesheet" href="<c:url value='/resources/javascript/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.6'/>" type="text/css" media="screen" />
	<script type="text/javascript" src="<c:url value='/resources/javascript/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.6'/>"></script>

	<script type="text/javascript" charset="utf-8">
  $(window).load(function() {
    $('.flexslider').flexslider();
  });
	$(document).ready(function() {
		checkIEVersion();
		$("#jscript-error").hide();
		$("header nav ul li a").removeClass("current");
		$("header li:contains('Home')").addClass("current");
		$(".fancy-login").fancybox({});
		$(".fancy-disclaimer").fancybox({});
		
  	});
	</script>
	
    <!--[if lt IE 9]>
		<script src="/resources/javascript/html5shiv.js"></script>
	<![endif]-->
	
	<%@ include file="includes/analytics.jsp" %>
	
</head>

<body id="top">

	<c:set var="trail" value="index" scope="session" />
	 
	<%@ include file="includes/nav.jsp" %>
	
	<%@ include file="includes/header.jsp" %>
	
	<%@ include file="includes/slider.jsp" %>

<div id="content-wrap">

    <!-- content -->
    
    <div id="content" class="clearfix">

   	    <!-- main -->
        <div id="main">
			<div class="main-content">
			 
			<h2>Welkom</h2>
			
			<p>
				    <strong>Datasoft Services</strong> voorziet het detacheren van ICT-professionals in samenwerking met enkele grote IT-bedrijven.
 
Onze consultants zijn gecertificeerde  experts die helpen bij de realisatie van uw .NET/C# en JAVA/J2EE projecten.</p>
 
<p><strong>Datasoft Services</strong> is een dynamische ICT-speler die streeft naar een correcte samenwerking met haar klanten.</p>

				<a href="<c:url value='/jobs'/>"><img style="border:1px solid #EFEFEF" src="<c:url value='/resources/images/hire.png'/>" /></a>
      	    </div>

        <!-- /main -->
        </div>

        <!-- sidebar -->
		<div id="sidebar">
		
			<%@ include file="includes/about.jsp" %>    
		 
        <!-- /sidebar -->
		</div>

    <!-- content -->
	</div>
	 <div style="background-color:#f1f1f1;position:relative;height:10px;z-index:3;"></div>
<div style="z-index:1;height:50px;background-color:#f1f1f1;-webkit-box-shadow: 0px 3px 5px rgba(50, 50, 50, 0.6);
-moz-box-shadow:    0px 3px 5px rgba(50, 50, 50, 0.6);
box-shadow:         0px 3px 5px rgba(50, 50, 50, 0.6);position:relative;"></div>
<!-- /content-out -->
</div>


<%@ include file="includes/extra.jsp" %>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
