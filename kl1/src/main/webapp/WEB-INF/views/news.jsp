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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html xmlns="http://www.w3.org/1999/xhtml"><!--<![endif]-->
<head>

    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="">

    <title>Datasoft Services::Nieuws</title>

    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/resources/css/dss.css'/>" />

	<!-- Add jQuery library -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.6.1.min.js"><\/script>')</script>
	
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
		$("header li:contains('Nieuws')").addClass("current");

		$(".fancy-login").fancybox({});
		$(".fancy-disclaimer").fancybox({});
		$("#description").htmlarea();
		//$(".jHtmlArea").width("50%");
		$(".onload-hide").hide();
		$("iframe").contents().find("body").css("color","#454545");
		$("iframe").contents().find("body").css("font","15px/24px Georgia, Serif");

  	});

	</script>
	<script type="text/javascript">SyntaxHighlighter.all();</script>
	
	<%@ include file="includes/analytics.jsp" %>
	
</head>

<body id="top">
	
	<c:set var="trail" value="news" scope="session" />
	<c:set var="path" value="/news/archives/" scope="page" />
	<c:set var="author_page" value="" scope="page" />
	 <c:if  test="${sessionScope.author != ''}">
	 	<c:set var="author_page" value="${sessionScope.author}" scope="page" />
	 	<c:set var="author" value="" scope="session" />
	 </c:if>

	<%@ include file="includes/nav.jsp" %>
	<%@ include file="includes/header.jsp" %>
	<%@ include file="includes/bar.jsp" %>

<div id="content-wrap">

    <!-- content -->
 
    <div id="content" class="clearfix">

   	    <!-- main -->
   	    
        <div id="main">
        
			
        
        <sec:authorize access="!hasRole('ROLE_ADMIN')">
        <div class="filter-wrap align-left ${empty sessionScope.filterTagList and pageScope.author_page == '' ? 'invisible' : ''}">
        <p id="filter">filter op :</p>
        	<c:if test="${pageScope.author_page != ''}">
        	<div class="filter author"><a href="<c:url value='/news'/>">${pageScope.author_page}</a></div>
        	</c:if>
        	<c:if  test="${!empty sessionScope.filterTagList}">
       		<c:forEach items="${sessionScope.filterTagList}" var="filter" varStatus="i">
       		
       			                    <form:form id="${tags.tag.id}_form" method="post" action="${pageContext.request.contextPath}/news/search" commandName="tag" class="">
							<form:hidden path="name" value="${filter.name}" />   
							<form:hidden path="id" value="${filter.id}" />   
							<div class="filter"><input type="submit" value="${filter.name}" class=""/></div>
					</form:form>
						 
       		</c:forEach>
        </c:if>
        </div>
        
        </sec:authorize>
        <c:if  test="${!empty newsList}">
			<c:forEach items="${newsList}" var="news">
        	
			<!-- post -->
      	    <article id="${news.title}" class="post single news">

                <!-- primary -->
         	    
					

            	    <h2><a href="<c:url value='/news/single/${news.id}'/>">${news.title}</a></h2>

                    <p class="news-info"><span>Door </span><a href="<c:url value='/news/${news.author}'/>">${news.author}</a> <span> op <fmt:formatDate dateStyle="medium" pattern="dd MMMMMMMMMM yyyy" value="${news.created}"/> </span><span> | ${fn:length(news.comments)} </span><a href="<c:url value='/news/single/${news.id}/#comment-title'/>"> ${fn:length(news.comments) == 1 ? 'comment' : 'comments'}</a><span> | </span> </p>
                    <p class="news-info"><span> Tags</span>  </p>
                    <c:forEach items="${news.tags}" var="tags" varStatus="i">
                    						
                    <form:form id="${tags.tag.id}_form" method="post" action="${pageContext.request.contextPath}/news/search" commandName="tag" class="noform">
							<form:hidden path="name" value="${tags.tag.name}" />   
							<form:hidden path="id" value="${tags.tag.id}" />   
							<input title="filter op deze tag" type="submit" value="${tags.tag.name}" class="tag"/>
					</form:form>

					</c:forEach>

            	    <div id="${news.id}_intro" class="clear-left">${news.intro}
            	    	<p><a href="#${news.title}" onclick="javascript:$('#${news.id}_message').toggle();$('#${news.id}_intro').toggle('fast');" class="">[toon het volledige bericht]</a></p>
            	    </div>
            	    <div id="${news.id}_message" class="clear-left hidden">${news.message}
            	    	<p><a href="#${news.title}" onclick="javascript:$('#${news.id}_message').toggle('fast');$('#${news.id}_intro').toggle();" class="">[toon enkel de intro]</a></p>
            	    </div>


                <!-- /primary -->

        <!-- /post -->
        </article>
        
	</c:forEach>
</c:if>
        
</div><!-- /main -->
        <!-- sidebar -->
        
		<div id="sidebar">
			
			<%@ include file="includes/sidebar_blog.jsp" %>
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