package commands;

import dk.cphbusiness.bank.contract.dto.CustomerDetail;
import dk.cphbusiness.dummy.bank.model.Person;
import javax.servlet.http.HttpServletRequest;
import servlets.Factory;
import java.util.List;
import security.SecurityRole;

/**
 * @author Lars Mortensen
 */
public class SaveCustomerCommand extends TargetCommand {

  public SaveCustomerCommand(String target, List<SecurityRole> roles) {
    super(target, roles);
  }

  @Override
  public String execute(HttpServletRequest request) {
    String cpr = request.getParameter("cpr");
    String title = request.getParameter("title");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String street = request.getParameter("street");
    String postalCode = request.getParameter("postalCode");
    String postalDistrict = request.getParameter("postalDistrict");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    

    CustomerDetail cust = new CustomerDetail(cpr, title, fname, lname, street, postalCode, postalDistrict, phone, email);
    
    Factory.getInstance().getManager().saveCustomer(cust);
    
    return super.execute(request); 
  }
}
