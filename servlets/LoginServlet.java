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



public class LoginServlet extends HttpServlet{

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
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			if(email == null || pass == null)
				pw.println("<html><body><h1>email ou senha nulos</h1></body></html>");

			pass = SQLUtils.addStringIdentifier(pass);

			CentralFacade centralFacade = (CentralFacade) request.getSession().getAttribute("centralfacade");
			if(centralFacade == null){
				pw.println("<html><body><h1>centralFacade nulo</h1></body></html>");
			}
			UserFacade userFacade = new UserFacade(centralFacade);
			

			userFacade.login(email, pass);
			if(centralFacade.getLoggedUser() != null)
				goToPage("/StartSisMovie", request, response);
			else
				request.setAttribute("erroLogin", "true");
			goToPage("/StartSisMovie", request, response);
			
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
		
		
		

	}

	private void goToPage(String address, HttpServletRequest request, HttpServletResponse response){
		try{
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
			dispatcher.forward(request, response);
		}
		catch(ServletException e){
			pw.println("<html><body><h1>"+e+"</h1></body></html>");
		}
		catch(IOException e){
			pw.println("<html><body><h1>"+e+"</h1></body></html>");
		}
	}


	


}