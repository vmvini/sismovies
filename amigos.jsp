
<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="Head.jsp" %>

<%
	FriendFacade friendFacade = new FriendFacade(centralFacade);
	User logged = centralFacade.getLoggedUser();
	List<User> friends = null;
	if(logged != null){
		friends = friendFacade.viewAllFriends(logged);

	}

	pageContext.setAttribute("friends", friends);
		



%>

	

	<div class="row" style="color:black; background-color:white; padding:5px;">

		<h1>Meus amigos<h1>

		<div class="movieContainer">
				<c:if test="${pageScope.friends.size() > 0}">
					<c:forEach var="f" items="${pageScope.friends}">

						<div class="movieWrapper">
							<div class="movieImage" style="background-image:url('${f.getPicturePath()}');">
							</div>

							<div class="movieDescription">
								<a href="userDetails.jsp?userID=${f.getId()}"><p style="font-size:16px;">${f.getName()}</p></a>
							</div>

						</div>	

					</c:forEach>
				</c:if>

				<c:if test="${pageScope.friends.size() == 0}">
					<h4>Você não possui amigos. :)</h4>
				</c:if>
				

				

			</div>

	</div>



	</body>


</html>	