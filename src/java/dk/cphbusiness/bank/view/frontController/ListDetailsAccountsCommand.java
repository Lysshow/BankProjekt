/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.bank.view.frontController;

import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.bank.contract.dto.AccountDetail;
import dk.cphbusiness.bank.contract.dto.AccountIdentifier;
import dk.cphbusiness.bank.view.Factory;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Shandi
 */
public class ListDetailsAccountsCommand extends TargetCommand {

    public ListDetailsAccountsCommand(String target) {
        super(target);
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
