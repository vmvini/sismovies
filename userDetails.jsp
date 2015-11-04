<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="Head.jsp" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags/" %>
<%
	String userID = request.getParameter("userID");
	UserFacade userFacade = new UserFacade(centralFacade);
	FriendFacade friendFacade = new FriendFacade(centralFacade);
	RateFacade rateFacade = new RateFacade(centralFacade);
	GroupFacade groupFacade = new GroupFacade(centralFacade);
	User user = userFacade.getUser(userID);
	String meID = userID;
	List<RecommendedMovie> filmesRecomendados = null;
	if(centralFacade.getLoggedUser() != null){
		meID = String.valueOf(centralFacade.getLoggedUser().getId());
		filmesRecomendados = friendFacade.getRecommendedMovies(meID);

	}	
	List<Movie> filmesRecomendadosPeloUsuario = friendFacade.getMoviesThatUserRecommend(userID);

	List<Movie> movies = rateFacade.getAllMoviesRatedByUser(userID);
	pageContext.setAttribute("friendFacade", friendFacade);
	pageContext.setAttribute("userFacade", userFacade);
	pageContext.setAttribute("userID", userID);
	pageContext.setAttribute("meID", meID);
	pageContext.setAttribute("groupFacade", groupFacade);
	pageContext.setAttribute("centralFacade", centralFacade);
	pageContext.setAttribute("movies", movies);
	pageContext.setAttribute("filmesRecomendados", filmesRecomendados);
	pageContext.setAttribute("filmesRecomendadosPeloUsuario", filmesRecomendadosPeloUsuario);



%>


	<jsp:useBean id="solicitacaoenviada" class="java.lang.String"  scope="request" />
	<jsp:useBean id="amizaderemovida" class="java.lang.String"  scope="request" />	
	<div class="row">
		<div class="col-xs-4 perfil"  >

			<c:if test='${solicitacaoenviada.equals("true")}'>
				<h4 style="background-color:#F9F9F9; color:black;">Solicitação de amizade enviada!<h4>
			</c:if>

			<c:if test='${amizaderemovida.equals("true")}'>
				<h4 style="background-color:#F9F9F9; color:black;">Amizade desfeita!<h4>
			</c:if>

			<h4><%= user.getName() %></h4>
			<div class="userbox">
				<div class="userphoto" style="background-image:url('<%= user.getPicturePath() %>');">
				</div>

				<c:if test="${ pageScope.centralFacade.getLoggedUser() != null && !pageScope.meID.equals(pageScope.userID)  && pageScope.friendFacade.isFriendOrWantToBe(pageScope.userID, pageScope.meID) == false  }">
					<div id="add" class="addUser">
						<form action="AdicionarAmigo" method="post">
							<input type="text" style="display:none" value="<%= userID %>" name="otherUser"/>
							<button type="submit" class="btn btn-default">Adicionar</button>
						</form>
					</div>
				</c:if>

				<c:if test="${ pageScope.centralFacade.getLoggedUser() != null && pageScope.friendFacade.isFriend(pageScope.userID, pageScope.meID) }">
					<div id="block" class="blockUser">
						<form action="AdicionarAmigo" method="post">
							<input type="text" style="display:none" value="<%= userID %>" name="otherUser"/>
							<input type="text" style="display:none" value="<%= meID %>" name="meID" />
							<input type="text" style="display:none" value="true" name="blockUser" />
							<button type="submit" class="btn btn-default">Desfazer Amizade</button>
						</form>
					</div>
				</c:if>
				
			</div>

			<h4>Apelido: <%= user.getNickName() %></h4>
			<h4>Cidade: <%= user.getCity() %></h4>
			<h4>Estado: <%= user.getState() %></h4>
			<h4>Data Nascimento: <%= user.getBirthDateString() %></h4>


		</div>
	
		<div class="col-xs-8 useritems" >	

			<h4>Filmes Avaliados</h4>

			<div class="movieContainer">
				<c:forEach var="m" items="${pageScope.movies}">

					<div class="movieWrapper">
						<div class="movieImage" style="background-image:url('${m.getPicture()}');">
						</div>

						<div class="movieDescription">
							<a href="detalhesFilme.jsp?filme=${m.getId()}"><p>${m.getTitle()}</p></a>
						</div>

					</div>

				</c:forEach>

			</div>

			<c:if test="${ pageScope.centralFacade.getLoggedUser() != null  }">
				<c:if test="${ pageScope.userID.equals(pageScope.meID) }">
					<h4>Filmes Recomendados</h4>
					<div class="movieContainer">
						<c:if test="${ pageScope.filmesRecomendados.size() > 0 }">
							<c:forEach var="fr" items="${pageScope.filmesRecomendados}">

							<div class="movieWrapper">
								<div class="movieImage" style="background-image:url('${fr.getMovie().getPicture()}');">
								</div>

								<div class="movieDescription">
									<p style="margin:0;padding:0;">
										<a href="detalhesFilme.jsp?filme=${fr.getMovie().getId()}">
											${fr.getMovie().getTitle()}
										</a>
									</p>
									<p style="margin:0;padding:0;">Recomendado por: 
										<a href="userDetails.jsp?userID=${fr.getSenderUser().getId()}">
											${fr.getSenderUser().getName()}
										</a>
									</p>
									
								</div>

							</div>

							</c:forEach>
						</c:if>
						<c:if test="${ pageScope.filmesRecomendados.size() == 0 }">
							<p>Nenhum amigo recomendou filmes para você. :)</p>
						</c:if>	


					</div>

				</c:if>	

			</c:if>




			<h4>Recomendou os filmes</h4>
			<c:if test="${ pageScope.filmesRecomendadosPeloUsuario.size() > 0 }">
				<div class="movieContainer">
					<c:forEach var="frpu" items="${pageScope.filmesRecomendadosPeloUsuario}">

						<div class="movieWrapper">
							<div class="movieImage" style="background-image:url('${frpu.getPicture()}');">
							</div>

							<div class="movieDescription">
								<a href="detalhesFilme.jsp?filme=${frpu.getId()}"><p>${frpu.getTitle()}</p></a>
							</div>

						</div>

					</c:forEach>

				</div>


			</c:if>
			<c:if test="${ pageScope.filmesRecomendadosPeloUsuario.size() == 0 }">
				<p>Não recomendou nenhum filme.</p>
			</c:if>




			<h4>Criador dos grupos</h4>
			<my:showUserGroups groupFacade="${pageScope.groupFacade}" user="${pageScope.userID}" owner="true"/>

			<h4>Participa dos grupos</h4>
			<my:showUserGroups groupFacade="${pageScope.groupFacade}" user="${pageScope.userID}" owner="false"/>



		</div>

	</div>



</body>


</html>	