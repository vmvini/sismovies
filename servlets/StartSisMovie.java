package servlets;
import javax.servlet.http.*;  
import javax.servlet.*;  
import java.io.*; 
import java.sql.*;
import java.text.ParseException;
import sismovies.entities.*;
import sismovies.controllers.*;
import sismovies.daoclasses.*;
import javax.servlet.annotation.*;
import java.util.*;



public class StartSisMovie extends HttpServlet{

	private PrintWriter pw;
	private static final String IMAGES_DIR = "userimages";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		pw = response.getWriter();
		try{
			Class.forName("org.postgresql.Driver");
				CentralFacade centralFacade = (CentralFacade) request.getSession().getAttribute("centralfacade");
			if(centralFacade == null){
				centralFacade = new CentralFacade();
				request.getSession().setAttribute("centralfacade", centralFacade);
			}
			
			
			MovieFacade movieFacade = new MovieFacade(centralFacade);
			List<Movie> movies = movieFacade.allMoviesSortedByTitle();
			

			request.setAttribute("movies_pictures", movies);

			goToPage("/index.jsp", request, response);
			
			
		}
		catch(UnsupportedOperationException e){
			pw.println("<html><body><h1>"+e+"</h1></body></html>");
		}
		catch(SQLException e){
			pw.println("<html><body><h1>"+e+"</h1></body></html>");
		}
		catch(ClassNotFoundException e){
			pw.println("<html><body><h1>"+e+"</h1></body></html>");
		}
		catch(NullPointerException e){
			pw.println("<html><body><h1>"+e+"</h1></body></html>");
		}
		
		
		

	}

	private void goToPage(String address, HttpServletRequest request, HttpServletResponse response){
		try{
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
			dispatcher.forward(request, response);
		}
		catch(ServletException e){
			pw.println("<html><body><p>"+e+"</p></body></html>");
		}
		catch(IOException e){
			pw.println("<html><body><h1>"+e+"</h1></body></html>");
		}
	}


	


}