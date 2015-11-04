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


public class PathUtils extends HttpServlet{

	
	public static final String IMAGES_DIR = "userimages";
	
	

	public static String fixPath(String in){
		String out = in.replaceAll("\\\\", "/");
		return out;
	}

	public static void createUserImagesFolder(String userImagesPath) throws ServletException, IOException{
		File fileSaveDir = new File(userImagesPath);
		if(!fileSaveDir.exists())
			fileSaveDir.mkdirs();
	}

	public static String getAppPath(HttpServletRequest request) throws ServletException{
		return request.getServletContext().getRealPath("");
	}


	public static String getUserImagesPath(HttpServletRequest request) throws ServletException{
		String appPath = request.getServletContext().getRealPath("");
		String uploadFilePath = appPath + File.separator + IMAGES_DIR;
		return uploadFilePath;
	}


	public static String getRelativeUploadedFilePath(HttpServletRequest request) throws IOException, ServletException{
		Part filePart = request.getPart("picture");
        String fileName = request.getParameter("nickName").trim() + ".jpg";
        return IMAGES_DIR + File.separator + fileName;
	}

	public static String getFinalUploadedFilePath(HttpServletRequest request, String userImagesPath) throws IOException, ServletException {
		Part filePart = request.getPart("picture");
        String fileName = request.getParameter("nickName").trim() + ".jpg";
        return userImagesPath + File.separator + fileName;
	}

	public static void uploadFile(HttpServletRequest request, String finalUploadFilePath )throws IOException, ServletException{
		Part filePart = request.getPart("picture");
        String fileName = request.getParameter("nickName").trim() + ".jpg";
        filePart.write(finalUploadFilePath);
        
	}

}