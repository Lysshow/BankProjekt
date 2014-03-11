package commands;

import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.bank.contract.dto.CustomerDetail;
import dk.cphbusiness.bank.contract.dto.CustomerIdentifier;
import dk.cphbusiness.bank.contract.dto.CustomerSummary;
import dk.cphbusiness.bank.contract.eto.NoSuchCustomerException;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import security.SecurityRole;
import servlets.Factory;

public class EditCustomerCommand extends TargetCommand {

    public EditCustomerCommand(String target, List<SecurityRole> roles) {
        super(target, roles);
    }

    @Override
    public String execute(HttpServletRequest request) {
        BankManager manager = Factory.getInstance().getManager();
        CustomerIdentifier customer = CustomerIdentifier.fromString(request.getParameter("cpr"));
        CustomerDetail customerDetail = null;
        
        try {
            customerDetail = manager.showCustomer(customer);
        } catch (NoSuchCustomerException ex) {
            Logger.getLogger(EditCustomerCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.setAttribute("customer", customerDetail);
        
        return super.execute(request);
    }

}
