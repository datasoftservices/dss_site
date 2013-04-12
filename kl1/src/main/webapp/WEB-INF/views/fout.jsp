<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--[if IE 7 ]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8 oldie"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html xmlns="http://www.w3.org/1999/xhtml"><!--<![endif]-->
<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Datasoft Services::Fout</title>

    <link rel="stylesheet" type="text/css" media="screen"href="<c:url value='/resources/css/coolblue.css'/>" />


	<!-- Add jQuery library -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
	
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
		$(".fancy-disclaimer").fancybox({});
  	});

	</script>
	<script src="//platform.linkedin.com/in.js" type="text/javascript">
  		api_key: e6hjqb61v0ib
	</script>
	
</head>

<body id="top">

	
<%@ include file="includes/nav.jsp" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/bar.jsp" %>

<div id="content-wrap">

    <!-- content -->
    
	<div id="content" class="clearfix">

   	    <!-- main -->
   	    
		<div id="main">
            
        		<h2>Fout in de pagina</h2>
				<c:choose>
					<c:when test="${fn:contains(exception.message, 'SizeLimitExceededException')}">
   						<h3>Bij het uploaden van een curriculum vitae, hou rekening met een maximale bestandsgrootte van 10MB. Gelieve het nogmaals te proberen.</h3>
					</c:when>
					<c:otherwise>
						<h2>${exception.message}</h2>
					</c:otherwise>
				</c:choose>
        	    	        
		</div>
		<!-- /main -->
		
		<!-- sidebar -->
        
		<div id="sidebar">
			
			<div class="sidemenu">
				<img alt="error" title="Fout" src="<c:url value='/resources/images/error_icon.jpg'/>" /></a>
			</div>
			
	    </div>
		<!-- /sidebar -->
		
    <!-- content -->
	</div>

<!-- /content-out -->
</div>

<div style="height:50px;position:relative;background-color:#f1f1f1;border-top: solid 1px #e7e7e7;-webkit-box-shadow: 0px 3px 5px rgba(50, 50, 50, 0.6);
-moz-box-shadow:    0px 3px 5px rgba(50, 50, 50, 0.6);
box-shadow:         0px 3px 5px rgba(50, 50, 50, 0.6);"></div>

<%@ include file="includes/extra.jsp" %>
<%@ include file="includes/footer.jsp" %>

</body>
</html>
