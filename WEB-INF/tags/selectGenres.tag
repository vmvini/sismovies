<%@ tag body-content="empty" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<%@ attribute name="movieFacade" type="sismovies.controllers.MovieFacade" required="true"%>


<c:forEach var="i" begin="1" end="13" >
   		<option value="${i}"> 
   			${movieFacade.getGenreDescription(i)}
   		</option>
</c:forEach>