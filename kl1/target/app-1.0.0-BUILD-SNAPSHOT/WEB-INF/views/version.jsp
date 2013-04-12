<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

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
    <meta name="description" content="Datasoft Services is steeds op zoek naar gemotiveerde en talentvolle medewerkers">
    <meta name="author" content="Bruno De Neve">

    <title>Datasoft Services::Jobs</title>

    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/resources/css/dss.css'/>" />

	<!-- Add jQuery library -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
	
	<!-- Add custom libraries -->
    <script src="<c:url value='/resources/javascript/scrollToTop.js'/>"></script>
    <script src="<c:url value='/resources/javascript/dss.js'/>"></script>
	
	 <script type="text/javascript">
	$(document).ready(function() {
		checkBrowserNonIE();
		$("#jscript-error").hide();
		$(".fancy-disclaimer").fancybox({});
		
	});
	
	</script>
	<script src="//platform.linkedin.com/in.js" type="text/javascript">
  		api_key: e6hjqb61v0ib
	</script>
	
	<%@ include file="includes/analytics.jsp" %>
	
</head>

<body id="top"">
	
<!--header -->
<div id="header-wrap">

</div>
<!--/header-->

	</div>

<div id="header">
	<a href="<c:url value='/index'/>"><img style="margin-left:15%;margin-top:15px;" src="<c:url value='/resources/images/logo.jpg'/>" /></a>

</div>

<div id="nav-2-wrap">
  <div id="nav-2">
 
 	<div style="padding-top:4px;margin-left:60px;width:200px;float:left;">

	  		<script src="//platform.linkedin.com/in.js" type="text/javascript"></script>
			<script type="IN/FollowCompany" data-id="1217272" data-counter="right"></script>

	</div>

	<div id="jscript-error" class="align-right jscript-error">
	<p>Om optimaal onze site te bezoeken dient u javascript in te schakelen!</p>
	</div>

    </div>
</div>

<div id="content-wrap">

    <!-- content -->
    
    <div id="content" class="clearfix" style="background: none">

   	    <!-- main -->
   	    
		<!--[if lte IE 8]>
			<![endif]-->
			<h2>Het spijt ons maar uw browser ondersteunt geen HTML5 of CSS3 ...</h2>
			<p>en daarvan maakt onze website veelvuldig gebruik. Om deze nieuwe technologie correct weer te geven in uw browser is het van belang dat u de meest recente versie van 
			Internet Explorer gebruikt. Momenteel gebruikt u versie 8 of lager. Hieronder vindt u een link naar een geschikte versie :</p>
			<a class="inline" href="http://windows.microsoft.com/en-US/internet-explorer/download-ie"><img src="<c:url value='/resources/images/IE.png'/>" /></a>
			<p>U kan ook overwegen om een andere browser te gebruiken :</p>
			<a class="inline" href="http://www.mozilla.org/en-US/firefox/new/"><img src="<c:url value='/resources/images/Firefox.png'/>" /></a>
			<a class="inline" href="http://www.opera.com/"><img src="<c:url value='/resources/images/Opera.png'/>" /></a>
			<a class="inline" href="http://www.google.com/chrome"><img src="<c:url value='/resources/images/Chrome.png'/>" /></a>
			
	
		
		
    <!-- content -->
	</div>
		<%@ include file="includes/bottom_bar.jsp" %>
<!-- /content-out -->
</div>

<%@ include file="includes/extra.jsp" %>

<%@ include file="includes/footer.jsp" %>

</body>
</html>