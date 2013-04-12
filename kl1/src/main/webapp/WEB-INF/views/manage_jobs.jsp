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
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Datasoft Services::Beheer jobs</title>

    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/resources/css/dss.css'/>" />

	<!-- Add jQuery library -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
	
	<!-- Add custom libraries -->
    <script src="<c:url value='/resources/javascript/scrollToTop.js'/>"></script>
    <script src="<c:url value='/resources/javascript/dss.js'/>"></script>

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
		$("#nav-2 a").removeClass("active");
		$("#nav-2 a:contains('jobs')").addClass("active");
		$("#description").htmlarea();
		$(".jHtmlArea").width("681px");
		$(".onload-hide").hide();		
	});
	$(window).scroll(function(){
	       $(".scrollingDiv")
	              .stop()
	              .animate({"marginTop": ($(window).scrollTop()) + "px"}, "slow" );
	});
	</script>
	<script src="//platform.linkedin.com/in.js" type="text/javascript">
  		api_key: e6hjqb61v0ib
	</script>
	
	<%@ include file="includes/analytics.jsp" %>
	
</head>

<body id="top">

	<c:set var="trail" value="jobs/manage" scope="session" />
	<c:set var="apply" value="false" scope="page" />
	

	
<%@ include file="includes/nav.jsp" %>

<%@ include file="includes/header.jsp" %>

<%@ include file="includes/bar.jsp" %>

<div id="content-wrap">

    <!-- content -->
    
    <div id="content" class="clearfix">

   	    <!-- main -->
   	     <sec:authorize access="hasRole('ROLE_ADMIN')">
		<div id="main">
            
           
        		
        		 <!-- JOB TOEVOEGEN -->		
        		<div class="controls">
        			<a class="" href="javascript:toggle_visibilityById('forms_add')">+ job toevoegen</a>		
        		</div>
			<div id="forms_add" class="forms clearfix onload-hide">
			<form:form id="form_add" method="post" action="add/job" modelAttribute="job" class="form">
				
					<label for="title">Titel<span><p>functie</p></span></label>
						<form:input id="" path="title" value=""  class=""/>
						
					<label id="lblDescription" for="description">Omschrijving<span><p>job invulling</p></span></label>
			       		<form:textarea id="description" rows="10" cols="60" path="description" value="" class=""/>
			       				
					<label for="location">Locatie<span><p>waar?</p></span></label>
						<form:input id="" path="location" value=""/>
						
					<label for="category">Categorie<span><p>...</p></span></label>
						<form:input id="" path="category" value=""/>
						
					<label for="period">periode<span><p>duur van job</p></span></label>
						<form:input id="" path="period" value="" class=""/>
						
					<label for="startDate">Start<span><p>begint op dd/mm/jjjj</p></span></label>
						<form:input id="" path="startDate" value="" class=""/>
						
					<label for="type">Type<span><p>deelgebied</p></span></label>
						<form:input id="" path="type" value="" class=""/>
					
					<label for="visible_from">Zichtbaar<span><p>van | tot</p></span></label>
						<form:input id="" path="visible_from" value="dd/mm/jjjj" class=""/>
						<form:input id="" path="visible_until" value="dd/mm/jjjj" class=""/>	
						
					<label for="visible_for">Zichtbaar<span><p>voor rol</p></span></label>	
						<form:select path="visible_for" items="${roleList}" value="${role}"/>
			
					<input class="button" type="submit" value="toevoegen"/>  
		        </form:form>
		     </div>
		
			<c:forTokens items="Open,Gesloten" delims="," var="type">
				<c:choose>
    				<c:when test="${type == 'Open'}">
       					<c:set var="list" value="${jobsList}" scope="page" />
    				</c:when>
   					<c:otherwise>
   						<c:set var="list" value="${closedJobsList}" scope="page" />
   					</c:otherwise>
				</c:choose>
			

				<h2 class="clear-left extra-margin">${type} vacatures</h2>
<div class="job-table">
      			<c:if  test="${!empty list}">
					<c:forEach items="${list}" var="job" varStatus="i">
	
						<div class="job-table-row ${i.index % 2 == 0 ? 'even' : 'odd'} clearfix" onmouseover="javascript:$('.hidden').hide();$('#job_${job.id}_kandidaten').show('fast');">

					   			<h5 onclick="javascript:toggle_visibilityById('${job}')" class="pointer align-left">${job.title} [${job.reference}]</h5>
					   			 	<!-- <a class="link" style="float:right;" href="javascript:toggle_visibilityById('form_${job.id}_update');$('#form_${job.id}_update_tag').toggle();loadTextArea('form_${job.id}_update','placeholder${job.id}','txtA${job.id}')" >
										<input class="button" type="button" value="wijzigen "/>  
									</a>-->	
									
									<a class="link" style="float:right;" href="javascript:loadTextArea3('form_${job.id}','placeholder${job.id}','txtA${job.id}')" >
										<input class="button" type="button" value="wijzigen "/>  
									</a>	
						        
							        <form:form id="job_form_delete" method="post" action="remove/job" modelAttribute="job" style="float:right;">
										<form:hidden path="id" value="${job.id}"/>
										<input class="button" type="submit" value="verwijderen "/>  
							        </form:form>
							         			
					   			
					   			<!-- JOB WIJZIGEN -->	
					   			
					   			<form:form id="form_${job.id}_update" method="post" action="update/job" modelAttribute="job" class="onload-hide form form_job_update form_${job.id}">
				
									<label for="title">Titel<span><p>functie</p></span></label>
										<form:input id="" path="title" value="${job.title}"  class=""/>
										
									<label id="lblDescription" for="description">Omschrijving<span><p>job invulling</p></span></label>
							       		<form:textarea id="txtA${job.id}" rows="10" cols="58" path="description" value="" class=""/>
							       		<div id="placeholder${job.id}" class="hidden">${job.description}</div>
							       				
									<label for="location">Locatie<span><p>waar?</p></span></label>
										<form:input id="" path="location" value="${job.location}"/>
										
									<label for="category">Categorie<span><p>...</p></span></label>
										<form:input id="" path="category" value="${job.category}"/>
										
									<label for="period">periode<span><p>duur van job</p></span></label>
										<form:input id="" path="period" value="${job.period}" class=""/>
									
									<fmt:formatDate pattern="dd/MM/yyyy" value="${job.startDate}" var="startDate"/>	
									<label for="startDate">Start<span><p>begint op dd/mm/jjjj</p></span></label>
										<form:input id="" path="startDate" value="${startDate}" class=""/>
										
									<label for="type">Type<span><p>deelgebied</p></span></label>
										<form:input id="" path="type" value="${job.type}" class=""/>
									
									<fmt:formatDate pattern="dd/MM/yyyy" value="${job.visible_from}" var="visible_from"/>
									<fmt:formatDate pattern="dd/MM/yyyy" value="${job.visible_until}" var="visible_until"/>
									<label for="visible_from">Zichtbaar<span><p>van | tot</p></span></label>
										<form:input id="" path="visible_from" value="${visible_from}" class=""/>
										<form:input id="" path="visible_until" value="${visible_until}" class=""/>	
									
									<label for="visible_for">Zichtbaar<span><p>voor rol</p></span></label>	
									<!-- 	<form:select path="visible_for" items="${roleList}" value="${role}"/> -->
										
										<form:select id="visible_for" path="visible_for" title="geef aan voor wie de nieuws zichtbaar is" class=" form_select align-left">
								 	<c:forEach items="${roleList}" var="role">
								 		<form:option value="${role}" label="${role}" selected="${role==job.visible_for ? 'selected' : ''}"/>
								 	</c:forEach>
								 
							 </form:select>
						
										<form:hidden path="reference" value="${job.reference}"/>
										<form:hidden path="id" value="${job.id}"/>
										
									<input class="button clear-right" type="submit" value="opslaan"/>  
						        </form:form>
						        <form:form id="form_${job.id}_update_tag" method="post" action="${pageContext.request.contextPath}/tags/add" commandName="tags" class="onload-hide clear-left form form_job_update form_${job.id}">
						        <label for="tag">Tag<span><p>selecteer tag</p></span></label>	
									<form:select id="${job.id}_select_tag" path="tag.id" items="${tagList}" style="margin-top:8px;" itemValue="id" itemLabel="name" class=" form_select align-left"/> 
									<form:hidden path="job.id" value="${job.id}" />   
							<input id="" name="${blog}formControls" type="submit" value="taggen" class="button align-left "/>
								</form:form>
						</div>
						
						
						
					</c:forEach>
				</c:if>
				</div>
				</c:forTokens>
			
			
        
			</div>
			<!-- /main -->
	        
	        <!-- sidebar -->        
	        
			<div id="sidebar-admin">
      			
      			<c:forTokens items="Open,Gesloten" delims="," var="type">
				<c:choose>
    				<c:when test="${type == 'Open'}">
       					<c:set var="list" value="${jobsList}" scope="page" />
    				</c:when>
   					<c:otherwise>
   						<c:set var="list" value="${closedJobsList}" scope="page" />
   					</c:otherwise>
				</c:choose>

				
      			<c:if  test="${!empty list}">
					<c:forEach items="${list}" var="job" varStatus="i">
	
						<div id="job_${job.id}_kandidaten" class="hidden clearfix">
								<h3>Kandidaten</h3>
					   			<h5>${job.title}</h5>

								<ul>
					   				<c:if  test="${!empty applicationsList}">
										<c:forEach items="${applicationsList}" var="a" varStatus="i">
											<c:if  test="${a.job.id==job.id}">
											<li>
											<a href="#" >${a.applicant.firstName} ${a.applicant.lastName}</a>
											</li>
											</c:if>
										</c:forEach>
									</c:if>
									</ul>
					   			</div>

						
						
						
					</c:forEach>
				</c:if>
				</c:forTokens>
	
	        <!-- /sidebar -->
			</div>
			</sec:authorize>
		
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
