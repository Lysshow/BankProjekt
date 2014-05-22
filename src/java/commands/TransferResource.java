/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package commands;

import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.bank.contract.dto.AccountIdentifier;
import dk.cphbusiness.bank.contract.dto.TransferRequest;
import dk.cphbusiness.bank.contract.dto.TransferResponse;
import dk.cphbusiness.bank.contract.eto.InsufficientFundsException;
import dk.cphbusiness.bank.contract.eto.NoSuchAccountException;
import dk.cphbusiness.bank.contract.eto.TransferNotAcceptedException;
import java.math.BigDecimal;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Path;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import servlets.Factory;

/**
 * REST Web Service
 *
 * @author Mads
 */
@Path("transfer")
public class TransferResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of GenericResource
     */
    public TransferResource() {
    }

    @POST
    @Consumes("application/json")
    @Produces("application/json")
    public TransferResponse create(TransferRequest transfer) {

        BigDecimal amount = transfer.getAmount();
        AccountIdentifier source = new AccountIdentifier(transfer.getSource().getReg(),transfer.getSource().getNumber());
        AccountIdentifier target = new AccountIdentifier(transfer.getTarget().getReg(),transfer.getTarget().getNumber());

        BankManager manager = Factory.getInstance().getManager();
        try {
            manager.transferAmount(amount, source, target);
        } catch (NoSuchAccountException ex) {
            Logger.getLogger(TransferResource.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransferNotAcceptedException ex) {
            Logger.getLogger(TransferResource.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InsufficientFundsException ex) {
            Logger.getLogger(TransferResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new TransferResponse(true, "OK!");
    }

// Kode når du tester
//    {
//"amount": 100.200,
//"source": {"reg":4711, "number": 12345678},
//"target": {"reg":4711, "number": 12345678}
//}
}
