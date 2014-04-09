package servlets;

import commands.Command;
import dk.cphbusiness.bank.contract.BankManager;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

public class Factory {
  @EJB
  private static final Factory instance = new Factory();
  private final BankManager manager;
  
  private Factory() {
    //manager = new DummyBankManager();
    manager = lookupBankManagerBeanRemote();
    }
  
  public static Factory getInstance() {
    return instance;
    }

  public Command getCommand(String cmdStr, HttpServletRequest request) {
      FrontController front = new FrontController();
      return front.getCommand(cmdStr, request);
  }
  
  public BankManager getManager() {
    return manager;
    }  

    private BankManager lookupBankManagerBeanRemote() {
        try {
            Context c = new InitialContext();
            return (BankManager) c.lookup("java:global/Backend/BankManagerBean!dk.cphbusiness.bank.contract.BankManager");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
  }
