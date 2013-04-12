<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			 <c:forEach var="root" items="${root.repliedTocomment}"  varStatus="j">
 				<c:set var="root" value="${root}" scope="request"/>

<script type="text/javascript" charset="utf-8">
						$(document).ready(function() {
							$('#reply-wrap_${root.id}').initComment('${root.id}');
							$('#aside_${root.number}').initMargin('${root.originalComment.number}');
					  	});

					</script>
				<aside id="aside_${root.number}" class="comment-aside">
				<!-- nummer van de post waarop is geantwoord in de class zetten -->
		        <div class="post-meta comments ${!empty comment.originalComment.number ? comment.originalComment.number : ''} ${!empty comment.originalComment.number ? 'reply_to' : ''}">               	    
                   <ul>
                  	    <li class="reply">${root.author}</li>
                    </ul>
					
 
                </div>
                </aside>
 					<div id ="reply-wrap_${root.id}" class="reply-wrap ${root.originalComment.number} ">
                		<div id ="reply-tri_${root.id}" class="reply-tri"></div>
                		<div id ="reply-block_${root.id}" class="reply-block">
                			<p>
                				<span>${root.comment}</span>
                			</p>
                			<p class="comment-date">
                				<img style="margin-bottom: -1px;" src="<c:url value='/resources/images/calendar.png'/>" /> <fmt:formatDate dateStyle="medium" pattern="dd MMMMMMMMMM" value="${root.created}"/> <img style="margin-bottom: -2px;" src="<c:url value='/resources/images/time.png'/>" /> <fmt:formatDate type="time" pattern="HH:mm" value="${root.created}"/> <img style="margin-bottom: -3px;" src="<c:url value='/resources/images/list-ordered.png'/>" /> comment #${root.number}
 								<img style="margin-bottom: -3px;" src="<c:url value='/resources/images/chat.png'/>" /> <a href="javascript:reply('${root.id}')">reply</a>               			
                			</p>
               		
               				<!-- <p class="comment-index">${root.number}</p> -->
               				 					<jsp:include page='comment-tree.jsp'/>
                		</div>
                	</div>




			</c:forEach>
