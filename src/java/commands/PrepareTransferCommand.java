package commands;

import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.bank.contract.dto.AccountSummary;
import dk.cphbusiness.bank.contract.dto.CustomerIdentifier;
import servlets.Factory;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import security.SecurityRole;

public class PrepareTransferCommand extends TargetCommand{

    public PrepareTransferCommand(String target, List<SecurityRole> roles) {
        super(target, roles);
    }

    @Override
    public String execute(HttpServletRequest request) {
        BankManager manager = Factory.getInstance().getManager();
        
        Collection<AccountSummary> summary = manager.listAccounts();
        
        CustomerIdentifier customer = CustomerIdentifier.fromString(request.getParameter("cpr"));
        Collection<AccountSummary> accounts = manager.listCustomerAccounts(customer);
        String account = request.getParameter("selectedAccount");
        
        
        request.setAttribute("cpr", request.getParameter("cpr"));
        request.setAttribute("ownAccount", accounts);
        request.setAttribute("selected", account);
        request.setAttribute("summary", summary);
        
        return super.execute(request);
    }
    
    
}
