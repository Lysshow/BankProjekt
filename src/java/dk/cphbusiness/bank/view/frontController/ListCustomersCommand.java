/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dk.cphbusiness.bank.view.frontController;

import dk.cphbusiness.bank.contract.BankManager;

import dk.cphbusiness.bank.contract.dto.CustomerSummary;
import dk.cphbusiness.bank.view.Factory;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Shandi
 */
public class ListCustomersCommand extends TargetCommand{
    
    public ListCustomersCommand(String target) {
    super(target);
    }

  @Override
  public String execute(HttpServletRequest request) {
    BankManager manager = Factory.getInstance().getManager();
    Collection<CustomerSummary> customers = manager.listCustomers();

    
    request.setAttribute("customers", customers);
    request.setAttribute("message", "Number of customers available: ");
   
    
    return super.execute(request);
    }
  
  
  
  }

    

