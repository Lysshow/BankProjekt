package dk.cphbusiness.bank.view.frontController;

import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.bank.contract.dto.AccountDetail;
import dk.cphbusiness.bank.contract.dto.AccountIdentifier;
import dk.cphbusiness.bank.contract.eto.InsufficientFundsException;
import dk.cphbusiness.bank.contract.eto.NoSuchAccountException;
import dk.cphbusiness.bank.contract.eto.TransferNotAcceptedException;
import dk.cphbusiness.bank.view.Factory;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Mads
 */
public class TransferCommand extends TargetCommand{

    public TransferCommand(String target) {
        super(target);
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
            request.setAttribute("cpr", request.getParameter("cpr"));
        return super.execute(request);
    }
    
    

}
