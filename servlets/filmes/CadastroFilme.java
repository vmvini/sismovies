package servlets.filmes;
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

public class CadastroFilme extends HttpServlet{

	private PrintWriter pw;
	private static final String IMAGES_DIR = "movieimages";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		pw = response.getWriter();
		try{
			Class.forName("org.postgresql.Driver");
			createUserImagesFolder(getUserImagesPath(request));

			String title = request.getParameter("title");
			String year = request.getParameter("year");
			String plot = request.getParameter("plot");
			String[] genres = request.getParameterValues("genres[]");
			String[] actors = request.getParameterValues("actor[]");
			String director = request.getParameter("director");
			String picture = getRelativeUploadedFilePath(request);


			CentralFacade central = (CentralFacade)request.getSession().getAttribute("centralfacade");
			
			MovieFacade movieFacade = new MovieFacade(central);
			
			Movie movie = movieFacade.registerMovie(title, year, plot, director, picture);

			String movieID = String.valueOf(movie.getId());

			int i;
			for(i = 0; i < genres.length; i++){
				
				movieFacade.addGenre(movieID, Genre.getEnumByKey( Integer.valueOf( genres[i] ) ) );
			}
			for(i = 0; i < actors.length; i++){
				
				movieFacade.addActor(movieID, actors[i]);
			}

			uploadFile(request, getFinalUploadedFilePath(request, getUserImagesPath(request)));

			request.setAttribute("filmecadastrado", "true");

			goToPage("/cadastrarfilme.jsp", request, response);


			
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
		/*catch(ParseException e ){
			pw.println("<html><body><h1>"+e+"</h1></body></html>");
		}*/
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

	private String getImageType(Part filePart){
		if( filePart.getContentType().toLowerCase().contains("jpg") )
			return ".jpg";
		else if( filePart.getContentType().toLowerCase().contains("png") )
			return ".png";
		else if( filePart.getContentType().toLowerCase().contains("bmp") )
			return ".bmp";
		else if( filePart.getContentType().toLowerCase().contains("jpeg") )
			return ".jpeg";
		return "";
	}


	private String getRelativeUploadedFilePath(HttpServletRequest request) throws IOException, ServletException{
		Part filePart = request.getPart("picture");
        String fileName = ( request.getParameter("title") + getImageType(filePart) ).replaceAll("\\s+", "");
        return IMAGES_DIR + File.separator + fileName;
	}

	private String getFinalUploadedFilePath(HttpServletRequest request, String userImagesPath) throws IOException, ServletException {
		Part filePart = request.getPart("picture");
      	String fileName = ( request.getParameter("title") + getImageType(filePart) ).replaceAll("\\s+", "");
        return userImagesPath + File.separator + fileName;
	}

	private void uploadFile(HttpServletRequest request, String finalUploadFilePath )throws IOException, ServletException{
		Part filePart = request.getPart("picture");
        String fileName = ( request.getParameter("title") + getImageType(filePart) ).replaceAll("\\s+", "");
        filePart.write(finalUploadFilePath);
        
	}

	


}