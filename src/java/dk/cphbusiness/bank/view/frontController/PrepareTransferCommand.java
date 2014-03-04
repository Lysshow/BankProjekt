package dk.cphbusiness.bank.view.frontController;

import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.bank.contract.dto.AccountDetail;
import dk.cphbusiness.bank.contract.dto.AccountIdentifier;
import dk.cphbusiness.bank.contract.dto.AccountSummary;
import dk.cphbusiness.bank.view.Factory;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;

public class PrepareTransferCommand extends TargetCommand{

    public PrepareTransferCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) {
        BankManager manager = Factory.getInstance().getManager();
        
        Collection<AccountSummary> summary = manager.listAccounts();

        request.setAttribute("message", "Lort");
        request.setAttribute("summary", summary);
        
        return super.execute(request);
    }
    
    
}
