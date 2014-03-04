package dk.cphbusiness.bank.view.pageController;

import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.bank.contract.dto.AccountIdentifier;
import dk.cphbusiness.bank.contract.dto.AccountSummary;
import dk.cphbusiness.bank.contract.dto.CustomerIdentifier;
import dk.cphbusiness.bank.contract.dto.CustomerSummary;
import dk.cphbusiness.bank.view.Factory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ListAccounts", urlPatterns = {"/ListAccounts"})
public class ListAccounts extends HttpServlet {

  @Override
  protected void service(
      HttpServletRequest request,
      HttpServletResponse response
      ) throws ServletException, IOException {
    BankManager manager = Factory.getInstance().getManager();
    CustomerIdentifier customer = CustomerIdentifier.fromString(request.getParameter("cpr"));
    
     Collection<CustomerSummary> customers = manager.listCustomers();

    Collection<AccountSummary> accounts = manager.listCustomerAccounts(customer);
    
    
    request.setAttribute("customers", customers);
    request.setAttribute("acounts", accounts);
    request.setAttribute("message", "This is a list of accounts");
    request.setAttribute("customer", customer);
   
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("account-list.jsp");
    dispatcher.forward(request, response);
    }

  
  
  }
