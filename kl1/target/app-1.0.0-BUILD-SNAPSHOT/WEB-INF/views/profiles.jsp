<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--[if IE 7 ]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8 oldie"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html xmlns="http://www.w3.org/1999/xhtml"><!--<![endif]-->
<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="Onze ICT-consultants ondersteunen en begeleiden uw project. Onze medewerkers zijn gecertifieerde experts">
    <meta name="author" content="Bruno De Neve">

    <title>Datasoft Services :: Over ons</title>

    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/resources/css/dss.css'/>" />
    	<link rel="stylesheet" href="<c:url value='/resources/css/flexslider.css'/>" type="text/css">

	<!-- Add jQuery library -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
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

	$(document).ready(function() {
		checkIEVersion();
		$("#jscript-error").hide();
		$("header nav ul li a").removeClass("current");
		$("header li:contains('Over')").addClass("current");
		$(".fancy-login").fancybox({});
		$(".fancy-disclaimer").fancybox({});
		$('#container_large_1').css('z-index','2');
		$('#container_large_1').addClass('active-profile');
		var h = $('#container_large_12').css("height");
		$('#large-container').css('height',h);
		$('[id^="container_"]').click(function() {
			  $("html, body").animate({ scrollTop: 0 }, "slow");
			  return false;
			});
  	});

  	
	</script>
	
    <!--[if lt IE 9]>
		<script src="/resources/javascript/html5shiv.js"></script>
	<![endif]-->
	
</head>

<body id="top">

	<c:set var="trail" value="team" scope="session" />
	 
	<%@ include file="includes/nav.jsp" %>
	
	<%@ include file="includes/header.jsp" %>
	
	<%@ include file="includes/bar.jsp" %>

<div id="content-wrap">

    <!-- content -->
    
    <div id="content" class="clearfix no-sidebar">

   	    <!-- main -->
        <div id="main-no-sidebar">
        	<div style="float:left;width:70%;">
        	<div id="about">
			<h1>Over ons</h1>
			<h2>Wie zijn we</h2>
			<p style="text-align: justify;"> Een hechte groep van van ambitieuze ICT-professionals die elke dag hard hun best doen om projecten te doen slagen. We hebben elk onze specialiteit binnen het domein van onze expertise. Certifi&#235;ring is voor ons heel belangrijk, wij scholen ons constant bij (of om als het nodig is) en volgen de ontwikkeling binnen de ICT op de voet. Hoewel we slechts enkele keren per jaar elkaar allemaal zien, zijn we toch een toffe bende collega's en zeker niet te beroerd om te vertellen hoe het er bij Datasoft Services aan toe gaat!  </p>
			<h2>Werken bij ons</h2>
			<p style="text-align: justify;"> Wij besteden veel aandacht aan het begeleiden, opleiden en ontwikkelen van medewerkers. We bieden jou de mogelijkheid om een carri&#232;repad te kiezen dat afgestemd is op jouw talenten en ambities.

</br></br>Werken bij <strong>Datasoft Services</strong> betekent werken aan uitdagende projecten binnen een veelzijdige klantenkring. Dit alles in een inspirerende werkomgeving met collega's die net zo gedreven zijn als jij.

Contacten met je Datasoft Services collega's worden gestimuleerd tijdens de meetings en door het organiseren van sociale events.
</br>Daarnaast bieden we je een prima salaris en een aantrekkelijk pakket arbeidsvoorwaarden.
 
Opleiding tijdens de werkuren, opdrachten dichtbij de woonplaats, opdrachten samen met de consultant selecteren, een goede en correcte verloning, GEEN nummer binnen het bedrijf, enz..</p>
		
			
			
			</div>
			
			<c:forEach items="${profiles}" var="profile">
			<div id="${profile.firstName}" style="display: none;" class="team_member">
				<h1 style="display:inline;margin-right:10px;">${profile.firstName} </h1><h2 style="display:inline"> ${profile.position}</h2><c:if  test="${!empty profile.linkedinURL}"><a target="_new" style="margin-left:10px;color: #3F3F3F;" href="${profile.linkedinURL}"><img style="margin-bottom:-1px;" src="<c:url value='/resources/images/linkedin16.png'/>"/></a></c:if>
				
				<c:if  test="${!empty profile.certifications}">
				<h3 style="border-top:1px solid #cecece;padding-top:15px;letter-spacing:1px;">Behaalde certificaten</h3>
				</c:if>
				<ul style="list-style: none;margin:0;font-family:arial;"><c:forEach items="${profile.certifications}" var="c">
							<li style="font-size: 14px ;">- ${c.certification.name} |<strong> <fmt:formatDate pattern="MMMMMMMMMM yyyy" value="${c.certificationDate}"/></strong></li>
						</c:forEach></ul>
				
				<c:if  test="${!empty profile.description}">
				<h3 style="border-top:1px solid #cecece;padding-top:15px;letter-spacing:1px;">${profile.firstName} zegt</h3>
				</c:if>
					<p style="margin-left: 14px;text-align:justify;font-family:arial;">${profile.description}</p>

			</div>
				
			</c:forEach>
			</div>
			
			<div style="border-left:1px solid #cecece;float:right;padding-left:15px">
			<c:forEach items="${profiles}" var="profile">
				
				
				<div id="container_${profile.userId}" style="position:relative;background-color:#F1F1F1;width:240px;float:right;clear:right;margin:0 20px 20px 0;height:102px;overflow:hidden;" onclick="javascript:$('#about').hide();$('.team_member').hide();$('#${profile.firstName}').show();$('.overlay').fadeTo('fast',0.6);$('.overlay',this).fadeTo('fast',0.0);$('.notgreyed').hide();$('.greyed').show();$('.notgreyed',this).show();$('.greyed',this).hide();">
				 <div class="overlay" style="width:240px;height:102px;z-index:10;position:absolute;background-color: #8D8D8D;display:none;"></div>
					<div style="height:80px;position:relative;float:left">
						<c:if  test="${empty profile.imageURL}"><a title="${profile.firstName}" onclick="javascript:"><img src="<c:url value='/resources/images/def.png'/>" /></a></c:if>
						<c:if  test="${!empty profile.imageURL}"><a title="${profile.firstName}" ><img class="notgreyed" src="<c:url value='${profile.imageURL}.png'/>" /></a><a title="${profile.firstName}" ><img class="greyed hidden" src="<c:url value='${profile.imageURL}_grey.png'/>" /></a></c:if>
						
					</div>
					
					<p class="profile-name">${profile.firstName} </p>	
				 <p style="float:left;width:230px;color:#fff;background-color:#1B6BB5;padding: 3px 0px 3px 10px;margin:0;font:13px 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Verdana, Sans-serif;">${profile.position}</p>
				</div>
				
			</c:forEach>
			</div>

        <!-- /main -->
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
