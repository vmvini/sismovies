	
<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="Head.jsp" %>
	

<div class="row">
		  

		  <div class="col-xs-12 cadastro label" >
		  		<div class="jumbotron">

		  			<%	
		  				String filmecadastrado = (String)request.getAttribute("filmecadastrado");
		  				if(filmecadastrado != null){
		  					if(filmecadastrado.equals("true")){
		  						%>
		  							<h1 class="titulo" style="font-size:16px;">Filme cadastrado com sucesso!</h1>
		  						<%
		  					}
		  				}
		  			%>

		  			 <h1 class="titulo" style="font-size:16px;">Cadastro de Filme</h1>
				</div>
				
				<form class="form-horizontal" action="CadastroFilme" method="post" enctype="multipart/form-data">
					  <div class="form-group">
					    <label for="inputTitulo" class="col-sm-4 control-label">Título</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputTitulo" name="title" placeholder="Título">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputAno" class="col-sm-4 control-label">Ano</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="inputAno" name="year" placeholder="Ano">
					    </div>
					  </div>

					  <div class="form-group">
						  <label for="comment" class="col-sm-4 control-label">Sinopse</label>
						   <div class="col-sm-5">
						  <textarea class="form-control" rows="5" id="comment" name="plot"></textarea>
						</div>
					  </div>

					  	<div class="form-group">
					  		<label class="col-sm-4 control-label">Gêneros</label>
					  		<div class="col-sm-5" >
					  			<div style="width:50%; display:inline-block; text-align:left;" >
					  				<div class="checkbox">
										    <label>
										      <input type="checkbox" name="genres[]" value="<%= Genre.ROMANCE.getKey() %>" >Romance
										    </label>
										  </div>

										  <div class="checkbox">
										    <label>
										      <input type="checkbox" name="genres[]" value="<%= Genre.DOCUMENTARY.getKey() %>" >Documentário
										    </label>
										  </div>

										  		<div class="checkbox">
										    <label>
										      <input type="checkbox" name="genres[]" value="<%= Genre.ACTION.getKey()  %>" >Ação
										    </label>
										  </div>
										  <div class="checkbox">
										    <label>
										      <input type="checkbox" name="genres[]" value="<%= Genre.ADVENTURE.getKey()  %>" >Aventura
										    </label>
										  </div>
										  <div class="checkbox">
										    <label>
										      <input type="checkbox" name="genres[]" value="<%= Genre.COMEDY.getKey()  %>" >Comédia
										    </label>
										  </div>
										  
					  			</div>


					  			<div style="width:50%; display:inline-block; text-align:left;"  >
					  					<div class="checkbox">
										    <label>
										      <input type="checkbox" name="genres[]" value="<%= Genre.CRIME.getKey() %>" >Crime
										    </label>
										  </div>
					  					<div class="checkbox">
											    <label>
											      <input type="checkbox" name="genres[]" value="<%= Genre.FANTASY.getKey() %>" >Fantasia
											    </label>
											  </div>
											  <div class="checkbox">
											    <label>
											      <input type="checkbox" name="genres[]" value="<%= Genre.HORROR.getKey()  %>" >Horror
											    </label>
											  </div>
											  <div class="checkbox">
											    <label>
											      <input type="checkbox" name="genres[]" value="<%= Genre.MYSTERY.getKey()  %>" >Mistério
											    </label>
											  </div>
											  <div class="checkbox">
											    <label>
											      <input type="checkbox" name="genres[]" value="<%= Genre.SCIENCE_FICTION.getKey() %>" >Ficção Científica
											    </label>
											  </div>
					  			</div>	


					  		</div>
					  	</div>
						
					  
					

					  
					 

					  
					  <div class="form-group">
					    <label for="exampleInputFile" class="col-sm-4 control-label">Foto de Capa</label>
					    <div class="col-sm-5">
					    	<input type="file" id="exampleInputFile" name="picture" accept="image/*">
					   		<p class="help-block">Envie a capa do filme.</p>
						</div>
					  </div>


					  <div class="form-group">
					    <label  class="col-sm-4 control-label">Elenco</label>
					    <div class="col-sm-2">
					    	<input type="text" class="form-control"  name="actor[]" placeholder="Ator/Atriz">
					    		 
					    </div>
					    <div class="col-sm-2 divBotao" style="padding:0;">
					    	<i class="fa fa-plus addActor" style="float:left;"></i>
					    </div>
					   
					  </div>
					  

					  <div class="form-group">
					    <label class="col-sm-4 control-label">Direção</label>
					    <div class="col-sm-2">
					      <input type="text" class="form-control"  name="director" placeholder="Direção">
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

		




	</body>


</html>	