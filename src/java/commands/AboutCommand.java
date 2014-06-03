package commands;

import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.bank.contract.dto.CustomerSummary;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import security.SecurityRole;
import servlets.Factory;

public class AboutCommand extends TargetCommand {

    public AboutCommand(String target, List<SecurityRole> roles) {
        super(target, roles);
    }

    @Override
    public String execute(HttpServletRequest request) {
        BankManager manager = Factory.getInstance().getManager();
        Collection<CustomerSummary> customers = manager.listCustomers();
        int number = manager.getCustomerCount();
        
        request.setAttribute("customers", customers);
        request.setAttribute("number", number);
        
        return super.execute(request); //To change body of generated methods, choose Tools | Templates.
    }

}
