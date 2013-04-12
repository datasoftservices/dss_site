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
	
	 <script type="text/javascript">
	$(document).ready(function() {
		checkIEVersion();
		$("#jscript-error").hide();
		$("#postalcode").val("");
		$("header nav ul li a").removeClass("current");
		$("header li:contains('Jobs')").addClass("current");
		$("#description").htmlarea();
		$(".jHtmlArea").width("100%");
		$(".onload-hide").hide();
		$(".fancybox").fancybox({
			   height : 485,
			   fitToView : false,
			   autoSize : false,
			padding : 0,
			
	         
	    });

		$(".fancy-login").fancybox({});
		$(".fancy-disclaimer").fancybox({});
		$(".fancy-admin").fancybox({
			   height : 500,
			   width: 800,
			   fitToView : false,
			   autoSize : false,
			padding : 0,
			
	         
	    });
		
	});
	function checkReferral(b) {
		if(b=="true"){
			$('#werken').show('slow');
			$('#open').hide('slow');
			$('.filter-wrap').hide('fast');
		}
	}
	function formError(ref){
		if(ref != ""){
			$("#"+ref).fancybox({
				   height : 485,
				   fitToView : false,
				   autoSize : false,
				padding : 0,
				
		         
		    }).trigger('click');
		}
		}
	$(".disableMe").click(function(event){
		  event.preventDefault();
		});
	</script>
	<script src="//platform.linkedin.com/in.js" type="text/javascript">
  		api_key: e6hjqb61v0ib
	</script>
	
	<%@ include file="includes/analytics.jsp" %>
	
</head>

<body id="top" onload="javascript:formError('${sessionScope.errorOnSubmit}');checkReferral('${sessionScope.werken}');">

	<c:set var="trail" value="jobs" scope="session" />
	<c:set var="apply" value="false" scope="page" />
	

	
<%@ include file="includes/nav.jsp" %>

<%@ include file="includes/header.jsp" %>

<%@ include file="includes/bar.jsp" %>

<div id="content-wrap">

    <!-- content -->
    
    <div id="content" class="clearfix">

   	    <!-- main -->
   	    
		<div id="main">
                   	    	
  
            	
       									<!-- tags -->
		        <div class="filter-wrap align-left ${empty sessionScope.filterTagList ? 'invisible' : ''}">
		        <p id="filter">filter op :</p>
		        	<c:if  test="${!empty sessionScope.filterTagList}">
		       		<c:forEach items="${sessionScope.filterTagList}" var="filter" varStatus="i">
		       		
		       			                    <form:form id="${tags.tag.id}_form" method="post" action="${pageContext.request.contextPath}/jobs/search" commandName="tag" class="">
									<form:hidden path="name" value="${filter.name}" />   
									<form:hidden path="id" value="${filter.id}" />   
									<div class="filter"><input type="submit" value="${filter.name}" class=""/></div>
							</form:form>
								 
		       		</c:forEach>
		        </c:if>
		        </div>
		        
            <div id="open">
        	<h1>Wij zoeken ...</h1>
        	<c:if  test="${empty jobsList}">
        	<p>Momenteel hebben wij geen openstaande vacatures.</p>
        	</c:if>
      <c:forEach items="${errorList}" var="error">
      	<p>${error.rejectedValue}</p>
      	<p>${error.field}</p>
      	<p>${error}</p>
      </c:forEach>
			<div class="table">	
			
				<c:if  test="${!empty jobsList}">
					<c:forEach items="${jobsList}" var="job" varStatus="i">
	
						<div class="row pointer  ${job.id == 1 ? 'hidden' : ''} clearfix" 
								onclick="javascript:toggle_visibilityById('${job.id}_description')">
					
					   		<h3 class="clear-left inline">${job.title}</h3></br>
					   								   			
					   			<p class="inline">in <b>${job.location}</b> vanaf <b><fmt:formatDate pattern="dd-MM-yyyy" 
            value="${job.startDate}" /></b></p>		 
					   			  			
					   			<p class="inline"><span>tags</span></p>
                    
			                    <c:forEach items="${job.tags}" var="tags" varStatus="i">
				                    <form:form id="${tags.tag.id}_form" method="post" action="${pageContext.request.contextPath}/jobs/search" commandName="tag" class="inline">
											<form:hidden path="name" value="${tags.tag.name}" />   
											<form:hidden path="id" value="${tags.tag.id}" />   
											<input title="filter op deze tag" type="submit" value="${tags.tag.name}" class="tag-job"/>
									</form:form>
								</c:forEach>  	
										
					   			<div id="${job.id}_description" class="hidden">

					   				<p>${job.description}</p>		

									
					   			
					   			
					   			<c:set var="apply" value="false"/>
					   			<c:forEach items="${sessionScope.applicationSuccess}" var="app" varStatus="i">
					   					<c:if  test="${app==job.reference}">				
					   						<c:set var="apply" value="true"/> 
					   					</c:if>
					   				</c:forEach>		
					   				<p style="margin-top: 2px;margin-right: 10px;" class="align-right">
					   					<script type="IN/Apply" data-companyid="1217272" data-jobtitle="${job.title}" data-joblocation="${job.location}" data-showText="false" data-themecolor="#a0a0a0" data-phone="required" data-email="info@datasoftservices.be"></script>
									</p>
									<a  class="align-left ${pageScope.apply == 'true' ? 'disableMe' : 'fancybox'}" id="btnApply_${job.reference}" href="#${job.reference}"><input type="button" value="${pageScope.apply == 'true' ? 'U heeft gesolliciteerd!' : 'Solliciteren via de site'}" class="${pageScope.apply == 'true' ? 'linkedin_clone_disabled' : 'linkedin_clone'}"/></a>				   					   				
					   			</div>
					   			
					   			
					   			
					   			
					   			
						</div>
						
						<div id="${job.reference}" class="hidden dv-application">
						
						<h3>${job.title}<span class="${job.id == 1 ? 'hidden' : ''}">, te ${job.location}</span></h3>
							<div id="dv-application-form">
								
								<!-- JOB APPLICATION TOEVOEGEN -->	
								<form:form id="form_application_${job.id}_add" onsubmit="return validateForm('form_application_${job.id}_add')" method="post" action="jobs/add/application" 
										commandName="application" class="form form_application_add" enctype="multipart/form-data">
										
										<form:hidden id="applicantId" path="applicant.id" value="" class=""/>
									
									<label for="firstname">Naam<span><p>voornaam | achternaam</p><p class="error"></p></span></label>
										<form:input id="firstname" path="applicant.firstName" value=""  class=""/>
										<form:errors path="applicant.firstName" cssClass="error" />
							       		<form:input id="lastname" path="applicant.lastName" value="" class=""/>
							       				
									<label for="nationality">Nationaliteit<span><p>land van herkomst</p><p class="error"></p></span></label>
										<form:input id="nationality" path="applicant.nationality" value=""/>
										
									<label for="gender">Geslacht<span><p>man | vrouw</p><p class="error"></p></span></label>
										<!--<form:input id="gender" path="applicant.gender" value=""/>-->
										
										<form:select id="gender" path="applicant.gender" title="selecteer uw geslacht" class="">
								 		<form:option value="man" label="Man" selected=""/>
								 		<form:option value="vrouw" label="Vrouw" selected=""/>
								 		</form:select>
										
										
										
										
										
									<label for="dateofbirth">Geboortedatum<span><p>dd/mm/jjjj</p><p class="error"></p></span></label>
										<form:input id="dateofbirth" path="applicant.dateOfBirth" value="" class="jq-datepicker"/>
										
									<label for="email">E-mail<span><p>jan@voorbeeld.be</p><p class="error"></p></span></label>
										<form:input id="email" path="applicant.email" value="" class=""/>
										
									<label for="mobile">Telefoon<span><p>gsm | thuis</p><p class="error"></p></span></label>
										<form:input id="mobile" path="applicant.phoneMobile" value="" class=""/>
										<form:input id="home" path="applicant.phoneHome" value="" class=""/>
										
									<label for="address">Adres<span><p>straat | gemeente | postcode</p><p class="error"></p></span></label>
										<form:input id="address" path="applicant.address" value="" class=""/>
										<form:input id="city" path="applicant.city" value="" class=""/>
										<form:input id="postalcode" path="applicant.postalCode" value="" class=""/>
										
									<label for="country">Land<span><p>waar u verblijft</p><p class="error"></p></span></label>
										<form:input id="country" path="applicant.country" value="" class=""/>
										
									<label for="linkedin">Profiel<span><p>linkedIn | curriculum vitae</p><p class="error"></p></span></label>
										<form:input id="linkedin" path="applicant.linkedInURL" title="http://www.linkedin.com/in/mijnnaam" value="http://www.linkedin.com/in/mijnnaam" onclick="$(this).val('');$(this).css('color','#000');" class=""/>
										<form:hidden id="resumeURL" path="applicant.resumeURL" value="" class=""/>
										<form:input id="${job.id}resume" path="resume.file" type="file" class="hidden"/>
										<input type="text" id="${job.id}resumeAlt" title="upload jouw CV" class=""/>
										<input type="button" style="float:left;margin: 0px 10px;" class="button" onclick="javascript:clickUpload('${job.id}resume');" value="upload CV"/>
										
									<form:hidden path="job.reference" value="${job.reference}"/>
									<input class="button" type="submit" value="ik stel me kandidaat!"/>  
									<img class="align-left hidden" src="<c:url value='/resources/images/loading_transparent.gif'/>" alt="loading"/>
						      		<p id="loading" class="hidden">even geduld ... wij verwerken uw gegevens</p>
									
						        </form:form>
						        
						        <!-- Onhange Event Listener -->
						        <script>
						        $(function() {
						    		$("#"+${job.id}+"resume").change(function() {
						    				var temp = $("#"+${job.id}+"resume").val();
						    				temp = temp.replace("C:\\fakepath\\", "");
						    			  $("#"+${job.id}+"resumeAlt").val(temp);
						    			});
						    	});
						        </script>

	        				</div>
	        				
						</div>
						
					</c:forEach>
				</c:if>
				
			</div>	
		</div>
		<div id="werken" class="hidden">
			<h1>Werken @ Datasoft Services</h1></br>
			<img src="<c:url value='/resources/images/werken.png'/>" />
			</br></br><p> <strong>Datasoft Services</strong> besteedt veel aandacht aan het begeleiden, opleiden en ontwikkelen van medewerkers. We bieden jou de mogelijkheid om een carri&#232;repad te kiezen dat afgestemd is op jouw talenten en ambities.

</br></br>Werken bij <strong>Datasoft Services</strong> betekent werken aan uitdagende projecten binnen een veelzijdige klantenkring. Dit alles in een inspirerende werkomgeving met collega's die net zo gedreven zijn als jij.

Contacten met je Datasoft Services collega's worden gestimuleerd tijdens de meetings en door het organiseren van sociale events.
</br></br>Daarnaast biedt <strong>Datasoft Services</strong> je een prima salaris en een aantrekkelijk pakket arbeidsvoorwaarden.
 
Opleiding tijdens de werkuren, opdrachten dichtbij de woonplaats, opdrachten samen met de consultant selecteren, een goede en correcte verloning, GEEN nummer binnen het bedrijf, enz..</p>
		</div>	

		        
			</div>
			<!-- /main -->
	        
	        <!-- sidebar -->        
  	
			<div id="sidebar">
							
				<div class="sidemenu">
					<h3>Jobs</h3>
	                <ul>
						<li><a href="#" onclick="javascript:$('#open').show('slow');$('#werken').hide('slow');$('.filter-wrap').show('slow');">Open vacatures</a></li>
						<li><a class="fancybox" href="#SPONTAAN">Spontane sollicitatie</a></li>
						<li><a href="#" onclick="javascript:$('#werken').show('slow');$('#open').hide('slow');$('.filter-wrap').hide('fast');">Werken @ Datasoftservices</a></li>
					</ul>
	
				</div>    
				
				<%@ include file="includes/sidebar_news.jsp" %>        
	
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
