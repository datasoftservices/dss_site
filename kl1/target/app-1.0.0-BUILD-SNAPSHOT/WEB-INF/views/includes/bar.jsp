<div id="nav-2-wrap">
  <div id="nav-2">
 
	<sec:authorize access="isAuthenticated()">
				<a target="_new" href="<c:url value="http://46.18.32.48:8080/roundcube/" />" >webmail</a> | 
				<a href="<c:url value="/account" />" >instellingen</a>
				

	</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMPLOYEE')">
				| <a href="<c:url value='/blog/manage'/>">beheer blog</a> 
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
				| <a href="<c:url value='/jobs/manage'/>">beheer jobs</a> |
				<a href="<c:url value='/news/manage'/>">beheer nieuws</a> |
				<a href="<c:url value='/jobs/manage/candidates'/>">beheer kandidaten</a> |
				<a href="<c:url value='/user/list'/>">beheer gebruikers</a>
				

	</sec:authorize>




 	<sec:authorize access="isAnonymous()"> 
 	<div style="padding-top:4px;margin-left:60px;width:200px;float:left;">

	  		<script src="//platform.linkedin.com/in.js" type="text/javascript"></script>
			<script type="IN/FollowCompany" data-id="1217272" data-counter="right"></script>

	</div>
	</sec:authorize>
	<noscript>
	<div id="jscript-error" class="align-right jscript-error">
	<p>Om optimaal onze site te bezoeken dient u javascript in te schakelen!</p>
	</div>
	</noscript>

    </div>
</div>