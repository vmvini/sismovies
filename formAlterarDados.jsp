<%@page contentType="text/html;charset=UTF-8"%>
<div class="row">
		  <div class="col-xs-6 label">
		  	<div class="jumbotron">
		  		 <h1 class="titulo" style="font-size:16px;">Informações do Usuário</h1>
				</div>

				<img style="width: 250px; height: 350px;" src="<%= centralFacade.getLoggedUser().getPicturePath() %>"></img>
		  </div>

		  <div class="col-xs-6 cadastro label" >
		  		<div class="jumbotron">
		  			<%  
		  				String dadosAlterados = (String)request.getAttribute("dadosAlterados");
		  				if(dadosAlterados != null){
		  					if(dadosAlterados.equals("true"))
		  						%>
		  							<h1 class="titulo" style="font-size:16px;">Dados atualizados com sucesso!</h1>
		  						<%

		  				}

		  			%>

				  <h1 class="titulo">Alterar Dados</h1>
				</div>
				<form class="form-horizontal" action="AtualizarUsuario" method="post" enctype="multipart/form-data">
					  <div class="form-group">
					    <label for="inputNome" class="col-sm-4 control-label">Nome</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputNome" name="name" placeholder="<%= centralFacade.getLoggedUser().getName() %>" value="<%= centralFacade.getLoggedUser().getName() %>">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputApelido" class="col-sm-4 control-label">Apelido</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputApelido" name="nickName" placeholder="<%= centralFacade.getLoggedUser().getNickName() %>" value="<%= centralFacade.getLoggedUser().getNickName() %>">
					    </div>
					  </div>

					  <div class="form-group">
					    <label for="inputEmail" class="col-sm-4 control-label">Email</label>
					    <div class="col-sm-5">
					      <input type="email" class="form-control" id="inputEmail" name="email" placeholder="<%= centralFacade.getLoggedUser().getEmail() %>" value="<%= centralFacade.getLoggedUser().getEmail() %>">
					    </div>
					  </div>

					  <div class="form-group">
					    <label for="inputPassword" class="col-sm-4 control-label">Senha</label>
					    <div class="col-sm-5">
					      <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Senha" value="<%= centralFacade.getLoggedUser().getPassword() %>">
					    </div>
					  </div>

					  <div class="form-group">
					    <label for="inputBirthDate" class="col-sm-4 control-label">Data Nascimento</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputBirthDate" name="birthdate" placeholder="" value="<%= centralFacade.getLoggedUser().getBirthDateString() %>">
					    </div>
					  </div>

					  <div class="form-group">
					    <label for="inputCity" class="col-sm-4 control-label">Cidade</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputCity" name="city" placeholder="<%= centralFacade.getLoggedUser().getCity() %>" value="<%= centralFacade.getLoggedUser().getCity() %>">
					    </div>
					  </div>

					  <div class="form-group">
					    <label for="inputState" class="col-sm-4 control-label">Estado</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputState" name="state" placeholder="<%= centralFacade.getLoggedUser().getState() %>" value="<%= centralFacade.getLoggedUser().getState() %>">
					    </div>
					  </div>

					  <div class="form-group">
					    <label for="exampleInputFile" class="col-sm-4 control-label">Foto de perfil</label>
					    <div class="col-sm-5">
					    	<input type="file" id="exampleInputFile" name="picture" accept="image/*">
					   		<p class="help-block">Envie uma foto de perfil.</p>
						</div>
					  </div>


					  <br>
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-5">
					      <button type="submit" class="btn btn-default">Atualizar</button>
					    </div>
					  </div>
			</form>

		  </div>




		</div>