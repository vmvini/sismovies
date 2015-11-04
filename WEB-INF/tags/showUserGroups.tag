<%@ tag body-content="empty" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<%@ attribute name="groupFacade" type="sismovies.controllers.GroupFacade" required="true"%>
<%@ attribute name="user" type="java.lang.String" required="true"%>
<%@ attribute name="owner" type="java.lang.String" required="true"%>


<c:if test='${owner.equals("true")}'>
	<c:if test="${groupFacade.getGroupsCreatedByUser(user).size() > 0}">
		<div class="movieContainer">

			<c:forEach var="group" items="${ groupFacade.getGroupsCreatedByUser(user) }">
				<div style="display:inline-block;" >
					<a href="grupo.jsp?groupID=${group.getId()}">
						${group.getName()}
					</a>
				</div>

			</c:forEach>

		</div>

	</c:if>

	<c:if test="${groupFacade.getGroupsCreatedByUser(user).size() == 0}">
		<p>Não criou nenhum grupo.</p>
	</c:if>

</c:if>



<c:if test='${owner.equals("false")}'>

</c:if>

