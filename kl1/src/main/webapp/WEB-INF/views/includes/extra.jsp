<!-- extra -->
<div id="extra-wrap">

	<div id="extra" class="clearfix">

	    <div class="col first">

		    <h3>Contact</h3>

		    <p>
		    <strong>Telefoon: </strong> +32475/51.73.36<br/>
		    <strong>BTW: </strong>BE 0464.659.593
		    </p>

		    <p><strong>Adres: </strong>Steenbeek 17 2590 Berlaar</p>
            <p><strong>E-mail: </strong><a href="mailto:info@datasoftservices.be">info@datasoftservices.be</a></p>
            
		    

            

	    </div>


        <div class="col">

            <c:if  test="${!empty extraJobs}">
            <h3>Recente Vacatures</h3>
            

	        <div class="footer-list">
	        			    <ul>
	        <c:forEach items="${extraJobs}" var="j" varStatus="i">
					
					<c:if  test="${j.id!=1}">
				    <li><a href="jobs#${j.id}_description">${j.title}</a></li>
					</c:if>
				</c:forEach>    
				   </ul>
		    </div>
			</c:if>
	    </div>
	            <div class="col">

            <c:if  test="${!empty extraBlogs}">
            <h3>Laatste Blogs</h3>
            

	        <div class="footer-list">
	        			    <ul>
	        <c:forEach items="${extraBlogs}" var="b" varStatus="i">
					
				    <li><a href="blog#${b.title}">${b.title}</a></li>

				</c:forEach>    
				   </ul>
		    </div>
			</c:if>
	    </div>
	    
	    <div class="col">

   	        <h3>Sociaal</h3>
            <ul class="subscribe-stuff">

            	<li>
            		<a href="http://www.linkedin.com/shareArticle?mini=true&url=${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}" target="_new">
						<img src="<c:url value='/resources/images/linkedin.png'/>" alt="Linkedin share button" title="delen op linkedin" />
					</a>
      	       	</li>
			    <li>
					<a href="https://plus.google.com/share?url=${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;">
						<img src="<c:url value='/resources/images/google-plus.png'/>" alt="Google+ share button" title="delen op google+"/>
					</a>
				</li>
				<li>
					<a target="_blank" href="http://www.facebook.com/sharer.php?u=${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}">
						<img src="<c:url value='/resources/images/facebook.png'/>" alt="Facebook share button" title="delen op facebook"/>
					</a>
				</li>
				<li>
					<a target="_blank" href="http://twitter.com/share?text=Kijk ook eens op ${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${pageContext.request.contextPath}" title="Click to share this post on Twitter">
						<img src="<c:url value='/resources/images/twitter.png'/>" alt="Twitter share button" title="delen op twitter" />
					</a>
				</li>
            </ul>
           
            

		</div>   
	   
	   
	    
	</div>
</div>
<!-- /extra -->
