<div class="sidemenu popular">
			
	<h3>Recent nieuws</h3>
		
		<ul>				
			<c:if  test="${!empty newsItems}">
				<c:forEach items="${newsItems}" var="item">
				
			   		<li>
			   			<a href="<c:url value='/news/single/${item.id}'/>">${item.title}
							<span>Gepost op <fmt:formatDate pattern="dd-MM-yyyy" 
            value="${item.created}" /></span>
						</a>
					</li>

				</c:forEach>
			</c:if>
		</ul>
</div>