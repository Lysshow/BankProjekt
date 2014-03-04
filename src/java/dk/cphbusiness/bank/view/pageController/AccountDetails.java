/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dk.cphbusiness.bank.view.pageController;

import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.bank.contract.dto.AccountDetail;
import dk.cphbusiness.bank.contract.dto.AccountIdentifier;
import dk.cphbusiness.bank.view.Factory;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Shandi
 */

    
    @WebServlet(name = "ListAccounts", urlPatterns = {"/ListAccounts"})
public class AccountDetails extends HttpServlet {

  @Override
  protected void service(
      HttpServletRequest request,
      HttpServletResponse response
      ) throws ServletException, IOException {
      BankManager manager = Factory.getInstance().getManager();
    
    
    AccountIdentifier ai = AccountIdentifier.fromString(request.getParameter("accountNR"));
    AccountDetail history = manager.showAccountHistory(ai);
    
    
    
    request.setAttribute("history", history);
    request.setAttribute("message", "These are the details of the account");
    
 
    
   RequestDispatcher dispatcher = request.getRequestDispatcher("account-details.jsp");
    dispatcher.forward(request, response);
}
    }

