<%@ tag body-content="empty" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<%@ attribute name="rateFacade" type="sismovies.controllers.RateFacade" required="true"%>

<%@ attribute name="movie" type="sismovies.entities.Movie" required="true"%>


<c:if test="${rateFacade.getNumberOfStars(movie) > 0}">

   <c:forEach var="i" begin="1" end="${ rateFacade.getNumberOfStars(movie) }" >
   		<i style="color:yellow;" class="fa fa-star"></i>
	</c:forEach>


</c:if>