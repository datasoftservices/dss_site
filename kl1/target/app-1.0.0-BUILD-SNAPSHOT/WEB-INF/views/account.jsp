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

    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="">

    <title>Datasoft Services::Instellingen</title>

    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/resources/css/dss.css'/>" />

	<!-- Add jQuery library -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <!--<script>window.jQuery || document.write('<script src="js/jquery-1.6.1.min.js"><\/script>')</script>-->

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
	
	<!-- Add jHtmlArea library -->
	<link rel="stylesheet" href="<c:url value='/resources/javascript/jHtmlArea/style/jqueryui/ui-lightness/jquery-ui-1.7.2.custom.css'/>" type="text/css" media="screen" />	
	<link rel="stylesheet" href="<c:url value='/resources/javascript/jHtmlArea/style/jHtmlArea.css'/>" type="text/css" media="screen" />
	<script type="text/javascript" src="<c:url value='/resources/javascript/jHtmlArea/scripts/jHtmlArea-0.7.5.js'/>"></script>
	
	<script type="text/javascript" charset="utf-8">
	function validate(){
		if($('#cert_date').val()=='' || $('#cert_date').val()==null || $('#cert_date').val()=='certificaat datum'){
			alert('Gelieve een datum op te geven voor het certificaat');
			return false;
			}
		if(!isValidDate($('#cert_date').val())){
			alert('Geen geldig datum formaat | geldig formaat : dd/mm/jjjj');
			return false;
			}
		return true;
		}
	function validatePassword(){
		if($('#userPassword').val()!=$('#password_confirm').val()){
			alert('Er is een verschil tussen uw nieuw paswoord en de bevestiging van uw paswoord. Gelieve opnieuw te proberen.');
			$('#userPassword').val('');
			$('#password_confirm').val('');
			return false;
			}
		if($('#userPassword').val()==''){
			alert('Uw paswoord mag niet blank zijn. Gelieve een veilig paswword te kiezen!');
			return false;
			}
		return true;
		}
	$(document).ready(function() {
		checkIEVersion();
		$("#jscript-error").hide();
		$("header nav ul li a").removeClass("current");
		$("header li:contains('Instellingen')").addClass("current");
		$("#nav-2 a").removeClass("active");
		$("#nav-2 a:contains('instellingen')").addClass("active");
		$(".fancy-login").fancybox({});

		$(".jHtmlArea").width("95%");
		$(".onload-hide").hide();
		$(".fancy-disclaimer").fancybox({});
		$("#cert_date").toggleText("certificaat datum","");	
  	});

	</script>

	<%@ include file="includes/analytics.jsp" %>
	
</head>

<body id="top">
	
	 <c:set var="trail" value="index" scope="session" />


<%@ include file="includes/nav.jsp" %>

<%@ include file="includes/header.jsp" %>

<%@ include file="includes/bar.jsp" %>

<div id="content-wrap">

    <!-- content -->
    
    <div id="content" class="clearfix">

   	    <!-- main -->
   	    
        <div id="main">
        
        <div class="account-table-row clearfix">
        <a href="#" onclick="javascript:$('#form_update_user').toggle('fast');" ><h3>+ wijzig mijn paswoord</h3></a>
        
        <form:form id="form_update_user" onsubmit="return validatePassword()" method="post" action="account/reset" commandName="password" class="form hidden">
								<form:hidden path="userId" value="${user.userId}"  class=""/>
								<form:hidden path="userName" value="${user.userName}"  class=""/>
								<form:hidden path="enabled" value="${user.enabled}"/>
								<label for="password">Nieuw paswoord<span><p>kies een veilig paswoord</p></span></label>	
								<form:password id="userPassword" path="userPassword" value=""  class=""/>
								<label for="password_confirm">Bevestig paswoord<span><p>bevestig nogmaals uw paswoord</p></span></label>	
								<input id="password_confirm" type="password" value="" class="align-left"></input>
								<input type="submit" value="bevestigen" class="button" />
								</form:form>
        </div>
        
        <div class="account-table-row clearfix">
        <a href="#" onclick="javascript:$('#form_update_userdetails').toggle('fast');" ><h3>+ Beheer mijn profiel</h3></a>
        
        <form:form id="form_update_userdetails" method="post" action="account/profile" commandName="profile" class="form hidden">
				<form:hidden path="userId" value="${profile.userId}"  class=""/>
			<label for="firstName">Voornaam<span><p>jouw voornaam</p></span></label>
				<form:input id="" path="firstName" value="${profile.firstName}" class="align-left"/>
			<label for="lastName">Familienaam<span><p>jouw familienaam</p></span></label>
				<form:input id="" path="lastName" value="${profile.lastName}" class="align-left"/>
			<label for="email">E-mail<span><p>e-mail adres</p></span></label>
				<form:input id="" path="email" value="${profile.email}" class="align-left"/>
				<form:hidden path="visible" value="${profile.visible}"  class=""/>
				<form:hidden path="employedSince" value="${profile.employedSince}"  class=""/>
				<form:hidden id="" path="imageURL" value="${profile.imageURL}"/>
			<label for="description">Profiel tekst<span><p>te zien op de "Over ons" pagina</p></span></label>
			<form:textarea  id="" path="description" cols="50" rows="10" class="align-left"/>	
			
								<input style="margin-left:210px;" type="submit" value="bevestigen" class="button align-left clear-left" />
								</form:form>
        </div>
        
        <div class="account-table-row clearfix">
        <a href="#" onclick="javascript:$('#form_update_certifications').toggle('fast');$('.certifications').toggle('fast');" ><h3>+ Beheer mijn certificaten</h3></a>
	       <ul style="list-style: none;margin:0;" class="hidden certifications">
	       <c:forEach items="${userCertList}" var="cert">
	       		<li style="font-size: 14px ;">
	       			<form:form id="" method="post" action="account/certification/delete" commandName="cert" class="">
	       				<form:hidden path="id" value="${cert.id}"  class=""/>
						<form:hidden path="detail.userId" value="${profile.userId}"  class=""/>
						<form:hidden path="certification.id" value="${cert.certification.id}"  class=""/>
						
						<div class="certification"><input type="submit" value="- ${cert.certification.name} | behaald op ${cert.certificationDate}" class="" /></div>
					</form:form>
					</li>
	       </c:forEach>
	       </ul>      
	       
        <form:form id="form_update_certifications" onsubmit="return validate()" method="post" action="account/certification" commandName="cert" class="form hidden">
				<h3>+ Toevoegen certificaat</h3>
				<form:hidden path="detail.userId" value="${profile.userId}"  class=""/>
				<form:input id="cert_date" title="certificaat behaald op datum | formaat: dd/mm/jjjj | verplicht veld" path="certificationDate" value="certificaat datum" class="align-left"/>
				<form:select id="" path="certification.id" items="${certList}" style="margin-top:8px;" itemValue="id" itemLabel="name" class="form_select align-left clear-left"/> 		
				<input style="margin-left:10px;margin-bottom: 15px;" type="submit" value="toevoegen" class="button clear-left align-left" />
			</form:form>
        </div>
        
		</div>
		
		<!-- /main -->
        <!-- sidebar -->
        
		<div id="sidebar">
			
			<%@ include file="includes/sidebar_news.jsp" %>
			<%@ include file="includes/archive.jsp" %>				
			<%@ include file="includes/about.jsp" %>

        <!-- /sidebar -->
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
