/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package commands;

import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.bank.contract.dto.AccountDetail;
import dk.cphbusiness.bank.contract.dto.AccountIdentifier;
import java.util.List;
import servlets.Factory;
import javax.servlet.http.HttpServletRequest;
import security.SecurityRole;

/**
 *
 * @author Shandi
 */
public class ListDetailsAccountsCommand extends TargetCommand {

    public ListDetailsAccountsCommand(String target, List<SecurityRole> roles) {
        super(target, roles);
    }
    String amount, date, accountno;
    String[] parts;

    @Override
    public String execute(HttpServletRequest request) {
        BankManager manager = Factory.getInstance().getManager();

        AccountIdentifier ai = AccountIdentifier.fromString(request.getParameter("accountNR"));

        AccountDetail history = manager.showAccountHistory(ai);

        request.setAttribute("cpr", request.getParameter("cpr"));
        request.setAttribute("history", history);

        request.setAttribute("message", "These are the details of the account: ");

        return super.execute(request);
    }
}
