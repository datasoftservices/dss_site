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

    <meta name="author" content="Bruno De Neve">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="Datasoft Services Blog houdt u op de hoogte van nieuwe ontwikkelingen in ICT">

    <title>Datasoft Services::Blog</title>

    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/resources/css/dss.css'/>" />

	<!-- Add jQuery library -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
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
		$(".fancy-login").fancybox({});
		$(".fancy-disclaimer").fancybox({});
		$("#description").htmlarea();
		$(".jHtmlArea").width("95%");
		$(".onload-hide").hide();
  	});

	</script>
	<script type="text/javascript">SyntaxHighlighter.all();</script>
	
	<%@ include file="includes/analytics.jsp" %>
	
</head>

<body id="top">

	 <c:set var="trail" value="blog" scope="session" />
	 <c:set var="path" value="/blog/archives/" scope="page" />
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
        
        <div class="filter-wrap align-left ${empty sessionScope.filterTagList and pageScope.author_page == '' ? 'invisible' : ''}">
        <p id="filter">filter op :</p>
        	<c:if test="${pageScope.author_page != ''}">
        		<div class="filter author"><a href="<c:url value='/blog'/>">${pageScope.author_page}</a></div>
        	</c:if>
        	<c:if  test="${!empty sessionScope.filterTagList}">
       		<c:forEach items="${sessionScope.filterTagList}" var="filter" varStatus="i">
       			             <form:form id="${tags.tag.id}_form" method="post" action="${pageContext.request.contextPath}/blog/search" commandName="tag" class="">
							<form:hidden path="name" value="${filter.name}" />   
							<form:hidden path="id" value="${filter.id}" />   
							<div class="filter"><input type="submit" value="${filter.name}" class=""/></div>
					</form:form>
						 
       		</c:forEach>
        </c:if>
        </div>
       
        <c:if  test="${!empty blogList}">
			<c:forEach items="${blogList}" var="blog">
        	
			<!-- post -->
      	    <article id="${blog.title}" class="post single">

                <!-- primary -->
         	    <div class="primary">
					
					 
            	    <h2><a href="<c:url value='/blog/single/${blog.id}'/>">${blog.title}</a></h2>

                    <p class="post-info"><span>Tags</span></p>  
                    
                    <c:forEach items="${blog.tags}" var="tags" varStatus="i">
                    						 <!-- ${i.index > 0 ? ', ' : ''} -->
                    <form:form id="${tags.tag.id}_form" method="post" action="${pageContext.request.contextPath}/blog/search" commandName="tag" class="noform">
							<form:hidden path="name" value="${tags.tag.name}" />   
							<form:hidden path="id" value="${tags.tag.id}" />   
							<input title="filter op deze tag" type="submit" value="${tags.tag.name}" class="tag"/>
					</form:form>

					</c:forEach>
						
					<div class="clear-left">
            	    <div id="${blog.id}_intro">${blog.intro} 
            	    </br></br><a href="#${blog.title}" onclick="javascript:$('#${blog.id}_message').toggle();$('#${blog.id}_intro').toggle('fast');$('.${blog.id}_tags').toggle('fast');">[toon het volledige bericht]</a>
            	    </div>
            	    
            	    <div id="${blog.id}_message" class="hidden">${blog.message}
            	    </br><a href="#${blog.title}" onclick="javascript:$('#${blog.id}_message').toggle();$('#${blog.id}_intro').toggle('fast');$('.${blog.id}_tags').toggle('fast');">[toon enkel de intro]</a>
					</div>
            	    	
            	    </div>

					
					<div class="social-share">
                  	    <div class="social-share-google">
                  	    	<div class="g-plusone" data-size="medium" data-annotation="none" data-href="${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}/${trail}/#${blog.title}"></div>

                  	    </div>
                  	    
                  	 <div class="social-share-facebook">
                  	    	<div id="social-share-facebook">
                  	    	<!--<div class="fb-like" data-href="${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}/${trail}/#${blog.title}" data-send="false" data-width="120" data-show-faces="false" data-action="recommend"></div>-->
                  	    	<div class="fb-like" data-href="${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}/${trail}/#${blog.title}" data-send="false" data-layout="button_count" data-width="120" data-show-faces="false" data-action="recommend"></div>
                  	    	</div>
                  	    </div>
                  	    <div class="social-share-twitter">
                  	   <a href="https://twitter.com/share" class="twitter-share-button" data-url="${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}/${trail}/#${blog.title}" data-text="Lees even deze blog" data-lang="nl" data-count="none">Tweeten</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>             	   
						</div>
                  	  </div>


                <!-- /primary -->
                </div>

            <aside>

            	<p class="dateinfo"><fmt:formatDate dateStyle="medium" pattern="MMM" 
            value="${blog.created}"/><span><fmt:formatDate pattern="dd" value="${blog.created}"/></span></p>

                <div class="post-meta">
               	    <h4>Post Info</h4>
                    <ul>
                  	    <li class="user"><a href="<c:url value='/blog/${blog.author}'/>">${blog.author}</a><a href="#"></a></li>
                        <li class="comment"><a href="<c:url value='/blog/single/${blog.id}#reacties'/>">${fn:length(blog.comments)} ${fn:length(blog.comments) == 1 ? 'Comments' : 'Comments'}</a></li>
                        <li class="permalink"><a href="<c:url value='/blog/single/${blog.id}'/>">Permalink</a></li>
                    </ul>
                </div>
                
                <div class="post-meta hidden ${blog.id}_tags">
                    <h4>Tags</h4>
					<ul class="tags">
						<c:forEach items="${blog.tags}" var="tags" varStatus="i">
                    <li>						  
						<a href="javascript:$('#${tags.tag.id}_form').submit();" >${tags.tag.name}</a>
					</li>
					</c:forEach>
			         </ul>
               </div>
               
                <div class="post-meta hidden ${blog.id}_tags">
               	    <h4>Delen</h4>
                    <ul>
                  	<li class="google">						  
						<a href="https://plus.google.com/share?url=${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}/${trail}/#${blog.title}" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;">Google+</a>
					</li>
					<li class="facebook">						  
						<a target="_blank" href="http://www.facebook.com/sharer.php?u=${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}/${trail}/#${blog.title}">Facebook</a>
					</li>
					<li class="twitter">						  
						<a target="_blank" href="http://twitter.com/share?text=Lees deze blog ${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}/${trail}/#${blog.title}" title="Click to share this post on Twitter">Twitter</a>
					</li>

                    </ul>
                    
                    <!-- Place this tag after the last +1 button tag. -->
<script type="text/javascript">
  window.___gcfg = {lang: 'nl'};

  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>


                </div>

            </aside>

        <!-- /post -->
        </article>
        
	</c:forEach>
</c:if>
        
</div><!-- /main -->
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
