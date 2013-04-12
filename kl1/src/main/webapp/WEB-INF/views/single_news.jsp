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
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
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
		$("header li:contains('Nieuws')").addClass("current");

		$(".fancy-login").fancybox({});
		$(".fancy-disclaimer").fancybox({});
		$("#description").htmlarea();
		//$(".jHtmlArea").width("50%");
		$(".onload-hide").hide();

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
                	
			<!-- post -->
      	    <article id="${news.title}" class="post single news" style="border:none;">

                <!-- primary -->
         	    

            	    <h2>${news.title}</a></h2>

                    <p class="news-info"><span>Door </span><a href="<c:url value='/news/${news.author}'/>">${news.author}</a> <span> op <fmt:formatDate dateStyle="medium" pattern="dd MMMMMMMMMM yyyy" value="${news.created}"/> </span><span> | ${fn:length(news.comments)} </span><a href="#comment-title"> ${fn:length(news.comments) == 1 ? 'comment' : 'comments'}</a><span> | </span> </p>
                    <p class="news-info"><span> tags</span>  </p>
                    <c:forEach items="${news.tags}" var="tags" varStatus="i">
                    						
                    <form:form id="${tags.tag.id}_form" method="post" action="${pageContext.request.contextPath}/news/search" commandName="tag" class="noform">
							<form:hidden path="name" value="${tags.tag.name}" />   
							<form:hidden path="id" value="${tags.tag.id}" />   
							<input title="filter op deze tag" type="submit" value="${tags.tag.name}" class="tag"/>
					</form:form>
					</c:forEach>

            	    <div class="align-left">${news.message}
            	    </div>
            <c:if  test="${!empty treeComments}">	  
           
			<h2 id="comment-title" style="margin: 15px 0 20px 0;">Reacties</h2>
			</c:if>
			<!-- REACTIES -->
			
			<div id="conversation-style" style="clear:both;margin-top: -27px;">

 			<c:forEach var="tree" items="${treeComments}"  varStatus="j">
                
 			    <div id ="reply-wrap_${tree.id}" class="comment-wrap">
                	<div class="tri" style="margin: -10px 0 0 0"></div>
                	<div id="tree_${tree.id}" class="comment-block" style="width: 665px;margin:-30px 0 0 17px;">
                		<p><span>${tree.comment}</span></p>
	                	<p class="comment-date">
	                		<img style="margin-bottom: -1px;" src="<c:url value='/resources/images/user16.png'/>" /> <strong>${tree.author}</strong> <img style="margin-bottom: -1px;" src="<c:url value='/resources/images/calendar.png'/>" /> <fmt:formatDate dateStyle="medium" pattern="dd MMMMMMMMMM" value="${tree.created}"/> <img style="margin-bottom: -1px;" src="<c:url value='/resources/images/time.png'/>" /> <fmt:formatDate type="time" pattern="HH:mm" value="${tree.created}"/> <img style="margin-bottom: -3px;" src="<c:url value='/resources/images/list-ordered.png'/>" /> comment #${tree.number} 
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
							

                			
 							<div id ="reply-wrap_${root.id}" class="reply-wrap ${root.originalComment.number} ">
                				<div class="reply-tri"></div>
		                		<div class="reply-block">
		                			<p><span>${root.comment}</span></p>
		                			<p class="comment-date">
		                				<img style="margin-bottom: -1px;" src="<c:url value='/resources/images/user16.png'/>" /> <strong>${root.author}</strong> <img style="margin-bottom: -1px;" src="<c:url value='/resources/images/calendar.png'/>" /> <fmt:formatDate dateStyle="medium" pattern="dd MMMMMMMMMM" value="${root.created}"/> <img style="margin-bottom: -2px;" src="<c:url value='/resources/images/time.png'/>" /> <fmt:formatDate type="time" pattern="HH:mm" value="${root.created}"/> <img style="margin-bottom: -3px;" src="<c:url value='/resources/images/list-ordered.png'/>" /> comment #${root.number}
		 								<img style="margin-bottom: -3px;" src="<c:url value='/resources/images/chat.png'/>" /> <a href="javascript:reply('${root.id}')">reply</a>               			
		                			</p>
		               				<jsp:include page='includes/comment-tree-news.jsp'/>
		                		</div>
                			</div>
 							<!-- END REPLIES -->
						</c:forEach>
                	</div>
                </div>			 	
			</c:forEach>
	
			
			
			<!--  REACTIE PLAATSEN -->

<h2 id="comment-title" style="margin: 0;">Reageer</h2>
                
			 	<div id="comment-tri" class="tri" style="margin: 30px 0 0 0"></div>
			 	<div id="comment-form" style="width:665px;margin: -30px 3px 30px 17px">
			 	<c:forEach var="tree" items="${listStyle}"  varStatus="j">
                <div id ="wrap_${tree.id}" class="hidden">
 			    	<div class="comment-wrap">
                		<div class="comment-block extra" style="width: 601px;">
                			<p><span>${tree.comment}</span></p>
                			<p class="comment-date">
                				<img style="margin-bottom: -1px;" src="<c:url value='/resources/images/user16.png'/>" /> <strong>${tree.author}</strong><img style="margin-bottom: -1px;" src="<c:url value='/resources/images/calendar.png'/>" /> <fmt:formatDate dateStyle="medium" pattern="dd MMMMMMMMMM" value="${tree.created}"/> <img style="margin-bottom: -1px;" src="<c:url value='/resources/images/time.png'/>" /> <fmt:formatDate type="time" pattern="HH:mm" value="${tree.created}"/> <img style="margin-bottom: -3px;" src="<c:url value='/resources/images/list-ordered.png'/>" /> comment #${tree.number} 
                				<img style="margin-bottom: -3px;" src="<c:url value='/resources/images/chat.png'/>" /> <a href="javascript:cancelReply()"><strong>cancel reply</strong></a>   
                			</p>

                		</div>
                	</div>
                	</div>
				</c:forEach>
				 <a id="comment-cancel" class="hidden" href="javascript:cancelReply()"><img style="margin-left: 5px;" src="<c:url value='/resources/images/cancel.png'/>" /></a>  
			 	 	<form:form id="form_add_comment" method="post" action="${pageContext.request.contextPath}/news/comment/add" commandName="comment" class="form">

						<form:textarea  id="comment" path="comment" cols="71" rows="7" class="align-left"/>	
				
				
						<sec:authorize access="isAnonymous()">	
							<form:input id="author" path="author" title="maximaal 16 karakters" value="Naam" class="clear-left align-left noEnterSubmit"/>
						</sec:authorize>
				
						<form:hidden path="news.id" value="${news.id}"/>
						<form:hidden id="reply-to" path="originalComment.id" value=""/>
						

						<div id="parent" style="width:598px;height:32px;background-color: #fff;float:left;clear:both;border: 1px solid #DCDEE2;padding:1px;margin-left:2px;position:relative">
							<div style="width: 498px;height: 32px;float:left">
								<div id="slider" style="background-color: lightgrey;width:100px;height:32px;z-index:10"></div>
								<span style="position:absolute;top:0;padding: 8px;left:115px;font : 13px 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Verdana, Sans-serif;color: #999;">
									sleep de balk helemaal rechts om uw bericht te versturen
								</span>
							</div>
							<div id="drop" style="height:32px;width:100px;float:right;"></div>
						</div>

	
					</form:form>
			 
			</div>

        <!-- /post -->
        </article>

        
</div><!-- /main -->
        <!-- sidebar -->
        
		<div id="sidebar">
			
			<%@ include file="includes/sidebar_news.jsp" %>
			<%@ include file="includes/archive.jsp" %>

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