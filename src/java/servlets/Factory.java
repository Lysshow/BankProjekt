package servlets;

import commands.Command;
import dk.cphbusiness.bank.contract.BankManager;
import dk.cphbusiness.dummy.bank.control.DummyBankManager;
import javax.servlet.http.HttpServletRequest;

public class Factory {
  private static final Factory instance = new Factory();
  private final BankManager manager;
  
  private Factory() {
    manager = new DummyBankManager();
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
  
  }
