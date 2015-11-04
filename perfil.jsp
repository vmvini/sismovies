<%@page contentType="text/html;charset=UTF-8"%>

<% 
  FriendFacade friendFacade = new FriendFacade(centralFacade);

  String meID = String.valueOf(centralFacade.getLoggedUser().getId());
  List<Friendship> fsInvitations = friendFacade.viewFriendInvitations(meID);
  List<Friendship> fsResponses = friendFacade.viewFriendInvitationsResponse(meID);
  List<RecommendedMovie> rmovies = friendFacade.getNotViewedRecommendedMovies(meID);

  pageContext.setAttribute("fsResponses", fsResponses);
  pageContext.setAttribute("fsInvitations", fsInvitations);
  pageContext.setAttribute("rmovies", rmovies);


%>


<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Confirmar Remoção de Conta</h4>
                </div>
            
                <div class="modal-body">
                    <p>Realmente deseja remover sua conta?</p>
                   	
                </div>
                
                <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <a class="btn btn-danger btn-ok" href="RemoverConta">Remover</a>
                </div>
            </div>
        </div>
    </div>


	

<div class="row">
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" style="padding:0; border:1px solid;" href="#"><img style="width:50px; height:50px;" src="<%= centralFacade.getLoggedUser().getPicturePath() %>"></a>
    </div>

   

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li ><a href="userDetails.jsp?userID=<%= centralFacade.getLoggedUser().getId() %>"><%= centralFacade.getLoggedUser().getNickName() %></a></li>
        <li><a href="StartSisMovie">Filmes</a></li>
        <li><a href="pessoas.jsp">Pessoas</a></li>
        <li><a href="amigos.jsp">Amigos</a></li>
        <li><a href="">Grupos</a></li>
        <li><a href="criargrupo.jsp">Criar Grupo</a></li>
        <%
          if(centralFacade.getLoggedUser().isAdmin()){
            %>
              <li><a href="cadastrarfilme.jsp">Cadastrar Filme</a></li>
              <li><a href="cadastraradmin.jsp">Cadastrar Admin</a></li>
            <%
          } 

        %>
        
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        
      	<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Notificações<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <c:forEach var="fi" items="${pageScope.fsInvitations}">
              <li>
                <div class="solicitacao">
                    <div class="solicPart">
                        ${fi.getSender().getName()} deseja te adicionar. 
                    </div>
                    <div class="solicPart">
                        <a href="Amizade?aceito=true&amizade=${fi.getId()}">aceitar</a>
                    </div>
                    <div class="solicPart">
                        <a href="Amizade?aceito=false&amizade=${fi.getId()}">recusar</a>
                    </div>
                </div>
              </li>
              <li role="separator" class="divider"></li>

            </c:forEach>

            <c:forEach var="fr" items="${pageScope.fsResponses}">
              <li>
                <div class="solicitacao">
                    <div class="solicPart">
                        ${fr.getReceiver().getName()}
                    </div>

                    <div class="solicPart">
                        <c:if test="${ fr.isAccepted() == true }">
                          aceitou
                        </c:if>
                        <c:if test="${ fr.isAccepted() == false }">
                          recusou
                        </c:if>
                        
                    </div>

                    <div class="solicPart">
                        seu pedido de amizade.
                    </div>

                    <div class="solicPart">
                        <a href="Amizade?visualizado=true&amizade=${fr.getId()}">Marcar como lido.</a>
                    </div>
                    
                </div>
              </li>
              <li role="separator" class="divider"></li>

            </c:forEach>

            <c:forEach var="rm" items="${pageScope.rmovies}">
              <li>
                <div class="solicitacao">
                    <div class="solicPart">
                        ${rm.getSenderUser().getName()} recomendou o filme 
                    </div>
                    <div class="solicPart">
                        <a href="FilmeRecomendado?rm=${rm.getId()}&filme=${rm.getMovie().getId()}">
                            ${rm.getMovie().getTitle()} 
                        </a>
                    </div>
                    
                </div>
              </li>
              <li role="separator" class="divider"></li>

            </c:forEach>



          </ul>
        </li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Conta<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="atualizarUsuario.jsp">Alterar Dados</a></li>
            <li><a href="#"  data-toggle="modal" data-target="#confirm-delete"  >Remover Conta</a></li>
            
            <li role="separator" class="divider"></li>
            <li><a href="SairServlet">Sair</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>