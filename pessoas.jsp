
<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="Head.jsp" %>

<%
	UserFacade userFacade = new UserFacade(centralFacade);
	List<User> foundUsers = (List<User>)request.getAttribute("foundUsers");
	if(foundUsers == null ){
		List<User> users = userFacade.getAllUsers();
		pageContext.setAttribute("users", users);
	}
	else{
		pageContext.setAttribute("users", foundUsers);
	}

	


	

%>


	<div class="row" style="background-color:white; color:black; padding:5px;">

		<h1>Pessoas</h1>

		<form class="form-inline" action="BuscarPessoas" method="post">
			  <div class="form-group">
			    <label for="inputName">Nome: </label>
			    <input type="text" class="form-control" id="inputName" name="nome" placeholder="Nome da pessoa">

			    <label  for="inputCity">Cidade: </label>
			    <input type="text" class="form-control" id="inputCity" name="cidade" placeholder="Cidade da pessoa">
					
				<label  for="inputState">Estado: </label>
			    <input type="text" class="form-control" id="inputState" name="estado" placeholder="Estado da pessoa">

			  </div>

			<button type="submit" class="btn btn-default">Buscar</button>

		</form>



		<div class="movieContainer">
				<c:if test="${pageScope.users.size() > 0}">
					<c:forEach var="f" items="${pageScope.users}">

						<div class="movieWrapper">
							<div class="movieImage" style="background-image:url('${f.getPicturePath()}');">
							</div>

							<div class="movieDescription">
								<a href="userDetails.jsp?userID=${f.getId()}"><p style="font-size:16px;">${f.getName()}</p></a>
							</div>

						</div>	

					</c:forEach>
				</c:if>

				<c:if test="${pageScope.users.size() == 0}">
					<h4>Não existem pessoas com essas características. :)</h4>
				</c:if>
				

				

			</div>



	</div>



	</body>


</html>	