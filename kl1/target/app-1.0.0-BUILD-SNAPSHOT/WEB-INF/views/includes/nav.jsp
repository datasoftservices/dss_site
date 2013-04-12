<!--header -->
	<!-- Facebook script for like buttons -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/nl_NL/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<div id="header-wrap">
	<header>
	    <nav>
			<ul>
				<li><a href="<c:url value='/index'/>">Home</a><span></span></li> 
				<li><a href="<c:url value='/news'/>">Nieuws</a><span></span></li>
				<li><a href="<c:url value='/jobs'/>">Jobs</a><span></span></li>
				<li><a href="<c:url value='/blog'/>">Blog</a><span></span></li>
				<li><a href="<c:url value='/team'/>">Over ons</a><span></span></li> 

				
				<sec:authorize access="isAnonymous()">
				<li><a class="fancy-login" href="#login">Aanmelden</a><span></span></li>
				</sec:authorize>
				
				<sec:authorize access="hasAnyRole('ROLE_GUEST','ROLE_ADMIN', 'ROLE_EMPLOYEE')">
				<li><a href="<c:url value="/j_spring_security_logout" />" >[<sec:authentication property="principal.username"/>] Afmelden</a><span></span></li>
				</sec:authorize>
				
			</ul>
		</nav>
	</header>
</div>
<!--/header-->
	<div id="login" class="hidden">
	<c:if test="${not empty error}">
		<div class="errorblock">
			Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if>
	

				
				<form style="margin: 0 auto;margin-top: -20px" name='f' action="<c:url value='j_spring_security_check' />" method='post' class="form_login form clearfix">
				

				<h3 style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Verdana, Sans-Serif;font-weight:bold;margin-left:90px;padding-bottom: 10px;">Aanmelden bij Datasoft Services</h3>

                    <label for="username">Gebruikersnaam <span><p>verplicht</p></span></label>
                   <input type='text' id="username" name='j_username' value=''>



                    <label for="password">Wachtwoord<span><p>verplicht</p></span> </label> 
                    <input type='password' id="password" name='j_password' />
 
                    <input name="submit" type="submit" value="Aamelden" class="button align-left"/>
         			<input name="reset" type="reset" value="Reset" class="button align-left" />


				</form>
	</div>