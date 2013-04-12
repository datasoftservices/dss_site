<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--[if IE 7 ]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8 oldie"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html xmlns="http://www.w3.org/1999/xhtml"><!--<![endif]-->
<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="404">
    <meta name="author" content="Bruno De Neve">

    <title>Datasoft Services::Fout 404</title>

    <link rel="stylesheet" type="text/css" media="screen"href="<c:url value='/resources/css/dss.css'/>" />

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
	<script src="//platform.linkedin.com/in.js" type="text/javascript">
  		api_key: e6hjqb61v0ib
	</script>
	
</head>

<body id="top">

	<div id="header-wrap">
	<header>
	    <nav>
			<ul>
				<li><a href="<c:url value='/index'/>">Home</a><span></span></li> 
				<li><a href="<c:url value='/news'/>">Nieuws</a><span></span></li>
				<li><a href="<c:url value='/jobs'/>">Jobs</a><span></span></li>
				<li><a href="<c:url value='/blog'/>">Blog</a><span></span></li>
			</ul>
		</nav>
	</header>
</div>
<!--/header-->
	
<%@ include file="includes/header.jsp" %>


<div id="nav-2-wrap">
  <div id="nav-2">
 
	




 
 	<div style="padding-top:4px;margin-left:60px;">

	  		<script src="//platform.linkedin.com/in.js" type="text/javascript"></script>
			<script type="IN/FollowCompany" data-id="1217272" data-counter="right"></script>
		
	</div>


    </div>
</div>

<div id="content-wrap">

    <!-- content -->
    
	<div id="content" class="clearfix">

   	    <!-- main -->
   	    
		<div id="main">
            
        		<h2>404 : Deze pagina is niet beschikbaar.</h2>
        	    	        
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
	<%@ include file="includes/bottom_bar.jsp" %>
<!-- /content-out -->
</div>



<%@ include file="includes/extra.jsp" %>
<%@ include file="includes/footer.jsp" %>

</body>
</html>
