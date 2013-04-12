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
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Datsoft Services::Gebruikers beheer</title>

    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/resources/css/dss.css'/>" />
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>

    <!-- Add fancyBox -->
	<link rel="stylesheet" href="<c:url value='/resources/javascript/fancybox/source/jquery.fancybox.css?v=2.1.0'/>" type="text/css" media="screen" />
	<script type="text/javascript" src="<c:url value='/resources/javascript/fancybox/source/jquery.fancybox.pack.js?v=2.1.0'/>"></script>
	
	<!-- Optionally add helpers - button, thumbnail and/or media -->
	<link rel="stylesheet" href="<c:url value='/resources/javascript/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.3'/>" type="text/css" media="screen" />
	<script type="text/javascript" src="<c:url value='/resources/javascript/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.3'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/javascript/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.3'/>"></script>
	
	<link rel="stylesheet" href="<c:url value='/resources/javascript/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.6'/>" type="text/css" media="screen" />
	<script type="text/javascript" src="<c:url value='/resources/javascript/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.6'/>"></script>

    <script src="<c:url value='/resources/javascript/scrollToTop.js'/>"></script>
    <script src="<c:url value='/resources/javascript/dss.js'/>"></script>

	<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		checkIEVersion();
		$("#jscript-error").hide();
		$("#nav-2 a").removeClass("active");
		$("#nav-2 a:contains('gebruikers')").addClass("active");
		$(".fancy-login").fancybox({});
		$(".fancy-disclaimer").fancybox({});
		$("#description").text($("#description_hidden").text());
		if($('#reset_ok').length != 0){
			alert("Het paswoord van de gebruiker werd gereset");
		}
  	});
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
   	     <sec:authorize access="hasRole('ROLE_ADMIN')">
		<div id="main">	
       
			<h2>${uf.detail.firstName} ${uf.detail.lastName}</h2>
	
				<form:form id="form-update-user" method="post" action="update" commandName="user" class="form">
				
					<label for="title">Gebruikersnaam<span><p>hiermee wordt ingelogd</p></span></label>
						<form:input path="user.userName" value="${uf.user.userName}"/>
			 		<label for="title">Voornaam<span><p>van de gebruiker</p></span></label>
						<form:input path="detail.firstName" value="${uf.detail.firstName}"  class=""/>
					<label for="title">Familienaam<span><p>van de gebruiker</p></span></label>
						<form:input path="detail.lastName" value="${uf.detail.lastName}" class=""/>
			 		<label for="title">E-mail<span><p>van de gebruiker</p></span></label>
						<form:input path="detail.email" value="${uf.detail.email}" class=""/>
			
						<form:hidden path="detail.userId" value="${uf.detail.userId}"/>
						<form:hidden path="role.userRoleId" value="${uf.role.userRoleId}"/>
						
					<label for="title">Toegangsrechten<span><p>van de gebruiker</p></span></label>
						<form:select path="role.authority" title="bepaal de toegangsrechten van de gebruiker">   
							<c:forEach items="${roleList}" var="role">
								 <form:option value="${role}" label="${role}" selected="${role==uf.role.authority ? 'selected' : ''}"/>
							</c:forEach>
						</form:select>
					<label for="title">Zichtbaar<span><p>tonen op team pagina [1 of 0]</p></span></label>
						<form:input path="detail.visible" value="${uf.detail.visible}" class=""/> 
					<label for="title">In dienst sinds<span><p>datum in dienst [vrij formaat]</p></span></label>			
						<form:input path="detail.employedSince" value="${uf.detail.employedSince}" class=""/>
					<label for="title">Profiel foto URL<span><p>URL van profiel foto</p></span></label>			
						<form:input path="detail.imageURL" value="${uf.detail.imageURL}" class=""/>
					<label for="title">Profiel tekst<span><p>van de gebruiker</p></span></label>
						<form:textarea id="description" path="detail.description" cols="50" rows="10" class=""/>
						<div id="description_hidden" class="hidden">${uf.detail.description}</div>
					<label for="title">Functie<span><p>binnen Datasoft Services</p></span></label>			
						<form:input path="detail.position" value="${uf.detail.position}" class=""/>
					<label for="title">Linkedin URL<span><p>URL van het Linkedin profiel</p></span></label>						
						<form:input path="detail.linkedinURL" value="${uf.detail.linkedinURL}" class=""/>					
						
						<form:hidden path="user.userPassword" value="${uf.user.userPassword}"/>
						<form:hidden path="user.userId" value="${uf.user.userId}"/>
							
						<input class="clear-left align-left button" style="margin-left:210px;" type="submit" value="wijzigingen opslaan" />
			</form:form>
							
			<form:form id="form-reset-pw" method="post" action="reset" commandName="password" class="hidden">
						<form:hidden path="userName" value="${uf.user.userName}"/>
						<form:hidden path="userdetail.email" value="${uf.detail.email}" class=""/>
						<form:hidden path="userdetail.userId" value="${uf.detail.userId}"/>		
						<form:hidden path="userdetail.firstName" value="${uf.detail.firstName}"/>	
						<form:hidden path="userdetail.lastName" value="${uf.detail.lastName}"/>				
						<form:hidden path="userPassword" value="${uf.user.userPassword}"/>
						<form:hidden path="userId" value="${uf.user.userId}"/>
						<form:hidden path="enabled" value="${uf.user.enabled}"/>
			</form:form>					

        </div>
       	<div id="sidebar">
			
							<div class="sidemenu">
					<h3>Opties</h3>
	                <ul>
						<li><a href="#" onclick="javascript:$('#form-reset-pw').submit();">Reset paswoord</a></li>
						<li id="${reset_ok}" class="hidden"></li>
						<c:set var="reset_ok" value="" scope="session" />
					</ul>
	
				</div>

        <!-- /sidebar -->
		</div>
		</sec:authorize>
    <!-- content -->
	</div>
<div style="height:50px;background-color:#f1f1f1;border-top: solid 1px #e7e7e7;-webkit-box-shadow: 0px 3px 5px rgba(50, 50, 50, 0.6);
-moz-box-shadow:    0px 3px 5px rgba(50, 50, 50, 0.6);
box-shadow:         0px 3px 5px rgba(50, 50, 50, 0.6);"></div>
<!-- /content-out -->
</div>


<%@ include file="includes/extra.jsp" %>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
