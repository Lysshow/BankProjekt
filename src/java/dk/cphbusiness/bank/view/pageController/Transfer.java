/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dk.cphbusiness.bank.view.pageController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mads
 */
@WebServlet(name = "Transfer", urlPatterns = {"/Transfer"})
public class Transfer extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Enumeration<String> parameter = request.getParameterNames();
        
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Transfer</title>");            
            out.println("</head>");
            out.println("<body>");

            out.println("<table border='1'><th>Name</th><th>Values</th>");

            while (parameter.hasMoreElements()) {

                String parametername = parameter.nextElement();
                String[] Values = request.getParameterValues(parametername);

                out.println("<tr><td>" + parametername + "</td>");
                if (Values.length == 1) {
                    out.println("<td>" + Values[0] + "</td>");
                } else{
                    String valgte = "";
                    for (String value : Values) {
                        valgte += value+", ";
                    }
                    out.println("<td>"+valgte+"</td>");
                }
                

            }
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
        }
    }



}
