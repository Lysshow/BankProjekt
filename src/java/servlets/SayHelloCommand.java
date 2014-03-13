
package servlets;

import commands.TargetCommand;
import dk.cphbusiness.bank.contract.BankManager;
import java.util.List;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServletRequest;
import security.SecurityRole;


@Stateless
public class SayHelloCommand extends TargetCommand{

    public SayHelloCommand(String target, List<SecurityRole> roles) {
        super(target, roles);
    }

    @Override
    public String execute(HttpServletRequest request) {
        BankManager manager = Factory.getInstance().getManager();
        String greeting = manager.sayHello("Kurt");
        request.setAttribute("greeting", greeting);
        return super.execute(request); //To change body of generated methods, choose Tools | Templates.
    }

   
    
}
