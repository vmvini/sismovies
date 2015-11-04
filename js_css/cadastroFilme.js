window.onload = function(){



	$( document ).on("click", ".addActor",function() {
		//ultimoInput :pegar form-group que contem esse .addActor
		var ultimoInput = $(this).closest(".form-group");
  		
  		//pegar pai de .addActor 
  		var addActorParent = $(this).closest(".divBotao");

  		//pegar element .addActor
  		var addActorButton = $(this);

  		//remover pai de .addActor
  		addActorParent.remove();

  		//criar novo .form-group que contem input e botao(+) APÓS ultimoInput

  		var new_input_code = "<div class=\"form-group\"> " +
					"    <label  class=\"col-sm-4 control-label\">Elenco</label> " +
					"    <div class=\"col-sm-2\"> " +
					"   	<input type=\"text\" class=\"form-control\"  name=\"actor[]\" placeholder=\"Ator/Atriz\">"+
					    		 
					"    </div>" +
					"   <div class=\"col-sm-2 divBotao\" style=\"padding:0;\"> " +
					"    	<i class=\"fa fa-plus addActor\" style=\"float:left;\"></i> " +
					"    </div></div>";


  		$( new_input_code ).insertAfter( ultimoInput );

  		/*
  		//pegar divBotao
  		var new_input =  ultimoInput.next();
  		var divBotao = new_input.find(".divBotao");

  		//adicionar addActorButton ao novo divBotao
  		divBotao.append(addActorButton);*/


	});

	

}