package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Authenticator;
import java.net.HttpURLConnection;
import java.net.PasswordAuthentication;
import java.net.URL;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "WannabeKrak", urlPatterns = {"/WannabeKrak"})
public class WannabeKrak extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out;
        
        String server = "http://localhost:8080/WannabeKrak";
       
        String command = request.getParameter("command");
        
        if (command.toLowerCase().contains("autofill")) {
            String phone = request.getParameter("phone");
            String parameter = phone;
            String restResource = "/service/person/";
            String mime = "application/json";
            String val = callRest(server, restResource, parameter, mime, "GET");
        try{ 
            out = response.getWriter();
            out.println(val);
            }
         catch(Exception e){
           System.out.println("Problem"+e);
       }}

        else if (command.toLowerCase().contains("count")) {
            String parameter = "";
            String restResource = "/service/request/thisuser";
            String mime = "text/plain";
            String val = callRest(server, restResource, parameter, mime, "GET");
        try{
            out = response.getWriter(); 
            out.println(val);
            
        }
         catch(Exception e){
           System.out.println("Problem");
       }}
        else {
            //Not a valid response
            out = response.getWriter();
            out.println("\t\t Not a valid command or query!");
        }
      
    }


    private static String callRest(String server, String restResource, String parameter, String mime, String method) {
        String data = "";
        try {
            URL url = new URL(server + restResource + parameter);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod(method);
            Authenticator.setDefault(new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("group-e", "test".toCharArray());//Add your team password here 
                }
            });
            conn.setRequestProperty("Accept", mime);
            if (conn.getResponseCode() != 200) {
                throw new RuntimeException("Failed: HTTP Response Code= " + conn.getResponseCode());
            }
            Scanner scan = new Scanner(conn.getInputStream());
            while (scan.hasNextLine()) {
                data += scan.next();
            }
            conn.disconnect();
        } catch (IOException | RuntimeException e) {
            System.out.println("Error: " + e);
        }
        return data;
    }

//    public static void main(String[] args) {
//        String server = "http://datdb.cphbusiness.dk:8080/KrakRemote";
//        String parameter = "";
//        String restResource = "/service/person/";
//        String mime = "application/json";
//        String val = callRest(server, restResource, parameter, mime, "GET");
//        System.out.println(val);
//
//    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
