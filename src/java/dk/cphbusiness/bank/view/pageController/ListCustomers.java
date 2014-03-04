package dk.cphbusiness.bank.view.pageController;

import dk.cphbusiness.bank.contract.BankManager;
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

@WebServlet(name = "ListCustomers", urlPatterns = {"/ListCustomers"})
public class ListCustomers extends HttpServlet {

  @Override
  protected void service(
      HttpServletRequest request,
      HttpServletResponse response
      ) throws ServletException, IOException {
    BankManager manager = Factory.getInstance().getManager();
    //CustomerIdentifier customer = CustomerIdentifier.fromString("121089-0987");
    Collection<CustomerSummary> customers = manager.listCustomers();
    
    request.setAttribute("customers", customers);
    request.setAttribute("message", "Number of customers available: ");
    //request.setAttribute("customer", customer);
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("customer-list.jsp");
    dispatcher.forward(request, response);
    }

}