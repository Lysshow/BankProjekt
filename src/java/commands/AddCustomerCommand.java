
package commands;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import security.SecurityRole;


public class AddCustomerCommand extends TargetCommand {

  public AddCustomerCommand(String target, List<SecurityRole> roles) {
    super(target, roles);
  }

  @Override
  public String execute(HttpServletRequest request) {
    return super.execute(request); //To change body of generated methods, choose Tools | Templates.
  }
  

}
