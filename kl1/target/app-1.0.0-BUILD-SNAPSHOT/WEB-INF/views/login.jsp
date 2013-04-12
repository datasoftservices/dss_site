<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--[if IE 7 ]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8 oldie"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html xmlns="http://www.w3.org/1999/xhtml"> <!--<![endif]-->

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Datasoft Services::Login</title>

    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/resources/css/dss.css'/>" />

    <!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
	<!-- Add jQuery library -->
	<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>-->
	<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>-->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>

	<!-- Add custom libraries -->
    <script src="<c:url value='/resources/javascript/scrollToTop.js'/>"></script>
    <script src="<c:url value='/resources/javascript/dss.js'/>"></script>
	
		<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		checkIEVersion();
		$("#jscript-error").hide();
		
  	});
	</script>
	
	<%@ include file="includes/analytics.jsp" %>
	
</head>

<body id="top">

<%@ include file="includes/nav.jsp" %>

<%@ include file="includes/header.jsp" %>

<%@ include file="includes/bar.jsp" %>

<!-- content-wrap -->

<div id="content-wrap">

    <!-- content -->
    <div id="content" class="clearfix no-sidebar">
		<div id="main-no-sidebar">

   	    <!-- main -->
	
		<form style="margin: 0 auto;margin-top: -20px" name='f' action="<c:url value='j_spring_security_check' />" method='post' class="form_login form clearfix">
				

				<h3 style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Verdana, Sans-Serif;font-weight:bold;margin-left:90px;padding-bottom: 10px;">Aanmelden bij Datasoft Services</h3>

                    <label for="username">Gebruikersnaam <span><p>verplicht</p></span></label>
                   <input type='text' id="username" name='j_username' value=''>



                    <label for="password">Wachtwoord<span><p>verplicht</p></span> </label> 
                    <input type='password' id="password" name='j_password' />
 
                    <input name="submit" type="submit" value="Aamelden" class="button align-left"/>
         			<input name="reset" type="reset" value="Reset" class="button align-left" />

					<c:if test="${param.error == 'true'}">
					<p style="margin:10px 0 0 50px;float: left;clear:both;color:red;font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Verdana, Sans-Serif;">Aanmelden mislukt, gelieve nogmaals te proberen<br/> 
						Reden : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
					</p>

	</c:if>

				</form>
		

        <!-- /main -->
		</div>
    <!-- content -->
	</div>
<%@ include file="includes/bottom_bar.jsp" %>
<!-- /content-out -->
</div>
<%@ include file="includes/extra.jsp" %>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
