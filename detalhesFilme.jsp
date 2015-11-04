	
<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="Head.jsp" %>

<%
	String movieID = request.getParameter("filme");
	MovieFacade movieFacade = new MovieFacade(centralFacade);
	Movie movie = movieFacade.getMovie(movieID);
	User loggedUser = centralFacade.getLoggedUser();
	List<MovieRate> movieRates = movieFacade.getRates(movieID);
	List<MovieGenres> movieGenres = movieFacade.getGenres(movieID);
	List<String> actors = movieFacade.getActors(movieID);
	RateFacade rateFacade = new RateFacade(centralFacade);
	pageContext.setAttribute("rateFacade", rateFacade);
	pageContext.setAttribute("loggedUser", loggedUser);
	pageContext.setAttribute("m", movie);
	pageContext.setAttribute("acts", actors);
	pageContext.setAttribute("gs", movieGenres);
	pageContext.setAttribute("mvrs", movieRates);
	String avaliacaofeita = (String)request.getAttribute("avaliacaofeita");
	String filmerecomendado = (String)request.getAttribute("filmerecomendado");


%>


	<div class="row" style="background-color:white;">

		<div class="col-xs-4 filmedetalhe" >

			<% 
			if(filmerecomendado != null){
				if(filmerecomendado.equals("true")){
					%>
						<h4 style="background-color:#F9F9F9;color:black;">filme recomendado com sucesso!</h4>
					<%
				}
			}
			%>	

			<img style="height:auto; width:100%;" src="<%= movie.getPicture() %>"></img>
			<c:if test="${ loggedUser != null }">
				<div class="recomendar">
					<a href="recomendarFilme.jsp?filme=<%= movie.getId() %>">Recomendar Filme</a>
				</div>
			</c:if>
			
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

		<div class="col-xs-8" style="background-color:white; color:black;">
			<%
			
			if(centralFacade.getLoggedUser() != null && avaliacaofeita == null && rateFacade.userAlreadyDidRate(centralFacade.getLoggedUser(), movieID) == false ){
				%>
					<h1>Faça sua avaliação:</h1>
					<form class="form-inline" action="AvaliarFilme" method="post">

						<div class="form-group">
					    	<label for="selectEstrelas">Nota</label>
					   		<select style="font-family:'FontAwesome',Arial;" class="form-control" id="selectEstrelas" name="stars" class="selectpicker">
					   			<option value="1"> &#xf005; </option>
					   			<option value="2"> &#xf005;&#xf005; </option>
					   			<option value="3"> &#xf005;&#xf005;&#xf005; </option>
					 			<option value="4"> &#xf005;&#xf005;&#xf005;&#xf005; </option>
					  			<option value="5"> &#xf005;&#xf005;&#xf005;&#xf005;&#xf005; </option>
							</select>
						</div>

				
						<div class="form-group">
							<label for="comment" >Comentário</label>
							<textarea class="form-control" rows="5" cols="60" id="comment" name="comment"></textarea>
							
						</div>
						<input style="display:none;" type="text" name="movie" value="<%= movieID %>">

						<button type="submit" class="btn btn-default">Enviar</button>

					</form>
				<%
			}

			if(avaliacaofeita != null){
				if(avaliacaofeita.equals("true")){
					%>
						<h1>Avaliação feita com sucesso!</h1>
					<%
				}
			}
			%>
			
			<h1>Avaliações</h1>

			<c:forEach var="mr"  items="${pageScope.mvrs}" >
			   	<div class="avaliacao">
					
						<div class="avaliador" style="background-image:url('${mr.getUser().getPicturePath()}');">
						<p>
							<c:forEach var="i" begin="1" end="${mr.getRate()}" >
			   					<i style="color:yellow;" class="fa fa-star"></i>
			         		</c:forEach>

						</p>
					
					</div>
					<div class="comentario">
						<p><a href="userDetails.jsp?userID=${mr.getUser().getId()}">${mr.getUser().getName()}</a> disse: </p>
						<p>${mr.getComment()}</p>
					</div>
				</div>
			</c:forEach>

			

			

		</div>

	</div>

	
	



	</body>


</html>	