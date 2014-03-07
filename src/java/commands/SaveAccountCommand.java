package commands;

import dk.cphbusiness.bank.contract.dto.AccountDetail;
import dk.cphbusiness.bank.contract.dto.CheckingAccountDetail;
import dk.cphbusiness.bank.contract.dto.CustomerDetail;
import dk.cphbusiness.bank.contract.dto.CustomerIdentifier;
import dk.cphbusiness.bank.contract.eto.CustomerBannedException;
import dk.cphbusiness.bank.contract.eto.NoSuchCustomerException;
import java.math.BigDecimal;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import security.SecurityRole;
import servlets.Factory;

/**
 *
 * @author Mads
 */
public class SaveAccountCommand extends TargetCommand {

    public SaveAccountCommand(String target, List<SecurityRole> roles) {
    super(target, roles);
  }

    @Override
  public String execute(HttpServletRequest request) {

      String cpr = request.getParameter("cpr");
      double interest = Double.parseDouble(request.getParameter("interest"));
      
    
    CustomerIdentifier iden = new CustomerIdentifier(cpr);
    AccountDetail account = new CheckingAccountDetail(BigDecimal.valueOf(interest));
    
        try {
            Factory.getInstance().getManager().createAccount(iden, account);
        } catch (NoSuchCustomerException ex) {
            Logger.getLogger(SaveAccountCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (CustomerBannedException ex) {
            Logger.getLogger(SaveAccountCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
     return super.execute(request); 
  }
    
}
