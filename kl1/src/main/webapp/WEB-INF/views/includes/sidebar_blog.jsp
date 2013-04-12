<div class="sidemenu popular">
			
	<h3>Recente blog berichten </h3>
		
		<ul>				
			<c:if  test="${!empty blogList}">
				<c:forEach items="${blogList}" var="blog">
				
			   		<li>
			   			<a href="<c:url value='/blog/single/${blog.id}'/>">${blog.title}
							<span>Gepost op <fmt:formatDate pattern="dd-MM-yyyy" 
            value="${blog.created}" /></span>
						</a>
					</li>

				</c:forEach>
			</c:if>
		</ul>
</div>