<div class="row">
		  <div class="col-xs-6 label" >
		  	<div class="jumbotron">
		  		<%
		  			String erroLogin = (String)request.getAttribute("erroLogin");
		  			if(erroLogin != null){
		  				if(erroLogin.equals("true")){
		  					%>
		  						<h1 class="titulo" style="font-size:16px;">Email ou senha incorretos. Tente novamente.</h1>
		  					<%
		  				}
		  			}
		  		%>


				  <h1 class="titulo">Entre</h1>
				</div>
		  		<form class="form-horizontal" action="LoginServlet" method="post" >
		  			<div class="form-group">
					    <label for="inputEmail" class="col-sm-4 control-label">Email</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputEmail" name="email" placeholder="Email">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputPassword" class="col-sm-4 control-label">Senha</label>
					    <div class="col-sm-5">
					      <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Senha">
					    </div>
					  </div>

					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-5">
					      <button type="submit" class="btn btn-default">Entrar</button>
					    </div>
					  </div>

		  		</form>

		  		<span style="font-size:60px; " class="titulo seethrough">SISMOVIES</span>
		  </div>

		  <div class="col-xs-6 cadastro label" >
		  		<div class="jumbotron">
		  			<%  
		  				String cadastrado = (String)request.getAttribute("cadastrado");
		  				if(cadastrado != null){
		  					if(cadastrado.equals("true"))
		  						%>
		  							<h1 class="titulo" style="font-size:16px;">Cadastro Realizado com sucesso.</h1>
		  						<%

		  				}

		  			%>

				  <h1 class="titulo">Cadastre-se</h1>
				</div>
				<form class="form-horizontal" action="CadastrarUsuario" method="post" enctype="multipart/form-data">
					  <div class="form-group">
					    <label for="inputNome" class="col-sm-4 control-label">Nome</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputNome" name="name" placeholder="Nome">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputApelido" class="col-sm-4 control-label">Apelido</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputApelido" name="nickName" placeholder="Apelido">
					    </div>
					  </div>

					  <div class="form-group">
					    <label for="inputEmail" class="col-sm-4 control-label">Email</label>
					    <div class="col-sm-5">
					      <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Email">
					    </div>
					  </div>

					  <div class="form-group">
					    <label for="inputPassword" class="col-sm-4 control-label">Senha</label>
					    <div class="col-sm-5">
					      <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Senha">
					    </div>
					  </div>

					  <div class="form-group">
					    <label for="inputBirthDate" class="col-sm-4 control-label">Data Nascimento</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputBirthDate" name="birthdate" placeholder="Data de Nascimento">
					    </div>
					  </div>

					  <div class="form-group">
					    <label for="inputCity" class="col-sm-4 control-label">Cidade</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputCity" name="city" placeholder="Cidade">
					    </div>
					  </div>

					  <div class="form-group">
					    <label for="inputState" class="col-sm-4 control-label">Estado</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputState" name="state" placeholder="Estado">
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
					      <button type="submit" class="btn btn-default">Cadastrar</button>
					    </div>
					  </div>
			</form>

		  </div>




		</div>