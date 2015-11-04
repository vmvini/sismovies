	
<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="Head.jsp" %>
	
	<jsp:useBean id="grupocadastrado" class="java.lang.String"  scope="request" />

	<div class="row" style="background-color: rgb(87,86,86); color:white; padding:5px;">

		  <c:if test='${grupocadastrado.equals("true")}'>
		  	<h4 style="background-color:#F9F9F9;color:black;">Grupo cadastrado com sucesso</h4>
		  </c:if>

		  <h1>Cadastro de Grupo</h1>
		  <form class="form-horizontal" action="CadastroGrupo" method="post">
		  		<div class="form-group">
					    <label for="inputTitulo" class="col-sm-4 control-label">Nome</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputTitulo" name="name" placeholder="Nome">
					    </div>
					  </div>

				<div class="form-group">
						  <label for="comment" class="col-sm-4 control-label">Descrição</label>
						   <div class="col-sm-5">
						  <textarea class="form-control" rows="5" id="comment" name="descricao"></textarea>
						</div>
					  </div>

				<div class="form-group">
					    <div class="col-sm-offset-4 col-sm-5">
					      <button type="submit" class="btn btn-default">Cadastrar</button>
					    </div>
					  </div>

		  </form>
	</div>

</body>


</html>	