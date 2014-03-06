package commands;

import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.bank.contract.dto.AccountSummary;
import dk.cphbusiness.bank.contract.dto.CustomerIdentifier;
import servlets.Factory;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import security.SecurityRole;

public class ListAccountsCommand extends TargetCommand {

  public ListAccountsCommand(String target, List<SecurityRole> roles) {
    super(target, roles);
    }

  @Override
  public String execute(HttpServletRequest request) {
    BankManager manager = Factory.getInstance().getManager();

   
    CustomerIdentifier customer = CustomerIdentifier.fromString(request.getParameter("cpr"));
    Collection<AccountSummary> accounts = manager.listCustomerAccounts(customer);


    request.setAttribute("accounts", accounts);
    request.setAttribute("message", "This is a list of accounts");
    request.setAttribute("customer", customer);
    
    return super.execute(request);
    }
  
  
  
  
  }
