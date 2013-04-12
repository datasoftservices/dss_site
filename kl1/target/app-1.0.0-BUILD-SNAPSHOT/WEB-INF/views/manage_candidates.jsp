<h2>Kandidaten</h2>
			
			<c:forEach items="${applicantsList}" var="applicant" varStatus="i">
	
						<div class="job-table-row ${i.index % 2 == 0 ? 'even' : 'odd'} clearfix">

					   			<h4 onclick="javascript:toggle_visibilityById('${applicant}')" class="pointer align-left">${applicant.firstName} ${applicant.lastName}</h4>
					   			 	

					   			
					   			
						</div>
						
						
						
					</c:forEach>