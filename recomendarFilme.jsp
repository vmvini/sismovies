
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


	String movieID = request.getParameter("filme");
	MovieFacade movieFacade = new MovieFacade(centralFacade);
	Movie movie = movieFacade.getMovie(movieID);
	
	
	List<MovieGenres> movieGenres = movieFacade.getGenres(movieID);
	List<String> actors = movieFacade.getActors(movieID);
	RateFacade rateFacade = new RateFacade(centralFacade);
	pageContext.setAttribute("rateFacade", rateFacade);
	pageContext.setAttribute("m", movie);
	pageContext.setAttribute("acts", actors);
	pageContext.setAttribute("gs", movieGenres);
	
	String avaliacaofeita = (String)request.getAttribute("avaliacaofeita");
		



%>

	<div class="row" style="background-color:white;padding:5px;">

		<div class="col-xs-4 filmedetalhe" >
			<img style="height:auto; width:100%;" src="<%= movie.getPicture() %>"></img>
			
			
			<h4><%= movie.getTitle() %></h4>
						<h4>Ano: <%= movie.getYear() %></h4>
						<h4>Diretor: <%= movie.getDirector() %></h4>
						<h4>Avaliação:</h4>
					<c:if test="${pageScope.rateFacade.getNumberOfStars(m) > 0}">
						<c:forEach var="i" begin="1" end="${pageScope.rateFacade.getNumberOfStars(m)}" >
			   				<i style="color:yellow;" class="fa fa-star"></i>
			        	</c:forEach>
			        </c:if>
			<h4>Sinopse</h4>
			<p><%= movie.getPlot() %></p>
			<h4>Atores</h4>
			<c:forEach var="actor"  items="${acts}" >
			   	 <c:out value="${actor}"/>
			</c:forEach>
			<h4>Gêneros</h4>
			<c:forEach var="genero"  items="${gs}" >
			   	 <p><c:out value="${genero.getGenre().getDescription()}"/></p>
			</c:forEach>

			
		</div>


		<div class="col-xs-8" style="color:black;">
			<h1>Para quais amigos você deseja recomendar o filme?<h1>

				<div class="movieContainer">
						<c:if test="${pageScope.friends.size() > 0}">
							<form action="RecomendarFilme" method="post">

							<c:forEach var="f" items="${pageScope.friends}">

								<div class="checkbox" style="display:inline-block;">
  										<label><input type="checkbox" name="users[]" value="${f.getId()}">
  											<div class="movieWrapper">
									
												<div class="movieImage" style="background-image:url('${f.getPicturePath()}');">
												</div>

												<div class="movieDescription">
													<a href="userDetails.jsp?userID=${f.getId()}"><p style="font-size:16px;">${f.getName()}</p></a>
												</div>

											</div>	

  										</label>

									</div>
								

							</c:forEach>

								 <input type="text" style="display:none;" name="movieID" value="${param.filme}"/>
								  <button type="submit" class="btn btn-default">Recomendar Filme</button>
							</form>
						</c:if>

						<c:if test="${pageScope.friends.size() == 0}">
							<h4>Você não possui amigos. :)</h4>
						</c:if>
						

						

					</div>

		</div>

		


	</div>


	</body>


</html>	