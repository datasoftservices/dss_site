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

    <title>Datasoft Services::Beheer Blog</title>

    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/resources/css/dss.css'/>" />

	<!-- Add jQuery library -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
    <!--<script>window.jQuery || document.write('<script src="js/jquery-1.6.1.min.js"><\/script>')</script>-->

	<!-- Add custom libraries -->
    <script src="<c:url value='/resources/javascript/scrollToTop.js'/>"></script>
    <script src="<c:url value='/resources/javascript/dss.js'/>"></script>
	
	<script src="<c:url value='/resources/javascript/syntaxhighlighter/shCore.js'/>"></script>
	<script src="<c:url value='/resources/javascript/syntaxhighlighter/shBrushJScript.js'/>"></script>
	<script src="<c:url value='/resources/javascript/syntaxhighlighter/shBrushXml.js'/>"></script>
	<script src="<c:url value='/resources/javascript/syntaxhighlighter/shBrushVb.js'/>"></script>
	<script src="<c:url value='/resources/javascript/syntaxhighlighter/shBrushSql.js'/>"></script>
	<script src="<c:url value='/resources/javascript/syntaxhighlighter/shBrushJScript.js'/>"></script>
	<script src="<c:url value='/resources/javascript/syntaxhighlighter/shBrushJava.js'/>"></script>
	<script src="<c:url value='/resources/javascript/syntaxhighlighter/shBrushCss.js'/>"></script>
	<script src="<c:url value='/resources/javascript/syntaxhighlighter/shBrushCSharp.js'/>"></script>

	<link rel="stylesheet" href="<c:url value='/resources/javascript/syntaxhighlighter/shCore.css'/>" type="text/css" media="screen" />
	<link rel="stylesheet" href="<c:url value='/resources/javascript/syntaxhighlighter/shThemeDefault.css'/>" type="text/css" media="screen" />
	
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
	$(document).ready(function() {
		checkIEVersion();
		$("#jscript-error").hide();
		$("header nav ul li a").removeClass("current");
		$("header li:contains('Blog')").addClass("current");
		$("#nav-2 a").removeClass("active");
		$("#nav-2 a:contains('blog')").addClass("active");
		$(".fancy-login").fancybox({});
		$(".fancy-disclaimer").fancybox({});
		$("#description").htmlarea();
		$(".jHtmlArea").width("95%");
		$(".onload-hide").hide();
  	});

	</script>
	<script type="text/javascript">SyntaxHighlighter.all();</script>
	
</head>

<body id="top">
	
	 <c:set var="trail" value="blog/manage" scope="session" />
	 <c:set var="path" value="/blog/archives/" scope="page" />

<%@ include file="includes/nav.jsp" %>

<%@ include file="includes/header.jsp" %>

<%@ include file="includes/bar.jsp" %>

<div id="content-wrap">

    <!-- content -->
    
    <div id="content" class="clearfix no-back">

   	    <!-- main -->
   	    
        <div id="main-no-sidebar">
        
        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMPLOYEE')">
        
	        <div class="controls">
	        	<a id="lnkAdd"   href="#top" onclick="javascript:$('#forms_add').toggle('slow');$('#forms_add_tag').hide();">blog toevoegen</a> | 		
	        	<a id="lnkAdd" href="#top" onclick="javascript:$('#forms_add_tag').toggle('slow');$('#forms_add').hide();">tag toevoegen</a>			
	        </div>
        
        <div id="forms_add_tag" class="forms clearfix onload-hide">
        <!-- TAG TOEVOEGEN -->	
        
     		<form:form id="form_add_tag" method="post" action="${pageContext.request.contextPath}/tag/add" commandName="tag" class="form">
     		
			<label for="name">Naam<span><p>tag omschrijving</p></span></label>
				<form:input id="" name="" path="name" class="align-left"/>      
				
				<input id="btnAdd" name="formControls" type="submit" value="tag toevoegen" class="button align-left"/>					
     		</form:form>
       	</div>
       	
       	<div id="forms_add" class="forms_add forms clearfix onload-hide">			
        <!-- BLOG TOEVOEGEN -->		

			<form:form id="form_add" method="post" action="add" commandName="blog" class="form">
			
			<label for="title">Titel<span><p>blog titel</p></span></label>
				<form:input id="title" path="title" class="align-left"/>
			<label id="lblDescription" for="message">Inhoud<span><p>blog bericht</p></span></label>
				<form:textarea  id="description" path="message" cols="85" rows="15" class=""/>	
			<label for="title">Datum<span><p>van het blog bericht</p></span></label>
				<form:input title="laat de datum leeg om vandaag te kiezen" path="created" class="align-left"/>
			<label for="visibleFor">Zichtbaar<span><p>voor rol</p></span></label>	
				<form:select id="visible_for" path="visibleFor" items="${roleList}" value="${role}"/>
			
			<input id="btnAdd" name="formControls" type="submit" value="toevoegen" class="button align-left"/>
					
			</form:form>
		
		</div>
        
        <c:if  test="${empty blogList}">
        	<h3>U heeft geen bestaande blogs om te beheren</h3>
        	
        </c:if>
        <c:if  test="${!empty blogList}">
			<c:forEach items="${blogList}" var="blog">
        	
			<!-- post -->
      	    <article id="${blog.title}" class="post single manage">

                <!-- primary -->
         	    <div class="primary manage">
					

									
					<!-- BLOG AANPASSEN -->									
					
					<p id="filter"><span>Getagd als</span>${empty blog.tags ? ' [geen tags]' : ''}</p> 
                    <c:forEach items="${blog.tags}" var="tags" varStatus="i">
					<form:form id="${tags.tag.id}_form" method="post" action="${pageContext.request.contextPath}/tags/delete" commandName="tags" class="">  
							<form:hidden path="tag.id" value="${tags.tag.id}" />   
							<form:hidden path="id" value="${tags.id}" />   
							<div class="filter"><input type="submit" value="${tags.tag.name}" class=""/></div>
					</form:form>
					</c:forEach>
						
						
						<form:form id="form_update_blog_${blog.id}" method="post" action="save" commandName="blog" class="noform clear-left">
						
						    <form:input id="ipt_title_blog_${blog.id}" path="title" disabled="true" value="${blog.title}" class="disabled input_title"/>	
						    
						    <form:input id="ipt_author_blog_${blog.id}" title="auteur van het blog bericht" path="author" disabled="true" value="${blog.author}" class="noform-input hidden align-left form_ctrl_blog_${blog.id}"/>
						    
						    <fmt:formatDate pattern="dd/MM/yyyy" value="${blog.created}" var="created"/>
							<form:input id="ipt_created_blog_${blog.id}" title="datum van het blog bericht" path="created" disabled="true" value="${created}" class="noform-input hidden align-left form_ctrl_blog_${blog.id}"/>
							
						<form:select id="slct_visible_blog_${blog.id}" path="visibleFor" title="geef aan voor wie de nieuws zichtbaar is" class="hidden form_select align-left">
								 	<c:forEach items="${roleList}" var="role">
								 		<form:option value="${role}" label="${role}" selected="${role==blog.visibleFor ? 'selected' : ''}"/>
								 	</c:forEach>
								 
							 </form:select>
						    <div id="div_message_blog_${blog.id}" class="clear-left">						  
							<form:textarea  id="txtarea_message_blog_${blog.id}" path="message" disabled="true" cols="100" rows="15" class="hidden textarea_content"/>	
							</div>
							
							<div id="p_message_blog_${blog.id}" class="clear-left hidden">${blog.message}</div>
							<div id="p_intro_blog_${blog.id}" class="clear-left">${blog.intro}</div>
						

							<form:hidden id="ipt_id_blog_${blog.id}" path="id" disabled="true" value="${blog.id}"/>


							<input id="btn_update_blog_${blog.id}" type="submit" disabled="true" value="opslaan" class="hidden button align-left clear-left form_ctrl_blog_${blog.id}"/>
						
						</form:form>
						
						<a id="btn_modify_blog_${blog.id}" href="#ipt_title_blog_${blog.id}" onclick="javascript:$('#slct_visible_blog_${blog.id}').toggle();$('#btn_modify_blog_${blog.id}').hide();$('#p_intro_blog_${blog.id}').hide();
																			loadTextArea2('p_message_blog_${blog.id}','_message_blog_${blog.id}','form_ctrl_blog_${blog.id}','form_update_blog_${blog.id}');">
							<input type="button" value="wijzigen" class="button align-left"/>
						</a>
												
						<form:form method="post" action="remove" commandName="blog" class="noform">
					    	<form:hidden path="id" value="${blog.id}"/>
					    	<input id="btnRemove${news}" type="submit" value="verwijderen" class="hidden button align-left form_ctrl_blog_${blog.id}"/>
						</form:form>
						
						<a href="#ipt_title_blog_${blog.id}" onclick="javascript:$('#slct_visible_blog_${blog.id}').toggle();$('#btn_modify_blog_${blog.id}').show();$('#p_intro_blog_${blog.id}').show();
											unloadTextArea('p_message_blog_${blog.id}','div_message_blog_${blog.id}','form_ctrl_blog_${blog.id}');" class="hidden form_ctrl_blog_${blog.id}" >
							<input type="button" value="annuleren" class="button align-left"/>
						</a>
						
						<form:form id="" method="post" action="${pageContext.request.contextPath}/blog/mail/alert" commandName="blog" class="">
							<form:hidden path="id" value="${blog.id}" />   
							<input id="" type="submit" value="e-mail alert" class="button align-left"/>
						</form:form>
						
						<form:form id="${tags}_form" method="post" action="${pageContext.request.contextPath}/tags/add" commandName="tags" class="">
							<form:select id="${blog.id}_select_tag" path="tag.id" items="${tagList}" style="margin-top:8px;" itemValue="id" itemLabel="name" class=" form_select "/> 
							<form:hidden path="blog.id" value="${blog.id}" />   
							<input id="" type="submit" value="taggen" class="button align-left"/>
						</form:form>
								    

                <!-- /primary -->
                </div>

            <aside>

            	<p class="dateinfo"><fmt:formatDate dateStyle="medium" pattern="MMM" 
            value="${blog.created}"/><span><fmt:formatDate pattern="dd" value="${blog.created}"/></span></p>

                <div class="post-meta">
               	    <h4>Post Info</h4>
                    <ul>
                  	    <li class="user"><a href="<c:url value='/blog/${blog.author}'/>">${blog.author}</a><a href="#"></a></li>
                        <li class="comment"><a href="#">${fn:length(blog.comments)} ${fn:length(blog.comments) == 1 ? 'Comments' : 'Comments'}</a></li>
                        <li class="permalink"><a href="#${blog.title}">Permalink</a></li>
                    </ul>
                </div>

            </aside>

        <!-- /post -->
        </article>
        
	</c:forEach>
</c:if>
       					</sec:authorize> 
</div><!-- /main -->


    <!-- content -->
	</div>
	<%@ include file="includes/bottom_bar.jsp" %>
<!-- /content-out -->
</div>


<%@ include file="includes/extra.jsp" %>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
