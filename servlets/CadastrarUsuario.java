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


@MultipartConfig(fileSizeThreshold=1024*1024*10,    // 10 MB 
              maxFileSize=1024*1024*50,          // 50 MB
             maxRequestSize=1024*1024*100) 

public class CadastrarUsuario extends HttpServlet{

	private PrintWriter pw;
	private static final String IMAGES_DIR = "userimages";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		
		pw = response.getWriter();
		try{
			Class.forName("org.postgresql.Driver");
			
			CentralFacade central = (CentralFacade)request.getSession().getAttribute("centralfacade");
			
			createUserImagesFolder(getUserImagesPath(request));


			String nome = request.getParameter("name");
			String nick = request.getParameter("nickName");
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			String birth = request.getParameter("birthdate");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pic = getRelativeUploadedFilePath(request);
			String admin = "false";
			
			UserFacade userFacade = new UserFacade(central);
			userFacade.registerUser(nome, nick, email, pass, birth, city, state, pic, admin);
			
			uploadFile(request, getFinalUploadedFilePath(request, getUserImagesPath(request)));

			request.setAttribute("cadastrado", "true");

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
		catch(ParseException e ){
			pw.println("<html><body><h1>"+e+"</h1></body></html>");
		}
		catch(IOException e){
			pw.println("<html><body><h1>"+e+"</h1></body></html>");
		}
		catch(ServletException e){
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

	private void createUserImagesFolder(String userImagesPath) throws ServletException, IOException{
		
		File fileSaveDir = new File(userImagesPath);
		if(!fileSaveDir.exists())
			fileSaveDir.mkdirs();
	}

	private String getUserImagesPath(HttpServletRequest request) throws ServletException{
		String appPath = request.getServletContext().getRealPath("");
		String uploadFilePath = appPath + File.separator + IMAGES_DIR;
		return uploadFilePath;
	}


	private String getRelativeUploadedFilePath(HttpServletRequest request) throws IOException, ServletException{
		Part filePart = request.getPart("picture");
        String fileName = request.getParameter("nickName").trim() + ".jpg";
        return IMAGES_DIR + File.separator + fileName;
	}

	private String getFinalUploadedFilePath(HttpServletRequest request, String userImagesPath) throws IOException, ServletException {
		Part filePart = request.getPart("picture");
        String fileName = request.getParameter("nickName").trim() + ".jpg";
        return userImagesPath + File.separator + fileName;
	}

	private void uploadFile(HttpServletRequest request, String finalUploadFilePath )throws IOException, ServletException{
		Part filePart = request.getPart("picture");
        String fileName = request.getParameter("nickName").trim() + ".jpg";
        filePart.write(finalUploadFilePath);
        
	}

	


}