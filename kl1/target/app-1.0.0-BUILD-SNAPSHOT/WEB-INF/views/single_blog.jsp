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
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
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
	
	<!-- Add jHtmlArea library -->
	<script type="text/javascript" src="<c:url value='/resources/javascript/captcha/ui.core.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/javascript/captcha/ui.sortable.js'/>"></script>
	<script type="text/javascript" charset="utf-8">
	function reply(reply_id){
		$('html,body').animate({
			scrollTop: $('#comment-title').offset().top
			}, {duration : 1000, queue : true});
		$('#reply-to').val(reply_id);
		$('[id^="wrap_"]').hide();
		$('#wrap_'+reply_id).show();
		$('#comment-cancel').show();
	}
	function cancelReply(){
		$('#reply-to').val('');
		$('[id^="wrap_"]').hide('slow');
		$('#comment-cancel').hide();
	}
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
		//$(".reply_to").hide();
		$( "#slider" ).draggable({ containment: "#parent", revert: "invalid" });
		$( "#drop" ).droppable({ accept: "#slider",tolerance: "fit", drop: function() {
			if($("#form_add_comment #comment").val()=="" || $("#form_add_comment #comment").val()=="Geef hier je mening ..."){
				alert("U vergat uw mening te geven!");
				    $("#comment-form #slider").animate({
				        "left": 0
				    });				
			}
			else if($("#form_add_comment #author").val()=="" || $("#form_add_comment #author").val()=="Naam"){
				alert("Gelieve ook uw naam in te vullen.");
			    $("#comment-form #slider").animate({
			        "left": 0
			    });	
			}
			else{
				$("#comment-form #form_add_comment").submit();
			}
	    } });
		$("#form_add_comment #comment").text("Geef hier je mening ...");
		$("#form_add_comment #comment").toggleText("Geef hier je mening ...","");
		$("#form_add_comment #author").toggleText("Naam","");	

		$('.noEnterSubmit').keypress(function(e){
		    if ( e.which == 13 ) e.preventDefault();
		});
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
    
    <div id="content" class="clearfix no-sidebar">

   	    <!-- main -->
   	    
        <div id="main-no-sidebar">
        	
			<!-- post -->
      	    <article id="article-single" class="post single">

                <!-- primary -->
         	    <div class="">
					
            	    <h2 style="font-size: 30px;font-weight: bold;color: #353535;letter-spacing: 0;margin-bottom: 24px;">${blog.title}</h2>

            	    <div>
            	    	${blog.message}
            	   	</div>
            	    	
				</div>

					
					<!-- <div class="social-share">
                  	    <div class="social-share-google">
                  	    	<div class="g-plusone" data-size="medium" data-annotation="none" data-href="${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}/${trail}/#${blog.title}"></div>

                  	    </div>
                  	    
                  	 <div class="social-share-facebook">
                  	    	<div id="social-share-facebook">
                  	    	
                  	    	<div class="fb-like" data-href="${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}/${trail}/#${blog.title}" data-send="false" data-layout="button_count" data-width="120" data-show-faces="false" data-action="recommend"></div>
                  	    	</div>
                  	    </div>
                  	    <div class="social-share-twitter">
                  	   <a href="https://twitter.com/share" class="twitter-share-button" data-url="${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}/${trail}/#${blog.title}" data-text="Lees even deze blog" data-lang="nl" data-count="none">Tweeten</a>
						<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>             	   
						</div>
                  	  </div> -->


                <!-- /primary -->
                </div>

            <aside id="aside-single">

            	<p class="dateinfo"><fmt:formatDate dateStyle="medium" pattern="MMM" 
            		value="${blog.created}"/><span><fmt:formatDate pattern="dd" value="${blog.created}"/></span></p>

                <div class="post-meta">
               	    <h4>Post Info</h4>
                    <ul>
                  	    <li class="user"><a href="<c:url value='/blog/${blog.author}'/>">${blog.author}</a><a href="#"></a></li>
                        <li class="comment"><a href="#reacties">${fn:length(blog.comments)} ${fn:length(blog.comments) == 1 ? 'Comments' : 'Comments'}</a></li>
                        <li class="permalink"><a href="<c:url value='/blog/single/${blog.id}'/>">Permalink</a></li>
                    </ul>
                </div>
                
                <div class="post-meta">
                    <h4>Tags</h4>
					<ul class="tags">
						<c:forEach items="${blog.tags}" var="tags" varStatus="i">
                    <li>						  
						<a href="javascript:$('#${tags.tag.id}_form').submit();" >${tags.tag.name}</a>
					</li>
					</c:forEach>
			         </ul>
               </div>
               
                <div class="post-meta">
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
             <c:if  test="${!empty blog.comments}">
            <aside id="reacties" style="clear:both;">
		        <div class="post-meta">
               	    <h4>Reacties</h4>
               	</div>
            </aside>

			<div id="conversation-style" style="clear:both;margin-top: -27px;">

 			<c:forEach var="tree" items="${treeComments}"  varStatus="j">
 			
 				<aside>
		        <div class="post-meta comments ${!empty comment.originalComment.number ? comment.originalComment.number : ''} ${!empty comment.originalComment.number ? 'reply_to' : ''}">               	    
                   <ul>
                  	    <li class="comment">${tree.author}</li>
                    </ul>
                </div>
                </aside>
                
 			    <div id ="reply-wrap_${tree.id}" class="comment-wrap">
                	<div class="tri"></div>
                	<div id="tree_${tree.id}" class="comment-block">
                		<p><span>${tree.comment}</span></p>
	                	<p class="comment-date">
	                		<img style="margin-bottom: -1px;" src="<c:url value='/resources/images/calendar.png'/>" /> <fmt:formatDate dateStyle="medium" pattern="dd MMMMMMMMMM" value="${tree.created}"/> <img style="margin-bottom: -1px;" src="<c:url value='/resources/images/time.png'/>" /> <fmt:formatDate type="time" pattern="HH:mm" value="${tree.created}"/> <img style="margin-bottom: -3px;" src="<c:url value='/resources/images/list-ordered.png'/>" /> comment #${tree.number} 
	                		<img style="margin-bottom: -1px;" src="<c:url value='/resources/images/chat.png'/>" /> <a href="javascript:reply('${tree.id}')">reply</a>
	                	</p>
               		

	               		<c:forEach var="root" items="${tree.repliedTocomment}"  varStatus="j">
				 			<c:set var="root" value="${root}" scope="request"/>
 					
 							<!-- BEGIN REPLIES -->
 							<script type="text/javascript" charset="utf-8">
								$(document).ready(function() {
									$('#reply-wrap_${root.id}').initComment('${root.originalComment.number}');
							  	});
		
							</script>
							
							<aside id="aside_${root.number}" class="comment-aside">
				
			        			<div class="post-meta comments ${!empty comment.originalComment.number ? comment.originalComment.number : ''} ${!empty comment.originalComment.number ? 'reply_to' : ''}">               	    
				                   <ul>
				                  	    <li class="reply">${root.author}</li>
				                    </ul>			 
				                </div>
				                
                			</aside>
                			
 							<div id ="reply-wrap_${root.id}" class="reply-wrap ${root.originalComment.number} ">
                				<div class="reply-tri"></div>
		                		<div class="reply-block">
		                			<p><span>${root.comment}</span></p>
		                			<p class="comment-date">
		                				<img style="margin-bottom: -1px;" src="<c:url value='/resources/images/calendar.png'/>" /> <fmt:formatDate dateStyle="medium" pattern="dd MMMMMMMMMM" value="${root.created}"/> <img style="margin-bottom: -2px;" src="<c:url value='/resources/images/time.png'/>" /> <fmt:formatDate type="time" pattern="HH:mm" value="${root.created}"/> <img style="margin-bottom: -3px;" src="<c:url value='/resources/images/list-ordered.png'/>" /> comment #${root.number}
		 								<img style="margin-bottom: -3px;" src="<c:url value='/resources/images/chat.png'/>" /> <a href="javascript:reply('${root.id}')">reply</a>               			
		                			</p>
		               				<jsp:include page='includes/comment-tree.jsp'/>
		                		</div>
                			</div>
 							<!-- END REPLIES -->
						</c:forEach>
                	</div>
                </div>			 	
			</c:forEach>
			</div>
			</c:if>
			
			 <aside>
		        <div class="post-meta comments" style="visibility: hidden;">               	    
					<ul>
						<li class="comment">uw reactie</li>
                  	</ul>
                </div>
             </aside>
                
                <h2 id="comment-title">Reactie plaatsen?</h2>
                
			 	<div id="comment-tri" class="tri"></div>
			 	<div id="comment-form">
			 	<c:forEach var="tree" items="${listStyle}"  varStatus="j">
                <div id ="wrap_${tree.id}" class="hidden">
 			    	<div class="comment-wrap">
                		<div class="comment-block extra">
                			<p><span>${tree.comment}</span></p>
                			<p class="comment-date">
                				<img style="margin-bottom: -1px;" src="<c:url value='/resources/images/calendar.png'/>" /> <fmt:formatDate dateStyle="medium" pattern="dd MMMMMMMMMM" value="${tree.created}"/> <img style="margin-bottom: -1px;" src="<c:url value='/resources/images/time.png'/>" /> <fmt:formatDate type="time" pattern="HH:mm" value="${tree.created}"/> <img style="margin-bottom: -3px;" src="<c:url value='/resources/images/list-ordered.png'/>" /> comment #${tree.number} 
                				<img style="margin-bottom: -3px;" src="<c:url value='/resources/images/chat.png'/>" /> <a href="javascript:cancelReply()"><bold>cancel reply</bold></a>   
                			</p>

                		</div>
                	</div>
                	</div>
				</c:forEach>
				 <a id="comment-cancel" class="hidden" href="javascript:cancelReply()"><img style="margin-left: 15px;" src="<c:url value='/resources/images/cancel.png'/>" /></a>  
			 	 	<form:form id="form_add_comment" method="post" action="${pageContext.request.contextPath}/blog/comment/add" commandName="comment" class="form">

						<form:textarea  id="comment" path="comment" cols="81" rows="7" class="align-left"/>	
				
				
						<sec:authorize access="isAnonymous()">	
							<form:input id="author" path="author" title="maximaal 16 karakters" value="Naam" class="clear-left align-left noEnterSubmit"/>
						</sec:authorize>
				
						<form:hidden path="blog.id" value="${blog.id}"/>
						<form:hidden id="reply-to" path="originalComment.id" value=""/>
						
						<!-- <anti-spam> -->
						<div id="parent" style="width:678px;height:32px;background-color: #fff;float:left;clear:both;border: 1px solid #DCDEE2;padding:1px;margin-left:2px;position:relative">
							<div style="width: 578px;height: 32px;float:left">
								<div id="slider" style="background-color: lightgrey;width:100px;height:32px;z-index:10"></div>
								<span style="position:absolute;top:0;padding: 8px;left:155px;font : 13px 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Verdana, Sans-serif;color: #999;">
									sleep de balk helemaal rechts om uw bericht te versturen
								</span>
							</div>
							<div id="drop" style="height:32px;width:100px;float:right;"></div>
						</div>
			         	<!-- </anti-spam -->
	
					</form:form>
			 
				</div>
        <!-- /post -->
        </article>

        
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
