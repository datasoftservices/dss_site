<div class="sidemenu">
	<h3>Archief</h3>
		<ul>
			<c:forEach items="${archiveList}" var="arch">
				<li>
					<a href="<c:url value='${path}${arch.value}'/>">
						<fmt:formatDate dateStyle="long" pattern="MMMMMMMM yyyy" value="${arch.key}"/>
					</a>
				</li>
			</c:forEach>
		</ul>
</div> 