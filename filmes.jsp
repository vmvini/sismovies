<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="sismovies.entities.*, sismovies.controllers.*, sismovies.daoclasses.*, servlets.*, java.io.*, java.util.*, 
		java.sql.*, java.lang.*"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags/" %>

<%
	List<Movie> mpss = (List<Movie>)request.getAttribute("movies_pictures");
	String nenhumresultado = (String)request.getAttribute("nenhumresultado");
	if(nenhumresultado != null)
		pageContext.setAttribute("nenhumresultado", nenhumresultado);
	pageContext.setAttribute("mps", mpss);

	if(centralFacade == null){
		%><h1>centralFacade nulo</h1><%
	}
	MovieFacade movieFacade = new MovieFacade(centralFacade);
	pageContext.setAttribute("movieFacade", movieFacade);

	RateFacade rateFacade = new RateFacade(centralFacade);
	pageContext.setAttribute("rateFacade", rateFacade);

%>




<div class="row">
<section class="filmes">

		
		<form class="form-inline" action="BuscarFilme" method="post">
		  <div class="form-group">
		    <label class="sr-only" for="inputSearch">Procurar filmes</label>
		     
		    	<input type="text" class="form-control" id="inputSearch" name="search" placeholder="Procure pelo nome do filme, ou por ator, ou por diretor">
			
		  </div>


		  <div class="form-group">
		    <label class="sr-only" for="selectGenre">Gênero</label>
		   	<select class="form-control" id="selectGenre" name="genre" class="selectpicker">
		   		<option value="0">Gênero</option>
			   	<my:selectGenres movieFacade="${pageScope.movieFacade}" />
			</select>
		  </div>

		  <div class="form-group">
		    <label class="sr-only" for="selectSearchType">Busca por:</label>
		   	<select class="form-control" id="selectSearchType" name="searchBy" class="selectpicker">
			    <option value="0">Buscar por:</option>
			    <option value="title">Título</option>
			    <option value="actor">Ator</option>
			    <option value="director">Diretor</option>
			</select>
		  </div>

		  <div class="form-group">
		    <label class="sr-only" for="selectFilter">Filtrar por:</label>
		   	<select class="form-control" id="selectFilter" name="orderBy" class="selectpicker">
		   		<option value="0">Filtrar por:</option>
			    <option value="title">Ordem Alfabética</option>
			    <option value="year">Ano</option>
			    <option value="rating">Rating</option>
			</select>
		  </div>

		  <button type="submit" class="btn btn-default">Buscar</button>

		</form>

		<div id="movies">
			<c:if test='${pageScope.nenhumresultado.equals("true")}'>
				<h1>Nenhum filme encontrado.</h1>
			</c:if>

			<c:if test="${pageScope.nenhumresultado == null}">
				<c:forEach var="mp" items="${pageScope.mps}">

				   <a href="detalhesFilme.jsp?filme=${mp.getId()}"><div class="movie" style="background-image:url('${ mp.getPicture() }'); background-size: cover; background-repeat: no-repeat; background-position: 50% 50%; font-size:16px; color:white; text-align:center;"> 

				   	<span style=" background-color: rgb(87,86,86); opacity:0.9; width:100%; display:inline-block; ">${ mp.getTitle() }</span>
				   	<span style=" background-color: rgb(87,86,86); opacity:0.9; width:100%; display:inline-block; ">${ mp.getYear() }</span>
				   	<span style=" background-color: rgb(87,86,86); opacity:0.9;  width:100%; display:inline-block;"> 
				   		<my:showMovieStars rateFacade="${pageScope.rateFacade}" movie="${mp}" />
				   	</span>

				   </div></a>
				</c:forEach>
			</c:if>
		</div>


		
		





</section>
</div>