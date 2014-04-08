package commands;

import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.bank.contract.dto.AccountIdentifier;
import dk.cphbusiness.bank.contract.dto.AccountSummary;
import dk.cphbusiness.bank.contract.dto.CustomerIdentifier;
import dk.cphbusiness.bank.contract.eto.InsufficientFundsException;
import dk.cphbusiness.bank.contract.eto.NoSuchAccountException;
import dk.cphbusiness.bank.contract.eto.TransferNotAcceptedException;
import servlets.Factory;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import security.SecurityRole;

/**
 *
 * @author Mads
 */
public class TransferCommand extends TargetCommand {

    public TransferCommand(String target, List<SecurityRole> roles) {
        super(target, roles);
    }

    @Override
    public String execute(HttpServletRequest request) {

        BankManager manager = Factory.getInstance().getManager();
        AccountIdentifier source = new AccountIdentifier(request.getParameter("fromAccount"));
        AccountIdentifier target = new AccountIdentifier(request.getParameter("toAccount"));
        BigDecimal amount = new BigDecimal(request.getParameter("amount"));

        try {
            manager.transferAmount(amount, source, target);
        } catch (NoSuchAccountException ex) {
            Logger.getLogger(TransferCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransferNotAcceptedException ex) {
            Logger.getLogger(TransferCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InsufficientFundsException ex) {
            Logger.getLogger(TransferCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

        CustomerIdentifier customer = CustomerIdentifier.fromString(request.getParameter("cpr"));
        Collection<AccountSummary> accounts = manager.listCustomerAccounts(customer);

        request.setAttribute("accounts", accounts);
        request.setAttribute("message", "This is a list of accounts");
        request.setAttribute("customer", customer);

        return super.execute(request);
    }

}
